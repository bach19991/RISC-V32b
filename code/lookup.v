module lookup (input [31:0] pc, inst,
               output [31:0] predict_pc);
  reg [11:0] predict;
always @(pc, inst) begin
  if ((inst[6:2]==5'b11000) || (inst[6:2]==5'b11011) || (inst[6:2]==5'b11001)) begin
  case(pc[11:0]) 
    12'h00c: predict= 12'h034;
	12'h01c: predict= 12'h038;
	12'h034: predict= 12'h058;
	12'h044: predict= 12'h03c;
	12'h024: predict= 12'h010;
	12'h054: predict= 12'h020;
endcase
end
end

assign predict_pc= {20'h00400, predict};
endmodule
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    