module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
 
    // Positonal association
    mod_a inst1 (out1, out2, a, b, c, d); 

endmodule
