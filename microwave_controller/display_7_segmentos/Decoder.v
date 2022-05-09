module Display7seg (BCDin, BINout);
	input [3:0] BCDin;
	output reg [6:0] BINout;

	initial begin
		BINout =  7'b111_1111;
	end
	
	always @* begin
		//active_low inputs
		/*
		design:

			  ___g___
			 |		 |
			b|		 |f
			 |___a___|
			 |		 |
			c|		 |e
			 |_______|
			 	 d
		*/
		case (BCDin)
			//              abc_defg
			4'b0000: BINout = 7'b100_0000;
			4'b0001: BINout = 7'b111_1001;
			4'b0010: BINout = 7'b010_0100;
			4'b0011: BINout = 7'b011_0000;
			4'b0100: BINout = 7'b001_1001;
			4'b0101: BINout = 7'b001_0010;
			4'b0110: BINout = 7'b000_0010;
			4'b0111: BINout = 7'b111_1000;
			4'b1000: BINout = 7'b000_0000;
			4'b1001: BINout = 7'b001_0000;
			default: BINout = 7'b111_1111;
		endcase
	end
endmodule