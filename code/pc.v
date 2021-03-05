module PC (input clk, rst_n, pc_rewrite,flush,
           input [31:0] pc_in,pc_right,
           output reg [31:0] pc_out);
always @(posedge clk) 
begin
  if (!rst_n)
    pc_out <= 32'h00400000;
  else if (pc_rewrite)
    pc_out <= pc_out;
  else if (flush)
	pc_out <= pc_right;
  else
    pc_out <= pc_in;
end
endmodule