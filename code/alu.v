
module alu (input [31:0] in1, in2,
            input [3:0] alu_sel,
            output reg [31:0] alu_out);

//Find max{in1, in2} for SLT, SLTU            
wire lt1, lt2, eq1, eq2;
branch_comp c1 (.rs1(in1), .rs2(in2), .BrUn(1'b0), .BrEq(eq1), .BrLt(lt1));
branch_comp c2 (.rs1(in1), .rs2(in2), .BrUn(1'b1), .BrEq(eq2), .BrLt(lt2));

/*LUI, adding wwith signed 12-bit number
wire [31:0] num_s;
assign num_s= 32'h00001000;
wire special;
assign special= (alu_sel==4'b1010);*/


always @(alu_sel, in1, in2, eq1, eq2, lt1, lt2) begin
  case (alu_sel)
    4'b0000: alu_out= in1 + in2;
             /*begin
               if (special==1'b0) 
                 alu_out= in1 + in2;
               else
                 alu_out= in1 - num_s + in2;
             end*/
    
    4'b0001: alu_out= in1 - in2;
    
    4'b0010: alu_out= in1 << in2;
    
    4'b0011: begin
               if (eq1)
                 alu_out= 32'h00000000;
               else if (lt1)
                 alu_out= 32'hffffffff;
               else
                 alu_out= 32'h00000000;
             end
               
    4'b0100: begin
               if (eq2)
                 alu_out= 32'h00000000;
               else if (lt2)
                 alu_out= 32'hffffffff;
               else
                 alu_out= 32'h00000000;
             end
               
    4'b0101: alu_out = in1 ^ in2;
    
    4'b0110: alu_out= in1 >> in2;
    
    4'b0111: alu_out= in1 >>> in2;
    
    4'b1000: alu_out= in1 | in2;
    
    4'b1001: alu_out= in1 & in2;
    
    4'b1010: alu_out= in2; // for LUI
    
    default: alu_out= 32'hxxxxxxxx;
  endcase
end
endmodule
               