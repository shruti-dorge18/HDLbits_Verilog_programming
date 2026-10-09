module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [99:0] carry;
    genvar i;
    generate 
        for (i=0 ; i<100 ; i=i+1)
            begin: binary_adder
                if (i==0) begin
                        fadd fa (.a(a[i]), .b(b[i]), .cin(cin), .sum(sum[i]), .cout(carry[i]) );
                    end
                
                else begin
                         fadd fa (.a(a[i]), .b(b[i]), .cin(carry[i-1]), .sum(sum[i]), .cout(carry[i]) );
                end
                
            end
    endgenerate
    
    assign cout = carry;
    
endmodule

module fadd (input a,b,cin, output sum,cout);
    
    assign {cout,sum}= a+b+cin;   // OR  assign sum  = a ^ b ^ cin;
                                  //     assign cout = a & b | cin & (a^b);
    
endmodule

/* Explanation:
for first adder (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(carry[0]) );
next adder:     (.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]) );
meaning cin takes last value of cout
question specifies to output the last carry out 

Why cout first in assign {cout,sum} ?
full adder adds three 1 bit values --> a , b, cin
so, maximum is 1+1+1=3 & 3 in binary = 11, that's 2-bit
therefore, result needs to be 2-bit 
    1
  + 1 
  -----
   10    ---> 1= cout= MSB, 0=sum=LSB
hence, cout is written first

*/
