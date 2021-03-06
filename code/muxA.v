module mux_A (input [31:0] rs1, wb, alu_out,
              input [1:0] A_sel,
              output reg [31:0] muxA_out);
always @(A_sel, wb, alu_out, rs1) begin
  case (A_sel)
    2'b00: muxA_out= rs1;
    2'b01: muxA_out= wb;
    2'b10: muxA_out= alu_out;
    default:;
  endcase
end
endmodule