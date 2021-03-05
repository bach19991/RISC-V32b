module mux_B (input [31:0] rs2, wb, alu_out, imm_in,
              input [1:0] B_sel,
              output reg [31:0] muxB_out);
always @(B_sel, wb, alu_out, rs2, imm_in) begin
  case (B_sel)
    2'b00: muxB_out= rs2;
    2'b01: muxB_out= wb;
    2'b10: muxB_out= alu_out;
    2'b11: muxB_out= imm_in;
    default:;
  endcase
end
endmodule