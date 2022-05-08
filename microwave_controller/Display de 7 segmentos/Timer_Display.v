module Timer_Display(min_in, dseg_in, seg_in, min_out, dseg_out, seg_out);
	input min_in, dseg_in, seg_in;
	output min_out, dseg_out, seg_out;
	
	Display7seg U1(min_in, min_out);
	Display7seg U2(dseg_in, dseg_out);
	Display7seg U3(seg_in, seg_out);
endmodule