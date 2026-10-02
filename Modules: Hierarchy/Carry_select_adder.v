module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
   wire carry;
   wire [31:16] sum1;
   wire [31:16] sum2;
    
    add16 inst1 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(carry) );
    add16 inst2 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum1), .cout() );
    add16 inst3 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum2), .cout() );
    
    mux_2to1 inst4 (.sum1(sum1), .sum2(sum2), .carry(carry), .out(sum[31:16]) );

endmodule

module mux_2to1 (
    input [31:16] sum1, input [31:16] sum2,
    input carry,
    output [31:16] out
);
    assign out = carry ? sum2 : sum1 ;
    
endmodule
    
/*
carry in calculation is performed in advance to avoid delay unlike ripple carry adder

lower bits [15:0] --> carry in=0 ; carry out = 0 or 1;
upper bits [31:16] --> carry in= 0 from lower bits carry out, ignore carry out, produces sum1
OR upper bits [31:16] --> carry in= 1 from lower bits carry out, ignore carry out, produces sum2

carry out of lower bits act as enable control signal for mux
if carry out =0, sum1 is selected from second instantiation of add16
   carry out =1, sum2 is selected from third instantiation of add16

then the lower bit sum is added with sum1/sum2 (using mux) to get final result
*/