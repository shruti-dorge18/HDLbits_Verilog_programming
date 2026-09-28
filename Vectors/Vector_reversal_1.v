//Given an 8-bit input vector [7:0], reverse its bit ordering. 

module top_module( 
    input [7:0] in,
    output [7:0] out
);

   assign {out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]} = in;

/* OR
assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
   OR
assign {out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]} = {in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]};
   OR
always @ (*)
     begin
        for (int i=0; i<8, i++)
        out[i] = in[8-i-1];
     end
*/

endmodule