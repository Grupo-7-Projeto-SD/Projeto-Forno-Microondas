`include "./controlador_magnetron/Control.v"
`include "./controlador_magnetron/LatchSR.v"

// manter apenas os nomes dos arquivos nos caminhos
// ao compilar no diretório ./microwave_controller/controlador_magnetron

module ControlMagnetron (startn, stopn, clearn, door_closed, timer_done, mag_on);
	input startn, stopn, clearn, door_closed, timer_done;
	output mag_on;

	wire set, reset;
	
	Control U1 (startn, stopn, clearn, door_closed, timer_done, set, reset);
	LatchSR U2 (set, reset, mag_on);
endmodule