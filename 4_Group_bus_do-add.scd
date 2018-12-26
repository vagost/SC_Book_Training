
SynthDef(\sin, { |freq = 300, amp = 0.1, out = 2|
	var source;	

	source = Mix.fill(20, {|i| SinOsc.ar(freq + i, 0, amp)});

	Out.ar(out, source)

}).send(s);

SynthDef(\lfo, { |out|
	
	Out.kr(out, SinOsc.kr(10).range(200, 300))

}).send(s);

SynthDef(\lfoamp, { |out|
	
	Out.kr(out, SinOsc.kr(1).range(0.05, 0.1))

}).send(s);


SynthDef(\limiter, { |input = 0|
	var source;
	source =  Limiter.ar(input, 0.4, 0.01);
	Out.ar(0, source)

}).send(s);

~lfobus = Bus.new(\control, 10, 1);
~lfoampbus = Bus.new(\control, 11, 1);
~limbus = Bus.new(\audio, 12, 1);


g = Group.new;

x = Synth.head(g, \sin, [\out, 0]);
y = Synth.tail(g, \lfo, [\out, ~lfobus]);
d = Synth.tail(g, \lfoamp, [\out, ~lfoampbus]);
l = Synth.tail(g, \limiter);


x.map(\freq, ~lfobus);
x.map(\amp, ~lfoampbus);
x.map(\out, ~limbus);


//With Proxy


~si = NodeProxy.audio(s, 1);
~si.source = {SinOsc.ar(200, 0, 1)};
~si.play;
~si.stop;


~li = NodeProxy.audio(s, 1);
~li.source = {Limiter.ar(~si.ar, 0.1, 0.01)};
~li.play;
~li.stop;


//:

SynthDef(\im, { |freq = 10, amp = 10, out = 0|
	var source;	

	source = Impulse.ar(freq, 0, amp);

	Out.ar(out, source)

}).send(s);

SynthDef(\sin, { |freq = 300, amp = 1, out = 0|
	var source;	

	source = SinOsc.ar(freq, 0, amp);

	Out.ar(out, source)

}).send(s);


SynthDef(\limiter, { |input = 0, out = 0|
	var source;
	source = Limiter.ar(In.ar(input), 0.1, 0.01);
	Out.ar(out, source)

}).send(s);

//:

~bus = Bus.audio(s, 1);
g = Group.new;

x = Synth.head(g, \im); 
f = Synth.head(g, \sin);

//Nice Trik!!!
[x, f].do{ |i| i.set(\out, ~bus)};

[x, f].do{ |i| i.free};

y = Synth.after(x, \limiter, [\input, ~bus]);

//or

g = Group.new;

x = Synth.head(g, \sin);
y = Synth.tail(g, \efe, [\input, ~bus]);
x.set(\out, ~bus);


//Add, pallapla do, Arrays

3.do{w = w add: {SinOsc.ar(300, 0, 0.1)}.play};

//freeAll
w do: _.free; w = nil;

//or
w.do{|i| i.free}; w = nil;

//or
w.numChannels.do{|i| w[i].free}; w = nil;

//or
w[0].free;
w[1].free;
w[2].free;
etc...
w = nil;

//Many Synth of one SynthDef and trasnform them 
SynthDef(\sin, {|freq = 400|
	Out.ar([0, 1], SinOsc.ar(freq, 0, 0.1))
}).send(s);
	
2.do{ q = q.add( Synth(\sin); ) };	

//sets
q[1].set(\freq, 200);
q[0].set(\freq, 202);

//free all
q.numChannels.do{|i| q[i].free};
q = nil;

//===================

10.do{d = d add: {[1, 2, 3, 4, 5, 6]}.value;}
d.numChannels;
d;
d = nil;

e = Pseq([1, 2, 3, 4, 5], inf).asStream;
r = 10.do{e.next;}



x = {SinOsc.ar}.play;
y = {SinOsc.ar(1000)}.play;

x.do{|i| i.free; };  
y.do{|i| i.free; };  


//True
3.do{x = x add: {SinOsc.ar}.play}
3.do{y = y add: {SinOsc.ar(1000)*0.1}.play}

d = [x ++ y];
//or
d = [x] ++ [y];
d.do{|i| i.do{|o| o.free;}};
d = nil;


d.numChannels.do{|i| d[i].free;}

d.numChannels.do{(d[i].free;).do{|i| i.free;}};  

d.numChannels.do{|i| d[i].free;}

(d[0] ++ d[1]).do{|i| i.free;};  

d = d do: _.free
d = nil;
y = nil; x = nil;







