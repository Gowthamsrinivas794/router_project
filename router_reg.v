`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 10:48:58
// Design Name: 
// Module Name: router_reg
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

module router_reg(
input clk,
input resetn,
input pkt_valid,
input [7:0] data_in,
output reg [7:0] data_out
);

always @(posedge clk)
begin
 if(!resetn)
  data_out <= 0;
 else if(pkt_valid)
  data_out <= data_in;
end

endmodule
