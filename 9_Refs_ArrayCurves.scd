TOSEE: Thread, unary operator



//Reference to a value
//===================

Ref:
`  
*
#

x = Ref.new(100)
//or
x = `100
x.value = 300


c = `[20]
c.next.value
c.asRef
c.set(20)

d = `[20, 40, 10]

d.asUGenInput
d.asControlInput


*[] --> reference, vlepei ta keys enos Pbind san onoma kai oxi san keys

d =  [`[100, 100.1, 110]]
d.valueArray


//Array sto curve tou envelope
//============================

{SinOsc.ar(200, 0, 0.1) * EnvGen.ar(Env.new(\freq.kr([0, 1, 0.5, 0]), \time.kr([0.1, 0.1, 0.1]), \curve.kr([-10, 1, 10])), doneAction:2)}.plot(0.3)

//paizoun kai ta tria se olii tin diarkeia tou simatos kai analoga pio einai epilegmeno leitourgei ekeino xroniko parathiro

f = {|freq = #[0, 1, 0.5, 0], curve = #[-10, 1, 10], time = #[0.1, 0.1, 0.1]|
	
	SinOsc.ar(200, 0, 0.1) * EnvGen.ar(Env.new(freq, time, curve), doneAction:2)}.plot(0.3)



//Multichannel Expansion with References		
//======================================

//Genika

Pbind(*[\keys..etc])
*[] --> reference, vlepei ta keys enos Pbind san onoma kai oxi san keys

Ref(10) = `10

//Mesa se ena EventStreamPlayer

`[10] = [[10]]

//Notes_InPatterns

- Otan exoume mia metavliti:
	- [20, 20]  = root, pairnei kai tis dio times.
	- [[20, 20]] = `[20, 20] = efoson iparxei mia moni metavliti kai oi times pou dinoume emeis 
		einai enas pinakas tha parei mono tin proti timi, efoson toses theseis exei metavlites(eleutheres).
	
- Otan exoume mia array metavliton, px. freq = [200, 300, 1000]:
	- [[200, 300, 1000]] = `[200, 300, 1000] = pairnei tis times kai tis apothikeuei stis theseis tou pinaka
	- [[200, 300, 1000], [201, 301, 1001]] = [ `[200, 300, 1000], `[201, 301, 1001]] = kanei root, efoson exoume enan megalo 
		pinaka, pou pereiexei dio mikroterous pinakes pou periexoun tosa stoixeia osa kai oi theseis tou arxikou pinaka px. mesa
		sto SynthDef.
	- `[[200, 300], [201, 301]]	= tha parei mono tis times tou protou metapinaka [200, 300], efoson
		tou dino stin ousia enan megalo pinaka pou periexei ipopinakes, o kentrikos omos exei xoro mono gia enan pinaka dio timon, 
		oxi gia dio. Den tou stelno opos parapano dio pinakes dio timon, san root. Alla tou stelno enan megalo pinaka me dio ipopinakes
	- [200, 300, 1000] = otan tou stelo auto sketo autos tha steilei san root tria paketa timon, to ena tha einai to 200, to allo 
		to 300 kai to allo to 1000, omos o pinakas mou gia na kalifthei pliros thelei treis times. Opote apothikeuei tin proti stin proti
		timi tou to 200 kai stis alles dio vazei to default tou, auto pou exoume dilosei sto SynthDef. To idio kanei kai me ta alla dio 
		noumera. Opote prokiptoun treis pinakes san root. Ena mesa sto synthdef o pinakas einai [2, 3, 4] tote prokiptoun
		san root --> [200, 3, 4], [300, 3, 4], [1000, 3, 4]. 
		Auto einai isodinamo me [ [200, 3, 4], [300, 3, 4], [1000, 3, 4] ]	
		




