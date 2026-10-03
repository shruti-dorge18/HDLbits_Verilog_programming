// A priority encoder is a combinational circuit that,
// when given an input bit vector, outputs the position of the first 1 bit in the vector.
// For eg, a 8-bit priority encoder given the input 8'b10010000 would output 3'd4, because bit[4] is first bit that is high. 

module top_module (
	input [3:0] in,
	output reg [1:0] pos
);

	always @(*) begin			
		case (in)
			4'h0: pos = 2'h0;	
			4'h1: pos = 2'h0;
			4'h2: pos = 2'h1;
			4'h3: pos = 2'h0;
			4'h4: pos = 2'h2;
			4'h5: pos = 2'h0;
			4'h6: pos = 2'h1;
			4'h7: pos = 2'h0;
			4'h8: pos = 2'h3;
			4'h9: pos = 2'h0;
			4'ha: pos = 2'h1;
			4'hb: pos = 2'h0;
			4'hc: pos = 2'h2;
			4'hd: pos = 2'h0;
			4'he: pos = 2'h1;
			4'hf: pos = 2'h0;
			default: pos = 2'b0;	// Default case is not strictly necessary because all 16 combinations are covered.
		endcase
	end
		
endmodule

/*
OR 
    always @ (*) begin
        casez (in)             // casez or casex for dont care conditions
           4'bzzz1 : pos = 0;
           4'bzz1z : pos = 1;
           4'bz1zz : pos = 2;
           4'b1zzz : pos = 3;
           default : pos = 0;
        endcase
    end
*/
