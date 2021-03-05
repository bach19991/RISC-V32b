module test_alu;
  reg [31:0] in1, in2;
  reg [3:0] alu_sel;
  wire [31:0] alu_out;
  
  alu dut (.in1(in1), .in2(in2), .alu_sel(alu_sel), .alu_out(alu_out));
  
initial begin
  in1= 32'h0000000a;
  in2= 32'h0000000a;
  alu_sel= 4'b0011;
  #20;
  $display("alu_out=%h", alu_out);
end
endmodule