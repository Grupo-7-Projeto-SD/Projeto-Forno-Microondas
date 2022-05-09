module LatchSR (set, reset, q);
	input set, reset;
	output reg q;
	
	always @(set, reset) begin
		q <= set | (~reset & q);
	end
endmodule	