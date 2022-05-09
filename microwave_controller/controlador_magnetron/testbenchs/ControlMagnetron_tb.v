`timescale 1ns/1ps
`include ".\ControlMagnetron.v"

// este módulo deve ser compilado a partir do diretório "/microwave_controller/controlador_magnetron"
// devido à hierarquia de pastas
module ControlMagnetron_tb;

    reg startn_tb, stopn_tb, clearn_tb, door_closed_tb, timer_done_tb;
    wire mag_on_tb;

    ControlMagnetron uut(startn_tb, stopn_tb, clearn_tb, door_closed_tb, timer_done_tb, mag_on_tb);

    initial begin
        $dumpfile("./wave_forms/ControlMagnetron.vcd");
        $dumpvars(0, ControlMagnetron_tb);

        // q = 0
        startn_tb = 1; stopn_tb = 1; clearn_tb = 1; door_closed_tb = 0; timer_done_tb = 0; #10;

        // q = 0
        startn_tb = 1; stopn_tb = 1; clearn_tb = 1; door_closed_tb = 1; timer_done_tb = 0; #10;

        // q = 1
        startn_tb = 0; stopn_tb = 1; clearn_tb = 1; door_closed_tb = 1; timer_done_tb = 0; #10;

        // q = 0
        startn_tb = 0; stopn_tb = 0; clearn_tb = 1; door_closed_tb = 1; timer_done_tb = 0; #10;

        // q = 0
        startn_tb = 0; stopn_tb = 1; clearn_tb = 0; door_closed_tb = 1; timer_done_tb = 0; #10;

        // q = 0
        startn_tb = 0; stopn_tb = 1; clearn_tb = 1; door_closed_tb = 1; timer_done_tb = 1; #10;
    end

endmodule