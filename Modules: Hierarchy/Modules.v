module top_module (
	input a,
	input b,
	output out
);

	// Explicit association
	mod_a inst1 ( 
		.in1(a), 	// in1 --> a
		.in2(b),	// in2 --> b
		.out(out)	// out --> out
	);

/*
	Positional association
	mod_a inst1 ( a, b, out );	// The three wires are connected to ports in1, in2, out respectively.
*/
	
endmodule
