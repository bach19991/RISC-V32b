module ID_to_EX (input clk, rst_n,flush, //clock, reset
                 input [31:0] pc_in, pc_add4, //pc for branch instruction calculation
                 input [31:0] data1_in, data2_in, //value of register1, register2
                 input [31:0] imm_in,inst, //value of immediate generator
                 input [4:0] rd, rs1, rs2,
                 input [3:0] alu_op, 
                 input branch, memRW,
                 input RegW, 
                 input [1:0] MemReg,
                 input B_sel_in, // moi them vao lan 1
				 
				 output reg B_sel_out,// moi them vao lan 1
                 output reg [3:0] alu_op_out, 
                 output reg branch_out, memRW_out, 
                 output reg RegW_out, 
                 output reg [1:0] MemReg_out,
                 output reg [31:0] pc_out, pc_add4_out, //pc_out
                 output reg [4:0] rd_out, rs1_out, rs2_out,
                 output reg [31:0] data1_out, data2_out, //value of rs1, rs2
                 output reg [31:0] imm_out,inst_out); //value of immediate generator out
                 
always @(posedge clk) begin
  if (!rst_n) begin
    B_sel_out  <= 1'b0;// moi them vao lan 1
    alu_op_out <= 1'b0;
    branch_out <= 1'b0;
    memRW_out <= 1'b0;
    RegW_out <= 1'b0;
    MemReg_out <= 2'b00;
    rd_out <= 5'b11111;
    rs1_out <= 5'b00000;
    rs2_out <= 5'b00000;
    pc_out <= 32'h00000000;
    pc_add4_out <= 32'h00000000;
    data1_out <= 32'h00000000;
    data2_out <= 32'h00000000;
    imm_out <= 32'h00000000;
	inst_out <= 32'h11111111;
  end 
  else if (flush) begin
	B_sel_out  <= 1'b0;// moi them vao lan 1
    alu_op_out <= 1'b0;
    branch_out <= 1'b0;
    memRW_out <= 1'b0;
    RegW_out <= 1'b0;
    MemReg_out <= 2'b00;
    rd_out <= 5'b11111;
    rs1_out <= 5'b00000;
    rs2_out <= 5'b00000;
    pc_out <= 32'h00000000;
    pc_add4_out <= 32'h00000000;
    data1_out <= 32'h00000000;
    data2_out <= 32'h00000000;
    imm_out <= 32'h00000000;
	inst_out <= 32'h11111111;
	end
  else begin
	B_sel_out <= B_sel_in;// moi them vao lan 1
    alu_op_out <= alu_op;
    branch_out <= branch;
    memRW_out <= memRW;
    RegW_out <= RegW;
    MemReg_out <= MemReg;
    rd_out <= rd;
    rs1_out <= rs1;
    rs2_out <= rs2;
    pc_out <= pc_in;
    pc_add4_out <= pc_add4;
    data1_out <= data1_in;
    data2_out <= data2_in;
    imm_out <= imm_in;
	inst_out <= inst;
  end
end
endmodule