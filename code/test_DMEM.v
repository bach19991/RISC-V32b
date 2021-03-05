module test1;
  reg clk, rst_n;
  reg [31:0] dataW, Addr;
  reg MemRW;
  wire [31:0] dataR;
  
DMEM dut (.clk(clk), .rst_n(rst_n), .dataW(dataW), .Addr(Addr), .MemRW(MemRW), .dataR(dataR));
initial begin
  clk=0;
  forever #10 clk= ~clk;
end

initial begin
  rst_n=0;
  #20;
  rst_n= ~rst_n;
end

initial begin
  #20;
  dataW= 32'h93029203;
  Addr= 1;
  MemRW=1'b1;
  $monitor("dataR= %b", dataR);
  #10;
  MemRW=1'b1;
  #20;
  MemRW=1'b0;
  #50;

end
endmodule