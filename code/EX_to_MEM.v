module EX_to_MEM (input clk, rst_n,flush,
                  input [31:0] pc_branch, pc_add4, //calculated pc for branch instruction
                  input [31:0] data_in, // data for store_word instruction
                  input [31:0] alu_in, //result from alu
                  input [4:0] rd,
                  input branch, memRW,
                  input RegW, 
                  input [1:0] MemReg,
                  
                  output reg branch_out, memRW_out,
                  output reg RegW_out, 
                  output reg [1:0] MemReg_out,
                  output reg [4:0] rd_out,
                  output reg [31:0] pc_branch_out, pc_add4_out, //pc of label
                  output reg [31:0] alu_out, //addr for DMEM
                  output reg [31:0] data_out); //data store in DMEM
                  
always @(posedge clk) begin
  if (!rst_n) begin
    branch_out <= 1'b0;
    memRW_out <= 1'b0;
    RegW_out <= 1'b0;
    MemReg_out <= MemReg;
    rd_out <= 5'b11111;
    pc_branch_out <= 32'h00000000;
    pc_add4_out <= 32'h00000000;
    alu_out <= 32'h00000000;
    data_out <= 32'h00000000;
  end 
  else if (flush) begin
     branch_out <= 1'b0;
    memRW_out <= 1'b0;
    RegW_out <= 1'b0;
    MemReg_out <= MemReg;
    rd_out <= 5'b11111;
    pc_branch_out <= 32'h00000000;
    pc_add4_out <= 32'h00000000;
    alu_out <= 32'h00000000;
    data_out <= 32'h00000000;
  end
  else begin
    branch_out <= branch;
    memRW_out <= memRW;
    RegW_out <= RegW;
    MemReg_out <= MemReg;
    rd_out <= rd;
    pc_branch_out <= pc_branch;
    pc_add4_out <= pc_add4;
    alu_out <= alu_in;
    data_out <= data_in;
  end
end
endmodule