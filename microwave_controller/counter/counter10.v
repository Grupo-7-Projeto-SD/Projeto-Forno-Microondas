module counter10 (enable, clk, data, rstn, loadn, count, tc, zero);

    input [3:0] data;
    input clk, rstn, loadn, enable;

    output reg [3:0] count;
    output wire tc, zero;

    assign tc = (count == 4'd0) ? 1'b1 : 1'b0;
    assign zero = tc;

    initial begin
        count = 4'd0;
    end

    always @(posedge clk, negedge rstn) begin
        // reset (clear) em nivel baixo (entrada assíncrona)
        if (~rstn) begin
            count <= 4'd0;
        end else begin
            // enable nivel alto
            if (enable) begin
                // contagem decrescente (mod 10)
                if (count == 4'd0) begin
                    count <= 4'd9;
                end else begin
                    count <= count - 4'd1;
                end

            end else if (~loadn) begin
                count <= data;
            end
        end
    end

endmodule