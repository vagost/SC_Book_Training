{\rtf1\ansi\ansicpg1252\cocoartf1038\cocoasubrtf360
{\fonttbl\f0\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red191\green0\blue0;\red255\green102\blue0;
\red0\green0\blue191;\red51\green51\blue191;\red0\green115\blue0;}
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\ql\qnatural\pardirnatural

\f0\fs22 \cf2 \
\
\cf3 //PatternProxy\cf2 \
\cf3 //================\cf2 \
\
\
\cf4 ~freqMax\cf2  = \cf5 PatternProxy\cf2 (\cf5 Pseq\cf2 ([100], \cf6 inf\cf2 ));\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\ql\qnatural\pardirnatural
\cf4 ~freqMax\cf2 .source = (\cf5 Pseq\cf2 ([\cf4 ~freq1\cf2 , \cf4 ~freq2\cf2 ], \cf6 inf\cf2 ));\
\
\cf4 ~freq1\cf2  = \cf5 PatternProxy\cf2 (\cf5 Pseq\cf2 ([100], \cf6 inf\cf2 ));\
\cf4 ~freq1\cf2 .source = \cf5 Pseq\cf2 ([\cf4 ~c_2\cf2 ], 1);\
\
\cf4 ~freq2\cf2  = \cf5 PatternProxy\cf2 (\cf5 Pseq\cf2 ([100], \cf6 inf\cf2 ));\
\cf4 ~freq2\cf2 .source = \cf5 Pseq\cf2 ([\cf4 ~c_4\cf2 ], 1);\
\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\ql\qnatural\pardirnatural
\cf2 t = \cf5 TempoClock\cf2 \
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\ql\qnatural\pardirnatural
\cf2 t.tempo = 1.2\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\ql\qnatural\pardirnatural
\cf2 \
r = \cf5 Pbind\cf2 (\
	\cf7 \\freq\cf2 , \cf4 ~freqMax\cf2 ,\
	\cf7 \\dur\cf2 , 1\
\
).play(t)\
\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\ql\qnatural\pardirnatural
\cf2 r.stream = \cf5 Pbind\cf2 (\
	\cf7 \\freq\cf2 , \cf4 ~freqMax\cf2 ,\
	\cf7 \\dur\cf2 , 2\
\
).asStream;}