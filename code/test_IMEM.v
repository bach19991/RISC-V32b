module test2;
  reg [31:0] PC;
  wire [31:0] inst;
  
IMEM dut (.PC(PC), .inst(inst));

initial begin
  PC=32'h000_0001_0;
  $monitor("inst=%0h", inst);
  #20;
  PC=32'h000_0002_0; 
  #50;
end
endmodule