// The 7458 is a chip with four AND gates and two OR gates
// Create a module with the functionality as the 7458 chip

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

   wire p11, p12;
   assign p11 = p1a & p1b & p1c ;
   assign p12 = p1f & p1e & p1d ;
   assign p1y = p11 | p12 ;
   
   wire p21 ,p22;
   assign p21 = p2a & p2b ; 
   assign p22 = p2c & p2d ;
   assign p2y= p21 | p22;
    
endmodule
