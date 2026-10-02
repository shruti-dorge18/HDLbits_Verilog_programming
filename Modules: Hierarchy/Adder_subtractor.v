module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b2;
    assign b2 = b ^ {32{sub}};
    
    wire cin2;
    add16 inst1 (.a(a[15:0]), .b(b2[15:0]), .cin(sub), .cout(cin2) ,.sum(sum[15:0]) );
    add16 inst2 (.a(a[31:16]), .b(b2[31:16]), .cin(cin2), .cout() ,.sum(sum[31:16]) );
    
endmodule

/*
Adder-subtractor performs addition & subtraction using same hardware.
Circuit doesnt actually subtract, it always performs addition for both addition and subtraction operation

assign b2 = b ^ {32{sub}}; (performs 1's operation)
when sub=0, b=1010....        |      when sub=1, b=1010...
b2= b ^ sub                   |      b2= b ^ sub 
b2 = 1010 ^ 0000...           |      b2 = 1010 ^ 1111... 
b2 = 1010...                  |      b2 = 0101..
b2 = b;                       |      b2 = ~b;

sub gives 2's complement in instantiation
addition    = a + b + 0  = a + b ......(0 comes from sub)
subtraction = a + ~b + 1 = a - b ......(1 comes from sub)

sub=0 --> addition
sub=1 --> subtraction
*/