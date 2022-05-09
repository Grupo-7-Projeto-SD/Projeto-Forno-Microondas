`timescale 1ns/1ps
`include "..\LatchSR.v"

module LatchSR_tb;

    reg set_tb, reset_tb;
    wire q_tb;

    LatchSR uut(set_tb, reset_tb, q_tb);

    initial begin
        $dumpfile("../wave_forms/LatchSR.vcd");
        $dumpvars(0, LatchSR_tb);

        set_tb = 0; reset_tb = 0; #10;
        set_tb = 1; reset_tb = 0; #10;
        set_tb = 0; reset_tb = 1; #10;

        set_tb = 0; reset_tb = 0; #10;
        set_tb = 1; reset_tb = 0; #10;
        set_tb = 0; reset_tb = 0; #10;
    end

endmodule