module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    // Using SOP=1, 1= +ve, 0= -ve , ( _ & ) | ( _ & _ )
    assign f = ( ~x3 & x2 & ~x1 ) | 
				( ~x3 & x2 & x1 ) |
				( x3 & ~x2 & x1 ) |
				( x3 & x2 & x1 ) ;
   
    // OR
    // Using POS=0, 1= -ve, 0= +ve, ( _ | _ ) & ( _ | _ )
    assign f = ( x3 | x3 | x1 ) &
               ( x3 | x3 | ~x1 ) &
               ( ~x3 | x3 | x1 ) &
               ( ~x3 | ~x3 | x1 ) ;
    // OR
    // By simplying SOP
    assign f = ( ~x3 & x2 ) | ( x3 & x1) ;
    
    // OR
    // this is 2-to-1 mux, selected by x3
    assign f = x3 ? x1 : x2;

endmodule
