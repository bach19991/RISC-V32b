module MEM_to_WB (input clk, rst_n,
                  input [31:0] alu_in, //for normal instruction except load instruction
                  input [31:0] pc_add4,
                  input [31:0] dataR_in, //data from load instruction
                  input [4:0] rd,
                  input RegW, 
                  input [1:0] MemReg,
                  
                  output reg RegW_out, 
                  output reg [1:0] MemReg_out,
                  output reg [4:0] rd_out,
                  output reg [31:0] alu_out,
                  output reg [31:0] pc_add4_out,
                  output reg [31:0] dataR_out);
 always @(posedge clk) begin
   if (!rst_n) begin
     RegW_out <= 1'b0;
     MemReg_out <= MemReg;
     rd_out <= 5'b11111;
     alu_out <= 32'h00000000;
     pc_add4_out <= 32'h00000000;
     dataR_out <= 32'h00000000;
   end 
   else begin
     RegW_out <= RegW;
     MemReg_out <= MemReg;
     rd_out <= rd;
     alu_out <= alu_in;
     pc_add4_out <= pc_add4;
     dataR_out <= dataR_in;    
   end
 end
 endmodule
          