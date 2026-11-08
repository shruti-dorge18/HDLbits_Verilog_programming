module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
   
    assign out= in[sel*4 +: 4];

//OR  assign out= {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};
//OR  assign out= in[sel*4+3 -: 4]

endmodule

/*
+: --> increase
-: --> decrease

suppose, sel=0                            |  sel=2
sel*4 = 0*4=0                             |  sel*4 = 2*4 = 8
in[0 +: 4]                                |  in[8 +: 4]
start at bit 0, take 4 bits --> in[3:0]   | start at bit 8, take 4 bits --> in[11:8]

*/