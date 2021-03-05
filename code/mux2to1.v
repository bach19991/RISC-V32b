module mux2to1 (input [31:0] pc_branch, pc_out1, inst,
				input branch,
                output reg flush,
                output reg [31:0] pc_right);

always @(pc_branch,pc_out1) begin
  if (((inst[6:2]==5'b11011) || (inst[6:2]==5'b11001) || (inst[6:2] ==5'b11000)) && (pc_branch != pc_out1) && branch) 
		begin
			flush <= 1'b1;
			pc_right <= pc_branch;		end
	else begin
		flush <= 1'b0;
		pc_right <= 32'hzzzzzzzz;
	end
end    
endmodule
