module top_module( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = a & b | cin & (a ^ b) ;

endmodule

/*
sum = (~a ~b cin) + (~a b ~cin) + (a ~b ~cin) + (a b cin)
    = ~a (~b cin + b ~cin)      + a (~b ~cin + b cin)
    = ~a (b ^ cin)              + a ~(b ^ cin)
    = a ^ b ^ cin

cout = (~a b cin)  + (a ~b cin) + (a b ~cin) + (a b cin)
     = cin (~a ~b  + a ~b)      + a b (~cin + cin)
     = cin (a ^ b)              + a b (1)
     = a b + cin (a ^ b)
*/