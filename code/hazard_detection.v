module hazard_detection (input [4:0] rs1, rs2, rd, 
                         input MemRead, RegWen,
                         output reg pc_rewrite, stage1_rewrite, stall);

always @(rs1, rs2, rd, MemRead) begin
  if ((MemRead==1'b0) && (RegWen==1'b1)) begin
    if (rd==rs1 || rd==rs2) begin
      pc_rewrite= 1'b1;
      stage1_rewrite =1'b1;
      stall= 1'b1;
    end
  end
  else begin
    pc_rewrite= 1'b0;
    stage1_rewrite =1'b0;
    stall= 1'b0;
  end
end
endmodule