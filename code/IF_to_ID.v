module IF_to_ID ( input clk, rst_n, stage1_rewrite, flush,//clock, reset
                  input [31:0] pc_in, pc_add4,//pc+4 for next clock cycle, pc for branch instruction calculation
                  input [31:0] inst_in, //instruction fetch
                  output reg [31:0] pc_out, pc_add4_out, //pc_out
                  output reg [31:0] inst_out); //instruction out
                  

                
always @(posedge clk) begin
  if (!rst_n) begin
    pc_out <= 32'h00400000;
    pc_add4_out <= 32'h00000000;
    inst_out <= 32'h11111111;
  end 
  //end 
  else if (stage1_rewrite) begin
    pc_out <= pc_out;
    pc_add4_out <= pc_add4_out;
    inst_out <= inst_out;
  end
  else if (flush) begin
	pc_out <= 32'h00400000;
	pc_add4_out <= 32'h00000000;
	inst_out <= 32'h11111111;
	end
  else begin
    pc_out <= pc_in;
    pc_add4_out <= pc_add4;
    inst_out <= inst_in;
  end
end
endmodule