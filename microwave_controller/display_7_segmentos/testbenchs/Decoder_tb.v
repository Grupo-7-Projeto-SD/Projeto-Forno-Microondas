`timescale 1ns/1ps
`include "..\Decoder.v"

module Decoder_tb;

    reg [3:0] BCDin_tb;
    wire [6:0] BINout_tb;

    Display7seg uut(BCDin_tb, BINout_tb);

    initial begin
        $dumpfile("../wave_forms/Decoder.vcd");
        $dumpvars(0, Decoder_tb);

        BCDin_tb = 4'd7; #10;
        BCDin_tb = 4'd3; #10;
        BCDin_tb = 4'd9; #10;
        BCDin_tb = 4'd1; #10;
        BCDin_tb = 4'b0000; #10;
        BCDin_tb = 4'bxxxx; #10;
        BCDin_tb = 4'bzzzz; #10;
        BCDin_tb = 4'd4; #10;
        BCDin_tb = 4'd2; #10;
    end

endmodule