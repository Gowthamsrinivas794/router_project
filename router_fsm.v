`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2026 10:57:52
// Design Name: 
// Module Name: router_fsm
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


module router_fsm(
input clk,
input resetn,
input pkt_valid,
input fifo_full,
output reg write_enb
);

parameter IDLE = 2'b00,
          LOAD = 2'b01,
          WAIT = 2'b10;

reg [1:0] state,next;

always @(posedge clk)
begin
 if(!resetn)
  state <= IDLE;
 else
  state <= next;
end

always @(*)
begin
 case(state)

 IDLE:
 begin
  if(pkt_valid)
   next = LOAD;
  else
   next = IDLE;
 end

 LOAD:
 begin
  if(fifo_full)
   next = WAIT;
  else
   next = LOAD;
 end

 WAIT:
 begin
  if(!fifo_full)
   next = LOAD;
  else
   next = WAIT;
 end

 default: next = IDLE;

 endcase
end

always @(*)
begin
 write_enb = (state == LOAD);
end

endmodule
