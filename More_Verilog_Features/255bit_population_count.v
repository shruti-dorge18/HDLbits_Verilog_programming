module top_module (
	input [254:0] in,
	output reg [7:0] out
);

	always @(*) begin	
		out = 0;
		for (int i=0; i<255; i++)
			out = out + in[i];
	end
	
endmodule

/* Example:
Number is 8 bit wide: 1011 0110
out = out + in[i] = count of 1's
0 = 0 + 0 = 0                    // in[0] = 0
0 = 0 + 1 = 1                    // in[1] = 1
1 = 1 + 1 = 2                    // in[2] = 1
2 = 2 + 0 = 2                    // in[3] = 0
2 = 2 + 1 = 3                    // in[4] = 1
3 = 3 + 1 = 4                    // in[5] = 1
4 = 4 + 0 = 4                    // in[6] = 0
4 = 4 + 1 = 5                    // in[7] = 1

Hence, total number of 1's in given number = 5
*/
