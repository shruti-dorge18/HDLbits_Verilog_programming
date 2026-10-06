module top_module (
    input in1,
    input in2,
    input in3,
    output out);

    wire out_xnor;
    assign out_xnor = (in1 ~^ in2);           // OR ~(in1 ^ in2);
    assign out = in3 ^ out_xnor;
    
endmodule
