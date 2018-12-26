
//Routines & App, SystemClocks
//==========================

//Notice: to routine.play einai shortcut tou SystemClock.sched(0, r);
	
r = Routine{
	1.do{"ffo".postln;
	1.wait;
	"ffo1".postln;
	1.wait;
	"ffo2".postln;
	1.wait;
}	
};
	
AppClock.sched(0, {{r.play;}.defer;});	

//or

SystemClock.sched(0, r);	

//:

r.play
r.stop
r.resume

//:

r = Routine{
	1.do{
	10.wait;
	1000.yield;
	1.wait;
	200.yield;
}	
};

//:Change SinOsc's freq via Routine

r = Routine{
	inf.do{
	150.yield;
	200.yield;
	300.yield;
	400.yield;
	500.yield;
}	
};

fork{
	inf.do{
		g = {SinOsc.ar(r.value, 0, 0.1)}.play;
		1.wait;
		g.free;
		2.wait;
		}
	
	}


//:

a = Pseq((1..8)*100, inf).asStream;

r = Routine{
	inf.do{
	a.next;
	}	
};

fork{
	inf.do{
		g = {SinOsc.ar(a, 0, 0.1)}.play;
		1.wait;
		g.free;
		2.wait;
		}
	
	}
	
//:

r = Routine{
	"foo".postln;
	1.yield;
	};
t = Routine{
	"bar".postln;
	1.yield;
	};

SystemClock.sched(0,{SystemClock.sched(2, r); SystemClock.sched(0, t); })

//:

o = TempoClock.new;
o.tempo = 2;

r = Routine{
	inf.do{
	"er".postln;
	1.yield;
	}	
};
r.play(o);

//:

o = TempoClock.new;
o.tempo = 2;

{
	inf.do{
		"er".postln;
		1.yield;
	}	
}.fork(o);

//:
//Notice: Opos kai sta Clock to nil simainei stamato, etsi kai stis routines, otan xanakano evaluate sinexizei apo ekei pou stamatise

r = Task{
	inf.do{
	
	1.yield;
	"1".postln;
	1.yield;
	"2".postln;
	1.yield;
	"3".postln;
	nil.yield;
	"4".postln;
	1.yield;
	"5".postln;
	1.yield;
	"6".postln;
	nil.yield;
	
	}
};

//:
r.play;	
r.reset;	//going to the start
//:	

//Notice: To resume douleuei mono sto Task

r = Task{
	inf.do{
	
	1.yield;
	"1".postln;
	1.yield;
	"2".postln;
	1.yield;
	"3".postln;
	nil.yield;
	"4".postln;
	1.yield;
	"5".postln;
	1.yield;
	"6".postln;
	nil.yield;
	
	}
};

//:
r.play;	
r.resume;	//sinexizei apo ekei pou emeine
//:	


//Switch

//:

f = Task{ ~verbose = true;
	
	inf.do{
		
		~verbose.switch(
	
		true, { 
			
			1.do{
			"true".postln;
			0.5.wait;
			}		
		},
	
		false, { 
			
			1.do{
			"false".postln;
			0.5.wait;
			}
		}
	)
	
	}
}


//:

f.start;
f.stop;

~verbose = false;
~verbose = true;

//:




//Read and Play buffer-folder from Ram
//====================================


//////////Notice--> dio tropoi : 
//1 na ta grapso stin ram kai meta na ta paixo (gia mikra arxeia).
//2 na ta exago kateutheian apo to skliro (gia pio megala arxeia).

~paths = PathName.new("/Users/vagelis/Library/Application Support/SuperCollider/Sounds/*");

//or

~paths = "/Users/vagelis/Library/Application Support/SuperCollider/Sounds/*".asString;

//pathMatch, returns all paths contained on this string
//collect, returns an Array of SoundFile objects whose paths match the pattern.

f = ~paths.pathMatch.collect{|path| Buffer.read(s, path);}; 

f[1];
f[0].play;
f[1].free;b

d = {PlayBuf.ar(2, bufnum: 1, rate: 1, trigger: 0)}.play;
d = {PlayBuf.ar(2, bufnum: 1, rate: 1, trigger: LFNoise1.ar(LFNoise0.kr.range(-1, 1))) * 3}.play;
d.free;
d.release(2);

~paths.pathMatch.collect{|path| path.postln;}.numChannels;

//Another Way

~paths = "/Users/vagelis/Library/Application Support/SuperCollider/Sounds/*".asString;
r = ~paths.pathMatch;
r.collect{|pa| pa};
t = Buffer.read(s, r[1]);
t;
t.play;
t.free;

r.numChannels;


//Read and Play buffer-folder from HardDrive
//==========================================

//_1 cueSoundFile-->diavazei buffer gia na paixoun apo to DiskIn apo ton skliro
//_2 Platform.resourceDir -->prokathorismeno path sta content tou SC
//_3 +/+ sinexizei to path apo ekei kai pera

b = Buffer.cueSoundFile(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff", 0, 1);

~path = "/Users/vagelis/Library/Application Support/SuperCollider/Sounds/*".asString;
~pathM = ~path.pathMatch;

b = ~pathM.collect{|buffs| Buffer.cueSoundFile(s, buffs, 0, 2)};

b[0];
b[1];

x = { DiskIn.ar(2, b[0], 0) }.play;

//

SynthDef(\playFromDisk, { |num = 0|
	var source;
	source = DiskIn.ar(2, bufnum: num, loop: 0);
	Out.ar(0, source)
}).add;

r = Synth(\playFromDisk, [\num, 2]);


//Platform, Server, Document
//==========================

//Platform
Platform.getMouseCoords;

Platform.classLibraryDir.openOS;

Platform.helpDir;

Platform.userAppSupportDir.openOS;

Platform.systemAppSupportDir.openOS

Platform.when(#[\Document, \SCWindow], { "yeehah!".postln });

//Documnt
f = Document.new("the name", "the text", false).gui;
f.close;

//Server
Server.freeAll;
Server.killAll;
Server.default.volume = 0;
Server.default.freeAll;
s.mute;
s.unmute;
{SinOsc.ar}.play;

s.peakCPU;
s.numSynthDefs;
s.numUGens;

//Server_Recording
s.prepareForRecord;
s.record;
s.pauseRecording; 
s.stopRecording;

thisProcess
Main








