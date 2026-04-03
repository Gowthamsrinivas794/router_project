`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 10:59:10
// Design Name: 
// Module Name: router_tb
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


module router_tb;

reg clk;
reg resetn;
reg pkt_valid;
reg [7:0] data_in;
reg read_enb_0, read_enb_1, read_enb_2;

wire [7:0] data_out_0, data_out_1, data_out_2;

router_top DUT(
.clk(clk),
.resetn(resetn),
.pkt_valid(pkt_valid),
.data_in(data_in),
.read_enb_0(read_enb_0),
.read_enb_1(read_enb_1),
.read_enb_2(read_enb_2),
.data_out_0(data_out_0),
.data_out_1(data_out_1),
.data_out_2(data_out_2)
);

initial
begin
 clk = 0;
 forever #5 clk = ~clk;
end

initial
begin
 resetn = 0;
 pkt_valid = 0;
 #20 resetn = 1;

 send_packet(8'b00000010);
 send_packet(8'b01010101);
 send_packet(8'b10001111);

 #200 $finish;
end

task send_packet;
input [7:0] data;

begin
 @(posedge clk)
 pkt_valid = 1;
 data_in = data;

 @(posedge clk)
 pkt_valid = 0;
end
endtask

endmodule
