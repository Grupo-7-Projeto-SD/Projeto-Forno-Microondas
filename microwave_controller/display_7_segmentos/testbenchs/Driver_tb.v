`timescale 1ns/1ps
`include "Driver.v"

// este módulo deve ser compilado a partir do diretório "/microwave_controller/display_7_segmentos"
// devido à hierarquia de pastas
module Driver_tb;

    reg [3:0] min_in_tb, dseg_in_tb, seg_in_tb;
    wire [6:0] min_out_tb, dseg_out_tb, seg_out_tb;

    Driver uut(min_in_tb, dseg_in_tb, seg_in_tb, min_out_tb, dseg_out_tb, seg_out_tb);

    initial begin
        $dumpfile("./wave_forms/Driver.vcd");
        $dumpvars(0, Driver_tb);

        min_in_tb = 4'b0000; dseg_in_tb = 4'd0; seg_in_tb = 4'd0; #10;
        min_in_tb = 4'd4; dseg_in_tb = 4'd2; seg_in_tb = 4'd0; #10;
        min_in_tb = 4'd3; dseg_in_tb = 4'd6; seg_in_tb = 4'd1; #10;
        min_in_tb = 4'd8; dseg_in_tb = 4'd4; seg_in_tb = 4'd4; #10;
        min_in_tb = 4'd1; dseg_in_tb = 4'd9; seg_in_tb = 4'd0; #10;
        min_in_tb = 4'd5; dseg_in_tb = 4'd1; seg_in_tb = 4'd9; #10;
    end

endmodule