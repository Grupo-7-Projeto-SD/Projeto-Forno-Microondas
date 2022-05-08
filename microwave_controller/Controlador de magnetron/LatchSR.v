module LatchSR (set, reset, q, qn);
	input set, reset;
	output q, qn;
	
	assign q = ~(set & qn);
	assign qn = ~(reset & q);
endmodule	