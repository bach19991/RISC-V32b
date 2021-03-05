module flush (input [31:0] pc_branch, predict_pc, pc,
              input [1:0] count,
              output reg flush);

always @(pc_branch, predict_pc, pc, count) begin
  if (count==1 || count==0) 
    flush=0;
    
else if ((pc[6:2]==5'b11011) || (pc[6:2]==5'b11001)) begin
    flush= 1'b1;
    //count=2;
  end
  else if ((pc [6:2]== 5'b11000) && (pc_branch!=predict_pc)) begin
    flush= 1'b1;
    //count=2;
  end
  else begin
   // count=0;
    flush=1'b0;
  end
end
endmodule