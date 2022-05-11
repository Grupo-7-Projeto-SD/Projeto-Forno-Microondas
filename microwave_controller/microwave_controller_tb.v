`timescale 1ms/1ms
`include "microwave_controller.v"

module microwave_controller_tb;

    reg [9:0] keypad_tb;
    reg clock_tb, startn_tb, stopn_tb, clearn_tb, door_closed_tb;

    wire [6:0] sec_ones_tb, sec_tens_tb, mins_tb;
    wire mag_on_tb;

    microwave_controller uut(keypad_tb, clock_tb, startn_tb, stopn_tb, clearn_tb, door_closed_tb, sec_ones_tb, sec_tens_tb, mins_tb, mag_on_tb);

    initial begin
        $dumpfile("microwave_controller.vcd");
        $dumpvars(0, microwave_controller_tb);

        keypad_tb = 10'b00_0000_0000;
        clock_tb = 1'b0;
        startn_tb = 1'b1;
        stopn_tb = 1'b1;
        clearn_tb = 1'b1;
        door_closed_tb = 1'b0;
    end

    initial begin
        repeat(40000) begin
            #5 clock_tb = ~clock_tb;
        end
    end

    initial begin
        // condições iniciais
        #10;
        startn_tb = 1'b1;
        stopn_tb = 1'b1;
        clearn_tb = 1'b1;
        door_closed_tb = 1'b1;

        // recebendo inputs (1:40)
        $display("\nrecebendo inputs\n");
        #500 keypad_tb = 10'b00_0000_0000;
        #500 keypad_tb = 10'b00_0000_0010;
        #500 keypad_tb = 10'b00_0000_0000;
        #500 keypad_tb = 10'b00_0001_0000;
        #500 keypad_tb = 10'b00_0000_0000;
        #500 keypad_tb = 10'b00_0000_0001;
        #500 keypad_tb = 10'b00_0000_0000;

        // start pressionado
        #10 startn_tb = 1'b0; $display("\nstart pressionado\n");
        #20 startn_tb = 1'b1;

        // stop pressionado
        #10000 stopn_tb = 1'b0; $display("\nstop pressionado\n");
        #20 stopn_tb = 1'b1;

        // start pressionado
        #5000 startn_tb = 1'b0; $display("\nstart pressionado\n");
        #20 startn_tb = 1'b1;

        // porta aberta
        #5000 door_closed_tb = 1'b0; $display("\nporta aberta\n");
        // porta fechada
        #5000 door_closed_tb = 1'b1; $display("\nporta fechada\n");

        // start pressionado
        #200 startn_tb = 1'b0; $display("\nstart pressionado\n");
        #20 startn_tb = 1'b1;

        // clear pressionado
        #10000 clearn_tb = 1'b0; $display("\nclear pressionado\n");
        #20 clearn_tb = 1'b1;

        // recebendo inputs (1:90)
        $display("\nrecebendo inputs\n");
        #500 keypad_tb = 10'b00_0000_0000;
        #500 keypad_tb = 10'b00_0000_0010;
        #500 keypad_tb = 10'b00_0000_0000;
        #500 keypad_tb = 10'b10_0001_0000;
        #500 keypad_tb = 10'b00_0000_0000;
        #500 keypad_tb = 10'b00_0000_0001;
        #500 keypad_tb = 10'b00_0000_0000;

        // start pressionado
        #10 startn_tb = 1'b0; $display("\nstart pressionado\n");
        #20 startn_tb = 1'b1;

        #700;

    end

endmodule