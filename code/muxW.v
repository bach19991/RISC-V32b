module mux_W (input [31:0] mem, alu, pc_add4,
              input [1:0] WB_sel,
              output reg [31:0] wb);
always @(WB_sel, mem, alu, pc_add4) begin 
  case (WB_sel)
    2'b00: wb= mem;
    2'b01: wb= alu;
    2'b10: wb= pc_add4;
    default: wb= 32'hxxxxxxxx;
  endcase
end
endmodule