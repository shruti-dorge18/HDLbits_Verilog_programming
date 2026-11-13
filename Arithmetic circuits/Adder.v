module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    assign sum= x+y; // could be solved same as ripple carry adder too
                    // x & y are only 4 bits, but the 5-bit output allows to preserve the carry-out
endmodule

/*


*/

