/* Given five 1-bit signals (a, b, c, d, and e), compute all 25 pairwise one-bit comparisons in the 25-bit output vector.
The output should be 1 if the two bits being compared are equal. 
*/

module top_module (
	input a, b, c, d, e,
	output [24:0] out
);

	wire [24:0] top, bottom;
	assign top    = { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} };
	assign bottom = {5{a,b,c,d,e}};
	assign out = ~top ^ bottom;	

/* OR
assign out = ~{ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} } ^ {5{a,b,c,d,e}};
OR 

assign out[24] = ~a ^ a;  
assign out[23] = ~a ^ b;
assign out[22] = ~a ^ c;
...
assign out[ 1] = ~e ^ d;
assign out[ 0] = ~e ^ e;
*/
	
endmodule
