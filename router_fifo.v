// Updated FIFO pointer widths and full condition

module fifo (
    input clk,
    input rst,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg full,
    output reg empty
);

// Change pointer widths to 4 bits
reg [3:0] wr_ptr, rd_ptr;

// Updated the full condition
assign full = (wr_ptr == 4'b1111 && rd_ptr == 4'b0000);

// Other FIFO logic goes here...

endmodule