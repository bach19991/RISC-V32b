module flushD (input clk, rst_n,
               input flush,
               output reg flush_out);
always @(posedge clk) begin
  if (!rst_n) 
    flush_out <=0;
  else
    flush_out <=flush;
end
endmodule