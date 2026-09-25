// Question: Consider the n-bit shift register circuit shown below: 

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    wire mux1, D;
    assign mux1= E ? w : Q;
    assign D = L ? R : (E ? w: Q) ;
    always @ (posedge clk)
        Q<= D;
endmodule
