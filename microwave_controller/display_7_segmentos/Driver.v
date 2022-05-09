`include "./display_7_segmentos/Decoder.v"

// manter apenas os nomes dos arquivos nos caminhos
// ao compilar no diretório ./microwave_controller/display_7_segmentos

module Driver(min_in, dseg_in, seg_in, min_out, dseg_out, seg_out);
	input [3:0] min_in, dseg_in, seg_in;
	output [6:0] min_out, dseg_out, seg_out;

	reg [3:0] c_min, c_dseg, c_seg;

	// conta os segundos > 59 corretamente
	// obs: como há apenas três telas, não é possível contar tempos acima de 9:59,
	// 		portanto, nesse caso, muda-se os minutos para zero
	always @* begin
		c_seg = seg_in;

		if (dseg_in > 4'd5) begin
			c_dseg = dseg_in - 4'd6;
			c_min = min_in + 4'd1;
		end else begin
			c_dseg = dseg_in;
			c_min = min_in;
		end
	end

	Display7seg U1(c_min, min_out);
	Display7seg U2(c_dseg, dseg_out);
	Display7seg U3(c_seg, seg_out);
endmodule