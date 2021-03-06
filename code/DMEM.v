module DMEM (input clk, rst_n,
             input [31:0] dataW, Addr,
             input MemRW,               //0: read, 1: write
             output [31:0] dataR);
reg [7:0] DMEMi [0:256];

/*always @(Addr) begin
  if (MemRW==1'b1)
    DMEMi[Addr] = dataW;
  else
    DMEMi[Addr] =  DMEMi[Addr];
end

always @(posedge clk) begin
  if (!rst_n)
    dataR <= 32'h00000000;
  else
    dataR <= (MemRW==1'b0)? DMEMi[Addr]: 32'h00000000;
end
*/
assign dataR=(MemRW==1'b0)? {DMEMi[Addr+3], DMEMi[Addr+2], DMEMi[Addr+1], DMEMi[Addr]}: 32'hxxxxxxxx;
always @(posedge clk) begin
  if (!rst_n) begin
    //dataR <= 32'hxxxxxxxx;
    {DMEMi[Addr+3], DMEMi[Addr+2], DMEMi[Addr+1], DMEMi[Addr]} <= 32'hxxxxxxxx;
  end
  else begin
    if (MemRW==1'b1) begin
      {DMEMi[Addr+3], DMEMi[Addr+2], DMEMi[Addr+1], DMEMi[Addr]} <= dataW;
      //dataR <= 32'bxxxxxxxx;
    end
    else begin
      {DMEMi[Addr+3], DMEMi[Addr+2], DMEMi[Addr+1], DMEMi[Addr]} <=  {DMEMi[Addr+3], DMEMi[Addr+2], DMEMi[Addr+1], DMEMi[Addr]};
      //dataR <= DMEMi[Addr];
    end
  end
end
endmodule
    