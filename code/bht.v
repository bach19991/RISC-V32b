module bht (input clk, rst_n,
            input [31:0] inst,
            input x,
            output reg y);
parameter [1:0] SN=2'b00, WN=2'b01, WT=2'b10, ST=2'b11;
reg [1:0] current, next;

always @(current, x, inst) begin
  if ((inst[6:2]==5'b11011) || (inst[6:2]==5'b11001)) begin
	y <= 1'b1;
	end
	else y <= 1'b0;
	
  if (inst[6:2]==5'b11000) begin
  case (current) 
    ST: if (x)
          next = ST;
        else
          next = WT;
    WT: if (x)
          next = ST;
        else
          next = WN;
    WN: if (x)
          next = WT;
        else
          next = SN;
    SN: if (x)
          next = WN;
        else
          next = SN; 
  endcase

  //y= ((current== ST) || (current==WT));
end
end

always @(current) begin
  case (current)
    2'b00: y=1'b0;
    2'b01: y=1'b0;
    2'b10: y=1'b1;
    2'b11: y=1'b1;
  endcase
end

always @(posedge clk) begin
  if (!rst_n)
    current <= SN;
  else
    current <= next;
end
endmodule            
          
    