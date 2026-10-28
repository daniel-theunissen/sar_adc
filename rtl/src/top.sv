`default_nettype none
`timescale 1ns / 10ps

module top (
  input  wire clk,
  input  wire rst,
  input  wire cmp,
  output wire phi1,
  output wire phi2,
  output reg [6:0] d_out,
  output reg [6:0] sar_reg,
  output reg eoc
);

  reg [3:0] clk_counter;
  reg [3:0] conversion_tick;
  reg phi1_r;
  reg phi2_r;
  reg cmp_q;

  wire       tick_end  = (clk_counter == 4'd9);
  wire       comparing = (conversion_tick >= 4'd3);
  wire [3:0] clk_next = tick_end ? 4'd0 : clk_counter + 4'd1;
  wire [3:0] bit_full = 4'd9 - conversion_tick;
  wire [2:0] bit_idx  = bit_full[2:0];

  assign phi1 = phi1_r;
  assign phi2 = phi2_r;

  always @(posedge clk) begin
    if (!rst) begin
      clk_counter     <= 4'd0;
      conversion_tick <= 4'd0;
      phi1_r          <= 1'b0;
      phi2_r          <= 1'b1;
      cmp_q           <= 1'b0;
      sar_reg         <= 7'b0;
      d_out           <= 7'b0;
      eoc             <= 1'b0;
    end else begin
      clk_counter <= clk_next;
      phi1_r      <= comparing && (clk_next >= 4'd6);
      phi2_r      <= !(comparing && (clk_next >= 4'd7));
      eoc         <= tick_end && (conversion_tick == 4'd9);

      if (clk_counter == 4'd8) cmp_q <= cmp;

      if (tick_end) begin
        conversion_tick <= (conversion_tick == 4'd9) ? 4'd0 : conversion_tick + 4'd1;

        if (conversion_tick == 4'd2) begin
          sar_reg <= 7'b1000000;
        end else if (conversion_tick == 4'd9) begin
          d_out   <= {sar_reg[6:1], cmp_q};
          sar_reg <= 7'b0;
        end else if (conversion_tick >= 4'd3) begin
          sar_reg[bit_idx]        <= cmp_q;
          sar_reg[bit_idx - 3'd1] <= 1'b1;
        end
      end
    end
  end

endmodule

