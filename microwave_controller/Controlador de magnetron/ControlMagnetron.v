module ControlMagnetron (startn, stopn, clearn, door_closed, timer_done, mag_on, mag_off);
	input startn, stopn, clearn, door_closed, timer_done;
	output mag_on, mag_off;
	
	Control U1 (startn, stopn, clearn, door_closed, timer_done, set, reset);
	LatchSR U2 (set, reset, mag_on, mag_off);
endmodule