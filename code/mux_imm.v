module mux_imm (input B_sel,
                input [31:0] imm_in, muxA_in,
                output [31:0] mux_imm_out);
assign mux_imm_out= (B_sel)? imm_in: muxA_in;
endmodule