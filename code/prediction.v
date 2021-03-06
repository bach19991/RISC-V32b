module prediction (input clk, rst_n,
                   input [31:0] pc, inst,
                   input pc_sel,
                   output pc_sel_out,
                   output [31:0] predict_pc);


lookup lut (.pc(pc), .predict_pc(predict_pc), .inst(inst));
bht bht (.clk(clk), .rst_n(rst_n), .x(pc_sel), .y(pc_sel_out), .inst(inst));

endmodule