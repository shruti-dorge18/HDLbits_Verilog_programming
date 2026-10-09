module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] c;
    genvar i;
    generate
        for (i=0; i<100; i=i+1)
            begin: bcd_adder
                if (i==0)
                    bcd_fadd fadd (.a(a[i*4+:4]), .b(b[i*4+:4]), .cin(cin), .sum(sum[i*4+:4]), .cout(c[i]) );
                else
                    bcd_fadd fadd (.a(a[i*4+:4]), .b(b[i*4+:4]), .cin(c[i-1]), .sum(sum[i*4+:4]) ,.cout(c[i]) );
            end
    endgenerate
    assign cout = c[99];
endmodule

/*
suppose, i=0                 |  i=2
i*4= 0*4=0                   |  i*4= 2*4=8
a[0+:4]                      |  a[8+:4]
start at bit 0, take 4 bits  |  start at bit 8, take 4 bit upwards
a[3:0]                       |  a[11:8]

+: --> increase
-: --> decrease

*/