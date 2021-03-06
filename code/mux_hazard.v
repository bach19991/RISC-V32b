module mux_hazard (input stall,
                   input RegW, branch, MemRW, 
                   input [1:0] MemReg, 
                   input [3:0] alu_op, 
                   output reg RegW_out, branch_out, MemRW_out, 
                   output reg [1:0] MemReg_out, 
                   output reg [3:0] alu_op_out  );
always @(stall, RegW, branch, MemRW, MemReg, alu_op) begin
  if (stall) begin
    RegW_out= 1'b0;
    branch_out= 1'b0;
    MemRW_out= 1'b0;
    MemReg_out= 2'b00;
    alu_op_out= 4'b0000;
  end
  else begin
    RegW_out= RegW;
    branch_out= branch;
    MemRW_out= MemRW;
    MemReg_out= MemReg;
    alu_op_out= alu_op;
  end
end
endmodule

