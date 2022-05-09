`timescale 1ms/1ns
`include "..\counter10.v"

module counter10_tb;

    reg [3:0] data_tb;
    reg clk_tb, rstn_tb, loadn_tb, enable_tb;

    wire [3:0] count_tb;
    wire tc_tb, zero_tb;

    counter10 uut(enable_tb, clk_tb, data_tb, rstn_tb, loadn_tb, count_tb, tc_tb, zero_tb);

    initial begin
        $dumpfile("../wave_forms/counter10.vcd");
        $dumpvars(0, counter10_tb);

        data_tb = 4'd0; clk_tb = 1'b0; rstn_tb = 1'b1; loadn_tb = 1'b1; enable_tb = 1'b0;
    end

    initial begin
        repeat(500)
            #5 clk_tb = ~clk_tb; 
    end

    initial begin
        // recebe os inputs
        #10 data_tb = 4'd4;
        #40 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1;

        #100 data_tb = 4'd2;
        #50 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1;

        // tenta dar um clear
        #10 rstn_tb = 1'b0;
        #10 rstn_tb = 1'b1;

        #100 data_tb = 4'd8;
        #50 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1;

        // ativa a contagem
        #10 enable_tb = 1'b1;

        // tenta dar um load enquanto conta
        #90 data_tb = 4'd5;
        #10 loadn_tb = 1'b0;
        #50 loadn_tb = 1'b1;

        // tenta dar um clear enquanto conta (força o nable para zero)
        #150 rstn_tb = 1'b0; enable_tb = 1'b0;
        #50 rstn_tb = 1'b1;
        #30;
    end

endmodule