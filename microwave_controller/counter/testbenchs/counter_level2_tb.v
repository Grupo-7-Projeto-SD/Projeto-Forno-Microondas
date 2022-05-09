`timescale 1ns/1ps
`include "counter_level2.v"

// este módulo deve ser compilado a partir do diretório "/microwave_controller/counter"
// devido à hierarquia de pastas
module counter_level2_tb;

    reg [3:0] data_tb;
    reg clk_tb, clrn_tb, loadn_tb, enable_tb;

    wire [3:0] sec_ones_tb, sec_tens_tb, mins_tb;
    wire zero_tb;

    counter_level2 uut(data_tb, loadn_tb, clrn_tb, clk_tb, enable_tb, sec_ones_tb, sec_tens_tb, mins_tb, zero_tb);

    initial begin
        $dumpfile("./wave_forms/counter_level2.vcd");
        $dumpvars(0, counter_level2_tb);

        data_tb = 4'd0; clk_tb = 1'b0; clrn_tb = 1'b1; loadn_tb = 1'b1; enable_tb = 1'b0;
    end

    initial begin
        #55 clk_tb = ~clk_tb;
        #50 clk_tb = ~clk_tb;

        #150 clk_tb = ~clk_tb;
        #50 clk_tb = ~clk_tb;

        #150 clk_tb = ~clk_tb;
        #50 clk_tb = ~clk_tb;

        #130 clk_tb = ~clk_tb;
        #50 clk_tb = ~clk_tb;

        #160 clk_tb = ~clk_tb;
        #50 clk_tb = ~clk_tb;

        #150 clk_tb = ~clk_tb;
        #50 clk_tb = ~clk_tb; #5;

        repeat(500) begin
            if (enable_tb) begin
                #5 clk_tb = ~clk_tb;
            end

            if (zero_tb) begin
                enable_tb = 0;
            end
        end
        
    end

    initial begin
        // recebe os inputs
        #10 data_tb = 4'd8;
        #40 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1; //100

        #100 data_tb = 4'd9;
        #50 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1; //300

        #100 data_tb = 4'd2;
        #50 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1; //500

        // tenta dar um clear
        #10 clrn_tb = 1'b0;
        #10 clrn_tb = 1'b1; //520

        // recebe os inputs de novo
        #70 data_tb = 4'd1;
        #40 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1; //690

        #100 data_tb = 4'd2;
        #50 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1; //890

        #100 data_tb = 4'd0;
        #50 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1; //1090

        // ativa a contagem
        #10 enable_tb = 1'b1; //1100

        // tenta dar um load enquanto conta (se o timer control funciona isso nunca acontece)
        #100 loadn_tb = 1'b1;
        #50 loadn_tb = 1'b1;

        // tenta dar um clear enquanto conta (força o enable para zero)
        #5000 clrn_tb = 1'b0; enable_tb = 1'b0;
        #50 clrn_tb = 1'b1;
        #30;
    end

endmodule