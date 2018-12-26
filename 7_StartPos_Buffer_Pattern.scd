b = Buffer.read(s, "/Users/vagelis/Desktop/SOUND_BANK/Beta-Decay_Cello_Electronics.wav");
//:
SynthDef(\buf, {|startp = 1, ipod = 1, pos = 0|
	var source, env, sec, bufnum = b;
		sec = BufDur.ir(b);
		pos = sec * ipod * 44100;
		source = PlayBuf.ar(1, b, BufRateScale.kr(b), trigger: 0, startPos: pos, loop:0, doneAction:2); 
		env = EnvGen.ar(Env.perc(1, 0.2, 4, -4), doneAction:2);
		SendReply.kr(Impulse.kr(10), \pare, pos);
	Out.ar([0,1], source * env)
}).add;
//:
Synth(\buf);	
//:With startp
Pdef(\x, Pbind(
		\instrument, \buf,
		\dur, Pseq([1, 1/2, 3/2, 1, 30, 1, 1/2, 9, 10]/40, inf),
		\startp, Pseq([80, 1, 2, 10, 1, 0, 1060]*44100, inf)
));
//:With startp
Pdef(\x, Pbind(
		\instrument, \buf,
		\dur, Pseq([1], inf),
		\startp, Pseq([130, 60, 400, 592]*44100, inf)
));
//:With ipod set range(0, 1)
Pdef(\x, Pbind(
		\instrument, \buf,
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\ipod, Pseq([0.1, 0.001, 0.2, 0.7], inf)
));
//:
Pdef(\x).play;
//:
o.remove; 
o = OSCresponder(nil, 'pare', { |t, r, msg| 
	msg.postln;
}).add;
//:

PTechno.synthDefs;
PTechno.synths;
PTechno.buses;

Pdef(\x, Pbind(
		\instrument, \lypat01,
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\ipod, Pseq([0.1, 0.001, 0.2, 0.7], inf)
));

Pdef(\y, Pbind(
		\instrument, \wah,
		\dur, Pseq([1, 1/2, 3/2, 1], inf),
		\ipod, Pseq([0.1, 0.001, 0.2, 0.7], inf)
));

Pdef(\y).play;
Pdef(\y).stop;
Pdef(\x).play;