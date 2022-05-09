`include "./counter/counter10.v"
`include "./counter/counter6.v"

// manter apenas os nomes dos arquivos nos caminhos
// ao compilar no diretório ./microwave_controller/counter

module counter_level2(
    data, loadn, clrn, clk, enable,
    sec_ones_out, sec_tens_out, mins_out, zero
);

    input [3:0] data;
    input loadn, clrn, clk, enable;

    output reg [3:0] sec_ones_out, sec_tens_out, mins_out;
    output wire zero;

    wire [3:0] sec_ones, sec_tens, mins;
    wire tc_secones, tc_sectens, tc_mins, zero_secones, zero_sectens, zero_mins;

    counter10 sec_one(.enable(enable), .clk(clk), .data(data), .rstn(clrn), .loadn(loadn), .count(sec_ones), .tc(tc_secones), .zero(zero_secones));
    counter6 sec_ten(.enable(tc_secones & enable), .clk(clk), .data(sec_ones), .rstn(clrn), .loadn(loadn), .count(sec_tens), .tc(tc_sectens), .zero(zero_sectens));
    counter10 min(.enable(tc_sectens & enable), .clk(clk), .data(sec_tens), .rstn(clrn), .loadn(loadn), .count(mins), .tc(tc_mins), .zero(zero_mins));

    assign zero = zero_secones & zero_sectens & zero_mins;

    always @* begin
        mins_out <= (mins == 4'd0) ? 4'bzzzz : mins;
        sec_tens_out <= (sec_tens == 4'd0 && mins == 4'd0) ? 4'bzzzz : sec_tens;
        sec_ones_out <= (sec_ones == 4'd0 && sec_tens == 4'd0 && mins == 4'd0) ? 4'bzzzz : sec_ones;
    end

endmodule