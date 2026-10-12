module top_module ( input x, input y, output z );

  // using SOP
  assign z = (~x & ~y) | (x & y);

  // OR by using POS
  assign z = (~x | y) & (x | ~y);

  //OR XNOR table
  assign z = ~(x ^ y);

endmodule

/*
To make truth table, look at the values of xyz in each time interval
where any signal changes

time       x      y     z

0-160      0      0     1
160-400    1      0     0
400-560    0      1     0
560-800    1      1     1

(arranging above obtained table forms XNOR)
*/