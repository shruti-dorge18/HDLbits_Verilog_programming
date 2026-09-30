module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);
    
	wire [7:0] a, b, c;		// output of each my_dff8
	
    my_dff8 d1 (.clk(clk), .d(d), .q(a));
    my_dff8 d2 (.clk(clk), .d(a), .q(b));
    my_dff8 d3 (.clk(clk), .d(b), .q(c));


/*  using positional association 
    wire [7:0] a, b, c;

	my_dff8 d1 ( clk, d, a );
	my_dff8 d2 ( clk, a, b );
	my_dff8 d3 ( clk, b, c );
*/

	// 4:1 multiplexer

	always @(*)		
		case(sel)
			2'h0: q = d;
			2'h1: q = a;
			2'h2: q = b;
			2'h3: q = c;
		endcase

endmodule
