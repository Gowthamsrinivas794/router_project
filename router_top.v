`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 10:47:18
// Design Name: 
// Module Name: router_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module router_top(
input clk,
input resetn,
input pkt_valid,
input [7:0] data_in,
input read_enb_0,
input read_enb_1,
input read_enb_2,

output [7:0] data_out_0,
output [7:0] data_out_1,
output [7:0] data_out_2,
output vld_out_0,
output vld_out_1,
output vld_out_2,
output err
);

wire [7:0] dout;
wire write_enb;
wire [2:0] write_enb_reg;
wire fifo_full;
wire soft_reset_0, soft_reset_1, soft_reset_2;

router_reg reg1(
.clk(clk),
.resetn(resetn),
.pkt_valid(pkt_valid),
.data_in(data_in),
.data_out(dout)
);

router_sync sync1(
.clk(clk),
.resetn(resetn),
.data_in(dout[1:0]),
.write_enb(write_enb),
.write_enb_reg(write_enb_reg)
);

router_fifo fifo0(
.clk(clk),
.resetn(resetn),
.write_enb(write_enb_reg[0]),
.read_enb(read_enb_0),
.data_in(dout),
.data_out(data_out_0),
.full(),
.empty(vld_out_0)
);

router_fifo fifo1(
.clk(clk),
.resetn(resetn),
.write_enb(write_enb_reg[1]),
.read_enb(read_enb_1),
.data_in(dout),
.data_out(data_out_1),
.full(),
.empty(vld_out_1)
);

router_fifo fifo2(
.clk(clk),
.resetn(resetn),
.write_enb(write_enb_reg[2]),
.read_enb(read_enb_2),
.data_in(dout),
.data_out(data_out_2),
.full(),
.empty(vld_out_2)
);

endmodule
