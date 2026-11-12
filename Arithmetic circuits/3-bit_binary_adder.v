module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    fadd fadd1 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0]) );  // top module cin is connected to fadd1 cin
    // in ques, "the adder adds two 3 bit numbers & carry in; hence, dont write .cin(1'b0) or .cin()
    
    fadd fadd2 (.a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]) );
    fadd fadd3 (.a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]) );
endmodule

module fadd (input a, b, cin, output sum, cout);
    assign sum= a^b^cin;
    assign cout= a&b | cin & (a^b);   
endmodule
    
