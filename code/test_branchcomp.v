module test_branchcomp;
  reg [31:0] rs1, rs2;
  reg BrUn;
  wire BrLt, BrEq;
  
branch_comp dut (.rs1(rs1), .rs2(rs2), .BrUn(BrUn), .BrLt(BrLt), .BrEq(BrEq));

initial begin
  rs1=10;
  rs2=10;
  BrUn=0;
  #50;
  $display("BrLt= %b, BrEq= %b", BrLt, BrEq);
end
endmodule