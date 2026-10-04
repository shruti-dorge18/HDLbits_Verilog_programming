module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] a_less_b, c_less_d; // Since a, b, c, d are 8-bit numbers, a_less_b and c_less_d also needs to be 8 bits
    
    assign a_less_b = a<b ? a : b;
    assign c_less_d = c<d ? c : d;
    
    assign min = (a_less_b < c_less_d ) ? a_less_b : c_less_d ;

endmodule
