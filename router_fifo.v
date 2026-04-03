`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 10:56:14
// Design Name: 
// Module Name: router_fifo
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


module router_fifo(
input clk,
input resetn,
input write_enb,
input read_enb,
input [7:0] data_in,
output reg [7:0] data_out,
output full,
output empty
);

reg [7:0] mem [15:0];
reg [4:0] wr_ptr, rd_ptr;

assign full  = (wr_ptr == 16);
assign empty = (wr_ptr == rd_ptr);

always @(posedge clk)
begin
 if(!resetn)
  wr_ptr <= 0;

 else if(write_enb && !full)
 begin
  mem[wr_ptr] <= data_in;
  wr_ptr <= wr_ptr + 1;
 end
end

always @(posedge clk)
begin
 if(!resetn)
 begin
  rd_ptr <= 0;
  data_out <= 0;
 end

 else if(read_enb && !empty)
 begin
  data_out <= mem[rd_ptr];
  rd_ptr <= rd_ptr + 1;
 end
end

endmodule
