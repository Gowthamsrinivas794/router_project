... // Existing code above 

// Add the FSM instantiation after router_reg
router_fsm fsm1(.clk(clk), .resetn(resetn), .pkt_valid(pkt_valid), .fifo_full(fifo_full), .write_enb(write_enb));

// Existing code below ...