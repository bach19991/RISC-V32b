module PCmux (input [31:0] alu_out,
              input [31:0] pc_add4,
              input pc_sel,
              output [31:0] pc_out);
assign pc_out= (pc_sel==1)? alu_out:pc_add4;
endmodule
