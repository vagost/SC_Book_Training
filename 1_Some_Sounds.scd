

10.do{
	|se|
	se.postln;
};

//Yield pg. 85
//===============
//:

r = Routine({
	x = Synth(\default, [\freq, 76.midicps]);
	1.wait;
	
	x.release(0.1);
	y = Synth(\default, [\freq, 73.midicps]);
	"Waiting...".postln;	
	nil.yield;
	
	y.release(0.1);
	z = Synth(\default, [\freq, 69.midicps]);	2.wait;
	z.release;
	
	});

//:

r.play;

r.play;


//Fold
//===============

//
{LFNoise1.ar(XLine.kr(100, 200, 10), 0.1, XLine.kr(0.1, 2, 10)).fold2(SinOsc.ar(XLine.kr(100, 2000, 10)).range(0, 10.9)) ! 2/3}.play;

//
{LFNoise0.ar(20).lag(0.1).fold2(SinOsc.ar(400).range(0, 0.9)) ! 2}.play;
	
//
{LFPulse.ar(245).fold2(SinOscFB.ar(1077, 2).range(0, 0.9)) ! 2 * 0.3  }.play;

//
{LFNoise0.ar(20).lag(0.1).fold2(SinOsc.ar(400).range(0, 0.9)) ! 2}.play;
	
//
g = {SinOsc.ar(Saw.ar(100).range(80, 100)).fold2(SinOscFB.ar(0.1, 1.4).range(0, 1))!2 * 0.2}.play;
g.free;
//
g = {SinOscFB.ar(80, 0.2).fold2(SinOscFB.ar(0.01, 2).range(0, 1))!2 * 0.05}.play;
g.free;
//
g = {LFNoise1.ar(80, LFNoise1.ar(10).range(0, 0.4)).fold2(SinOscFB.ar(10, 1).range(0, 100))!2 * 2.4}.play;
g.free;

//Proxies
//===============

g = NodeProxy.audio(s, 2);	

g.source = {LFNoise1.ar(80, LFNoise0.ar(10).range(0, 0.4)).fold2(SinOscFB.ar(10, 1).range(0, 100))!2 * 2.4};
g.play;
g.free;

	
g = NodeProxy.audio(s, 2);	

g.source = {Mix.fill(40, {|i, harm = 100.62| i = i/harm; SinOscFB.ar(40 + i, 1, 0.01).fold2(SinOscFB.ar(SinOsc.ar(100 + i, 0 + i).range(0.1, 1), LFNoise0.kr(10).range(0, 2)).range(0, 1))})!2*2};

g.play;
g.free;

w = NodeProxy.audio(s, 2);	

w.source = {Mix.fill(40, {|i, harm = 2.61| i = i/harm; SinOsc.ar(1080 + i, 0.1, 0.001).fold2(SinOscFB.ar(SinOscFB.ar(100 + i, 0 + i).range(0.1, 1), LFNoise1.kr(0.1).range(0, 2)).range(0, 1))})!2*3.3};

w.fadeTime = 2;
w.play;
w.free;

f = NodeProxy.audio(s, 2);	

f.source = {Mix.fill(40, {|i, harm = 20.61| i = i/harm; SinOsc.ar(180 + i, 0.1, 0.001).fold2(SinOscFB.ar(SinOscFB.ar(100 + i, 0 + i).range(0.1, 1), LFNoise1.kr(0.1).range(0, 2)).range(0, 1))})!2*14.3};

f.fadeTime = 2;
f.play;
f.free;


t = NodeProxy.audio(s, 2);	

t.source = {Mix.fill(20, {|i, harm = 10.61| i = i/harm; LFPulse.ar([1080, 1000, 1] + i, 0.1, 0.01).fold2(PinkNoise.ar(SinOscFB.ar(100 + i, 0 + i).range(0.1, 1), Dust.kr(1.3).range(0, 2)).range(0, 1))})!2*0.01*LFNoise0.ar(10).range(0.1, 1)*14}; 

t.fadeTime = 4;
t.play;
t.free;



//New_Extreme--Stuff

g = NodeProxy.audio(s, 2);	
g.source = {LFNoise1.ar(1, LFNoise0.ar(10).range(0, 10.4)).fold2(LFNoise1.ar(10, 1).range(0, 100).fold2(LFNoise0.ar(10, 1).range(0, 1)))!2 * 0.1};
g.play;
g.free;


g = NodeProxy.audio(s, 2);	
g.source = {LFNoise1.ar(1, LFNoise0.ar(10).range(0, 10.4)).fold2(LFNoise1.ar(10, 1).range(0, 100).fold2(LFNoise1.ar(10, 1).range(0, 1)))!2 * 0.1};
g.play;
g.free;


g = NodeProxy.audio(s, 2);	
g.source = {LFNoise1.ar(1000, LFNoise0.ar(10).range(0, 10.4)).fold2(LFNoise1.ar(10, 1).range(0, 10).fold2(LFNoise1.ar(10, 1).range(0, 1)))!2 * 0.1};
g.play;
g.free;


g = NodeProxy.audio(s, 2);	
g.source = {LFNoise1.ar(LFNoise0.kr(10).range(1, 1000), LFNoise0.ar(10).range(0, 100.4)).fold2(LFNoise1.ar(10, 1).range(0, 10).fold2(LFNoise1.ar(10, 1).range(0, 1)))!2 * 0.1};
g.play;
g.free;


e = NodeProxy.audio(s, 2);	
e.source = {LFNoise1.ar(Dust.kr(1).range(1, 1), LFPulse.ar(10, Impulse.kr(1).range(0, pi), 0.7).range(0, 1000.4)).fold2(LFNoise0.ar(10, 1).range(0, 10).fold2(LFNoise0.ar(10, 1).range(0, 1)))!2 * 0.1};
e.play;
g.free;


g = NodeProxy.audio(s, 2);	
g.source = {LFNoise1.ar(Dust.kr(1).range(1, 1), LFPulse.ar(10, 0, 1).range(0, 1000.4)).fold(LFNoise0.ar(10, 1).range(0, 10).fold(LFNoise0.ar(10, 1).range(0, 1)))!2 * 0.1};
g.play;
g.free;


f = NodeProxy.audio(s, 2);	
f.source = {FreeVerb.ar([[g.ar, e.ar], [g.ar, e.ar]], Line.kr(0, 1, 25), 1, 1, 0.5)};
f.fadeTime = 10;
f.play;
f.free;
































