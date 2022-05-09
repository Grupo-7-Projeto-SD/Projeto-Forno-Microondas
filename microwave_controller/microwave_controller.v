`include "./controlador_magnetron/ControlMagnetron.v"
`include "./counter/counter_level2.v"
`include "./display_7_segmentos/Driver.v"
`include "./timer_input_control/timer_control_level2.v"

module microwave_controller(
    keypad, clock, startn, stopn, clearn, door_closed,
    sec_ones, sec_tens, mins, mag_on
);

    // input em binário one-hot
    input [9:0] keypad;

    // inputs de 1 bit
    input clock, startn, stopn, clearn, door_closed;

    // outputs do display de 7 segmentos
    output [6:0] sec_ones, sec_tens, mins;

    // output do magnetron
    output mag_on;

    // fios internos
    wire [3:0] Data;
    wire data_valid, counter_clk;
    wire [3:0] sec_out_counter, dsec_out_counter, min_out_counter;
    wire zero_counter;

    timer_control_level2 timer_control(.keypad(keypad), .enable_n(mag_on), .clock_100Hz(clock), .D(Data), .load_n(data_valid), .pgt_1Hz(counter_clk));

    ControlMagnetron mag_control(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(zero_counter), .mag_on(mag_on));

    counter_level2 counter(.data(Data), .loadn(data_valid), .clrn(clearn), .clk(counter_clk), .enable(mag_on), .sec_ones_out(sec_out_counter), .sec_tens_out(dsec_out_counter), .mins_out(min_out_counter), .zero(zero_counter));

    Driver display_driver(.min_in(min_out_counter), .dseg_in(dsec_out_counter), .seg_in(sec_out_counter), .min_out(mins), .dseg_out(sec_tens), .seg_out(sec_ones));

    always @* $display("at %0t ms, %d:%d%d", $time, min_out_counter, dsec_out_counter, sec_out_counter);

endmodule