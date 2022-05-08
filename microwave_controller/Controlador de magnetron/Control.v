module Control (startn, stopn, clearn, door_closed, timer_done, set, reset);
	input startn, stopn, clearn, door_closed, timer_done;
	output set, reset;
	
	assign set = (startn & door_closed) & ~(stopn | clearn | timer_done);
	assign reset = (stopn | clearn | timer_done);
endmodule