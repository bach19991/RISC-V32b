module branch_comp (input [31:0] rs1, rs2,
                    input BrUn,
                    output reg BrEq, BrLt);
wire [31:0] rs1_n, rs2_n;
assign rs1_n= (~rs1) +1;
assign rs2_n= (~rs2) +1;


always @(BrUn, rs1, rs2) begin
  if (BrUn==1'b1) begin
    if (rs1 < rs2) begin
      BrLt = 1'b1;
      BrEq = 1'b0;
    end
    else if (rs1 == rs2) begin
      BrEq= 1'b1;
      BrLt= 1'bx;  
    end
    else begin
      BrEq= 1'b0;
      BrLt= 1'b0;
    end
  end
  else begin
    case ({rs1[31], rs2[31]})
      2'b10: begin                //rs1<0, rs2>0
               BrLt= 1'b1;
               BrEq= 1'b0;
             end
      2'b01: begin                //rs1 >0, rs2 <0
               BrLt= 1'b0;
               BrEq= 1'b0;
             end
      2'b00:   begin              // rs1, rs2 >0
               if (rs1 < rs2) begin
                 BrLt = 1'b1;
                 BrEq = 1'b0;
               end
               else if (rs1 == rs2) begin
                 BrEq= 1'b1;
                 BrLt= 1'bx;
               end
               else begin
                 BrEq= 1'b0;
                 BrLt= 1'b0;
               end
               end
      2'b11: begin
              if (rs1_n < rs2_n) begin
                BrLt = 1'b0;
                BrEq = 1'b0;
              end
              else if (rs1_n == rs2_n) begin
                BrEq= 1'b1;
                BrLt= 1'bx;
              end
              else begin
                BrEq= 1'b0;
                BrLt= 1'b1;
              end
            end
    endcase
  end
end
endmodule
      