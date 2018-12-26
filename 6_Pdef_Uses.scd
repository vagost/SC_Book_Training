
/////////////////////////////////////////Pdef as stream reference
//ta paizei me tin seira, otan teleionei to ena arxizei to allo

x = Pseq([Pdef(\a), 1, Pdef(\b), 1, Pdef(\c), 1], inf).play;

Pdef(\a, Pbind(\dur, 0.25, \degree, Pseq(#[10, 15, 14, 13], 1)));
Pdef(\b, Pbind(\dur, 0.125, \degree, Pseq(#[1, 2, 3, 2], 1)));
Pdef(\c, Pbind(\dur, 0.25, \degree, Pseq(#[10, 15, 20], 2)));

//Etsi Xekinane Mazi
Pdef(\a).play; Pdef(\b).play; Pdef(\c).play;

//Modulate Pdef(\c)
e = Pdef(\c, Pbind(\dur, 0.25, \degree, Pseq(#[4, 3, 1, 2]*3, inf))).play;
Pdef(\c).set(\detune, 0);


////////////////////////////////////////////////////////////////Ppar: ------- Some streams start together

//Test_1
Ppar([
Ê Ê Pbind(
Ê Ê Ê Ê \dur, Prand([0.2, 0.4, 0.6], inf),
Ê Ê Ê Ê \midinote, Prand([72, 74, 76, 77, 79, 81], inf),
Ê Ê Ê Ê \db, -26,
Ê Ê Ê Ê \legato, 1.1
Ê Ê ),
Ê Ê Pseq([
Ê Ê Ê Ê	Pbind(\dur, 3.2, \freq, Pseq([2, 3, 5].midicps) ),//this used as stop, low midi values
Ê Ê Ê Ê Prand([
Ê Ê Ê Ê Ê Ê Ppar([
Ê Ê Ê Ê Ê Ê Ê Ê Pbind(\dur, 0.2, \pan, Ê0.5, \midinote, Pseq([60, 64, 67, 64])),
Ê Ê Ê Ê Ê Ê Ê Ê Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([48, 43]))
Ê Ê Ê Ê Ê Ê ]),
Ê Ê Ê Ê Ê Ê Ppar([
Ê Ê Ê Ê Ê Ê Ê Ê Pbind(\dur, 0.2, \pan, Ê0.5, \midinote, Pseq([62, 65, 69, 65])),
Ê Ê Ê Ê Ê Ê Ê Ê Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([50, 45]))
Ê Ê Ê Ê Ê Ê ]),
Ê Ê Ê Ê Ê Ê Ppar([
Ê Ê Ê Ê Ê Ê Ê Ê Pbind(\dur, 0.2, \pan, Ê0.5, \midinote, Pseq([64, 67, 71, 67])),
Ê Ê Ê Ê Ê Ê Ê Ê Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([52, 47]))
Ê Ê Ê Ê Ê Ê ])
Ê Ê Ê Ê ], 12)
Ê Ê ], inf).play;
], 1).play;
)

//Test_2_Se ena Pdef polla Pbinds
//:--
Pdef(\c, Ppar([

	Pbind(\dur, 0.2, \pan, Ê0.5, \midinote, Pseq([60, 64, 67, 64])),
Ê Ê ÊPbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([48, 43])),
	Pbind(\dur, 0.8, \pan, -0.5, \midinote, Pseq([48, 43])),
	Pbind(\dur, 1.6, \pan, -0.5, \midinote, Pseq([28]))


], 10));
//:--
Pdef(\c).play;

//:--
Pdef(\y, 

		Ppar([
		
		Pbind(
		\dur, 1,
		\freq, Pseq([148, 50, 40, 100]*4, inf),
		\amp, 0.2)
,
		Pbind(
		\dur, 1/2,
		\freq, Pseq([148, 150, 300, 148]*2, inf),
		\amp, 0.2)

,
		Pbind(
		\dur, 1/4,
		\freq, Pseq([148, 50, 30, 248, 648, 500, 130, 248], inf),
		\amp, 0.2)

,		
		Pbind(
		\dur, 1/8,
		\freq, Pseq([148, 50, 30, ~f_3]*4, inf),
		\amp, 0.1),
/*,
		Pbind(
		\dur, 1/16,
		\freq, Pseq([148, 50, 30, 148]*4, inf),
		\amp, 0.04)
,
		Pbind(
		\dur, 1/32,
		\freq, Pseq([148, 50, 30, 148]*1, inf),
		\amp, 0.02)
,*/
		Pbind(
		\dur, 1/4,
		\freq, Pseq([148, 100, 800, ~b_2]*2, inf),
		\amp, 0.1)		
		
		]
));
//:--
Pdef(\y).play;

/////////////////////////////////////////////////////////////////Ptpar: ------ A Ptpar pattern includes a start time parameter before each subpattern which allow the subpatterns to be started at some time delay within the pattern. The start time is given in beats.


Ptpar(
	[
	1.0,	Pbind(\dur, 0.2, \pan, Ê0.5, \midinote, Pseq([60, 64, 67, 64])),
Ê Ê 	2.0, Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([48, Beats(2, 50)])),//Beats = 2 fores tha paixei 50
Ê Ê 	4.0, Pbind(\dur, 0.8, \pan, -0.5, \midinote, Pseq([48, 43])),
Ê Ê 	6.0, Pbind(\dur, 1.6, \pan, -0.5, \midinote, Pseq([28]))
	], inf
).play;


////////////////////////San to send tags, san ena fork mesa se ena xtipo kai dio pragmata mazi se ena xtipo

//:Like chords

Pdef(\a, Pbind(
			\dur, 1/2, 
			\freq, Pseq(#[100, 150, 140, 130, [2000, 1300, 4000]], inf),
			\amp, Pseq(#[1, 1, 1, 1, 1], inf)  //h -->   \amp, Pseq(#[1, 1, 1, 1, [0.5, 1, 0.5]], inf)
)
).play;

//:--

Pdef(\a, Pbind(
			\dur, 1/2, 
			\freq, Pseq([100, 150, 140, 130, Pn(Pseq([100], 1), 1)], inf),
			\amp, Pseq([1, 1, 1, 1, 1], inf)
)
).play;

//:Like fork inside the SendTag

Pdef(\a, Pbind(
			\dur, Pseq([1, 1, 1, 1, Pseq([1/4], 4)], inf), 
			\freq, Pseq([100, 150, 140, 130, Pseq([2000, 1000, 4000, 3000], 1)], inf),
			\amp, Pseq([1, 1, 1, 1, Pseq([1, 1, 1, 1], 1)], inf))
).play;

//:--

//////////////////////////////////////////////////For example: Do 2 times something and then for 1 time something else

Pdef(\a, Pbind(
			\dur, Pseq([Pseq([1, 1/2, 3/2, 1], 2), Pseq([1, 1/2, 3/2, 1]/2, 1)], inf), //!!!
			\freq, Pseq([100, 150, 140, 130], inf),
			\amp, Pseq([1, 1, 1, 1, Pseq([1, 1, 1, 1], 1)], inf))
).play;


/////////////////////////////////////////////Gia na min mperdeuei otan kaneis re - evaluate 

(var quant = #[4, 0, 0, 1];
Pdef(\x).quant_(quant);
)

Pdef(\x).play;

/////////////////////////////////////////////Gia na paizei kateitheian

Pdef(\x).quant = 0;

/////////////////////////////////////////////Gia fade

Pdef(\x).fadeTime = 8;

