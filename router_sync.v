`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 10:54:41
// Design Name: 
// Module Name: router_sync
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


module router_sync(
input clk,
input resetn,
input [1:0] data_in,
input write_enb,
output reg [2:0] write_enb_reg
);

always @(posedge clk)
begin
 if(!resetn)
  write_enb_reg <= 3'b000;

 else
 begin
  case(data_in)

   2'b00: write_enb_reg <= 3'b001;
   2'b01: write_enb_reg <= 3'b010;
   2'b10: write_enb_reg <= 3'b100;

   default: write_enb_reg <= 3'b000;

  endcase
 end
end

endmodule
