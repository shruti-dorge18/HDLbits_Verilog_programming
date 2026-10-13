module top_module(
	input ring, 
	input vibrate_mode,
	output ringer,
	output motor
);
	
	assign ringer = ring & ~vibrate_mode;
	
	assign motor = ring & vibrate_mode;
	
endmodule

/*
2 inputs,  therefore 2^2=4 combinations
(below ring and vibrate 0s 1s are standard truth table inputs only
and we derived ringer and motor outputs using them)

Ring(i/p)  vibrate(i/p)  ringer(o/p)  motor(o/p)
0           0              0             0        : no call --> no vibration --> all output tends to zero
0           1              0             0        : though vibration=1, but there's no call --> it wont vibrate --> o/p tends to 0
1           0              1             0        : there's call --> ringer=1 
1           1              0             1        : call + vibration --> motor=1 as question mentions to turn on motor,
                                                    ringer could be 1 but both outputs cannot be 1 as question states

Derive equations from truth table now
Ringer=1 when ring=1 and vibrate=0
Motor =1 when both inputs are 1                                                    

Why ringer is ANDed ?
suppose, ringer= ring |  ~vibrate;
If ring=1, vibrate=0 --> ringer = 1 (correct)
   ring=0, vibrate=1 --> ringer = 0 (but we need ringer to be 1 & since no call, no vibration , no ringer)
*/
