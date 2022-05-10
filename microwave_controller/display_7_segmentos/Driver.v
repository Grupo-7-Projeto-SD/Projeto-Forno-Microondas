`include "./display_7_segmentos/Decoder.v"

// manter apenas os nomes dos arquivos nos caminhos
// ao compilar no diretório ./microwave_controller/display_7_segmentos

module Driver(min_in, dseg_in, seg_in, min_out, dseg_out, seg_out);
	input [3:0] min_in, dseg_in, seg_in;
	output [6:0] min_out, dseg_out, seg_out;

	Display7seg U1(min_in, min_out);
	Display7seg U2(dseg_in, dseg_out);
	Display7seg U3(seg_in, seg_out);
endmodule