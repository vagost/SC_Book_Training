//:

e = NodeProxy.audio(s, 2);
e.source = {|pan = 0| Mix.fill(10, {|i| Pan2.ar(SinOsc.ar(200+i, 0, 0.1), SinOsc.ar(1).range(-1.1, 1.1), 1)})};
e.play;
e.stop;

e = NodeProxy.audio(s, 2);
e.source = {|pan = 0| Mix.fill(10, {|i| Pan2.ar(SinOsc.ar(200+i, 0, 0.1), pan, 1)})};
e.play;

e.fadeTime = 1;
e.free;

//:

{
var mova;
	mova = SinOsc.ar(99).range(-1.1, 1.1);	
	SendReply.kr(Impulse.kr(10), \pare, mova);

}.play;

//:The Responder

o.remove; 
o = OSCresponder(nil, 'pare', { |t, r, msg| 
	msg[3].postln; ~pos = msg[3];
	e.set(\pan, ~pos);

}).add;


//:
t = TempoClock.new;
t.tempo = 1;
//:
r = Routine{
	u = Pseq([-0.1, 0.1, 1, -1, 0, -0.5, 0.5], inf).asStream;
	inf.do{
		~pos = u.next.value;
		e.set(\pan, ~pos);
		~pos.postln;
		0.3.wait;
		}
	}
//:	
r.play(t);	
r.stop;	

t.tempo = 1.2;

//:With Modulation via Groups and Busses

SynthDef(\sin, { |pan = 0, freq = 200|
	var source;
	source = Mix.fill(10, {|i| Pan2.ar(SinOsc.ar(freq+i, 0, 0.1), pan, 1)});
	Out.ar(0, source);
	
}).send(s);

SynthDef(\sinPan, { 
	var source;
	source = SinOsc.kr(1, pi/2).round(-1.1, 1.1);
	Out.kr(0, source);
}).send(s);

//:Only with Bus

~bus = Bus.new(\control, 0, 1, s);
a = Synth(\sin);
b = Synth(\sinPan, [\out, ~bus])
a.map(\pan, ~bus);

//:With_Group

~bus = Bus.new(\control, 0, 1, s);
g = Group.new;
a = Synth.tail(g, \sin);
b = Synth.tail(g, \sinPan, [\out, ~bus]);
a.map(\pan, ~bus);















