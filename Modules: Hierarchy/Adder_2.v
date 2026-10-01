module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c;
    
    add16 inst1 ( .a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cin(1'b0) ,.cout(c) );
    
    add16 inst2 ( .a(a[31:16]), .b(b[31:16]), .sum(sum[31:16]), .cin(c) ,.cout() );
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum= a^b^cin;
    assign cout= a&b | a&cin | b&cin;
    
endmodule

/*
1) a[15:0] + b[15:0] --> sum[15:0] , carry
2) a[31:16] + b[31:16] + carry --> sum[31:16]
3) wire c : first's add16 carry out should go to second add16 as carry in
4) cin (1'b0) --> question mentioned explicitly to not handle first carry in
5) cout() --> question mentioned to not handle final carry out
6) Here, you didnt connect add1 (was already provided, only it's logic was asked to write)
   add16 internally uses add1 
   In this program,you connected/instantiated add16 only 

*/

