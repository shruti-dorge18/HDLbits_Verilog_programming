module top_module ( input [1:0] A, input [1:0] B, output z ); 

    assign z = (A==B); // Comparisons produce a 1 or 0 result
    
endmodule
