
SynthDef(\sin, {|freq=200|
	Out.ar(0, SinOsc.ar(freq, 0, 0.2))
}).send(s);
	
//add	
w = w add: Synth(\sin);	

/////////do
//===========

////set one by one
w[0].set(\freq, 1200);

////set all
w do: _.set(\freq, 130);
//or
(w.numChannels).do{|i| w[i].set(\freq, 100);};

////free one by one
w[0].free;

////free all
w do: _.free; w = nil;
//or
(w.numChannels).do{|i| w[i].free; w = nil;};

//test
10 do: _.("1".postln;);
10.do{"1".postln;}
