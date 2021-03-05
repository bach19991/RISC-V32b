module controller (input [31:0] inst,
                   input BrEq, BrLt,
                   output reg PCsel, RegWen, BrUn, Bsel, Asel, MemRW, 
                   output reg [2:0] imm_sel, 
                   output reg [3:0] Alu_sel,
                   output reg [1:0] WBsel);


always @(inst, BrEq, BrLt) begin
  case (inst[6:2])
    //R-instruction
    5'b01100:  begin 
                 PCsel = 1'b0;
                 imm_sel = 3'b101;
                 RegWen = 1'b1;
                 //BrUn = 1'b0; //=x
                 Asel= 1'b0;
                 Bsel= 1'b0;
                 MemRW= 1'bx;
                 WBsel= 2'b01;
                  case ({inst[30], inst[14:12]})
                    4'b0000:  Alu_sel= 4'b0000; //ADD
                    4'b1000:  Alu_sel= 4'b0001; //SUB
                    4'b0001:  Alu_sel= 4'b0010; //SLL
                    4'b0010:  Alu_sel= 4'b0011; //SLT
                    4'b0011:  Alu_sel= 4'b0100; //SLTU
                    4'b0100:  Alu_sel= 4'b0101; //XOR
                    4'b0101:  Alu_sel= 4'b0110; //SRL
                    4'b1101:  Alu_sel= 4'b0111; //SRA
                    4'b0110:  Alu_sel= 4'b1000; //OR
                    4'b0111:  Alu_sel= 4'b1001; //AND
                    default:  Alu_sel= 4'bxxxx;
                  endcase
                BrUn= (Alu_sel==4'b0100);
              end
     
     //I-instruction (arithmetic)
     5'b00100: begin
                 PCsel = 1'b0;
                 imm_sel = 3'b000;
                 RegWen = 1'b1;
                 //BrUn = 1'b0;//=x
                 Asel= 1'b0;
                 Bsel= 1'b1;
                 MemRW= 1'bx;
                 WBsel= 2'b01;
                 casex ({inst[30], inst[14:12]})
                   4'bx000: Alu_sel= 4'b0000;
                   4'bx010: Alu_sel= 4'b0011;
                   4'bx011: Alu_sel= 4'b0100;
                   4'bx100: Alu_sel= 4'b0101;
                   4'bx110: Alu_sel= 4'b1000;
                   4'bx111: Alu_sel= 4'b1001;
                   4'b0001: Alu_sel= 4'b0010;
                   4'b0101: Alu_sel= 4'b0110;
                   4'b1101: Alu_sel= 4'b0111;
                 endcase
                 BrUn= (Alu_sel==4'b0100);
               end
     
      //I-instruction (load-LW)          
      5'b00000: begin
                 PCsel = 1'b0;
                 imm_sel = 3'b000;
                 RegWen = 1'b1;
                 BrUn = 1'b0; //=x
                 Alu_sel= 4'b0000;
                 Asel= 1'b0;
                 Bsel= 1'b1;
                 MemRW= 1'b0;
                 WBsel= 2'b00;
               end
               
      //S-instruction (store-SW)
      5'b01000: begin
                 PCsel = 1'b0;
                 imm_sel = 3'b001;
                 RegWen = 1'b0;
                 BrUn = 1'b0;//=x
                 Alu_sel= 4'b0000;
                 Asel= 1'b0;
                 Bsel= 1'b1;
                 MemRW= 1'b1;
                 WBsel= 2'b00;//=xx
               end
               
      //B-instruction
      5'b11000: begin
                  case (inst[14:12])
                    3'b000: begin //BEQ
                              imm_sel=3'b010;
                              RegWen= 1'b0;
                              BrUn= 1'b0;//=x
                              Asel= 1'b1;
                              Bsel= 1'b1;
                              Alu_sel=4'b0000;
                              MemRW= 1'bx;
                              WBsel= 2'b00;//=xx
                              if (BrEq) 
                                PCsel=1'b1;
                              else
                                PCsel= 1'b0;
                            end
                    3'b001: begin //BNE
                              imm_sel=3'b010;
                              RegWen= 1'b0;
                              BrUn= 1'b0;//=x
                              Asel= 1'b1;
                              Bsel= 1'b1;
                              Alu_sel=4'b0000;
                              MemRW= 1'bx;
                              WBsel= 2'b00;//=xx
                              if (BrEq) 
                                PCsel=1'b0;
                              else
                                PCsel= 1'b1;
                            end
                                
                    3'b100: begin //BLT
                              imm_sel=3'b010;
                              RegWen= 1'b0;
                              BrUn= 1'b0;
                              Asel= 1'b1;
                              Bsel= 1'b1;
                              Alu_sel=4'b0000;
                              MemRW= 1'bx;
                              WBsel= 2'b00;//=xx
                              if (BrLt) 
                                PCsel= 1'b1;
                              else
                                PCsel= 1'b0;
                            end 
                    3'b110: begin //BLTU
                              imm_sel=3'b010;
                              RegWen= 1'b0;
                              BrUn= 1'b1;
                              Asel= 1'b1;
                              Bsel= 1'b1;
                              Alu_sel=4'b0000;
                              MemRW= 1'bx;
                              WBsel= 2'b00;//=xx
                              if (BrLt) 
                                PCsel= 1'b1;
                              else
                                PCsel= 1'b0;
                            end 
                    3'b101: begin //BGE
                              imm_sel=3'b010;
                              RegWen= 1'b0;
                              BrUn= 1'b0;
                              Asel= 1'b1;
                              Bsel= 1'b1;
                              Alu_sel=4'b0000;
                              MemRW= 1'bx;
                              WBsel= 2'b00;//=xx
                              if (BrLt) 
                                PCsel= 1'b0;
                              else
                                PCsel= 1'b1;
                            end 
                    3'b111: begin //BGEU
                              imm_sel=3'b010;
                              RegWen= 1'b0;
                              BrUn= 1'b1;
                              Asel= 1'b1;
                              Bsel= 1'b1;
                              Alu_sel=4'b0000;
                              MemRW= 1'bx;
                              WBsel= 2'b00;//=xx
                              if (BrLt) 
                                PCsel= 1'b0;
                              else
                                PCsel= 1'b1;
                            end
                  endcase
                end
          //U-instruction (LUI)
          5'b01101:  begin
                       PCsel = 1'b0;
                       imm_sel = 3'b011;
                       RegWen = 1'b1;
                       BrUn = 1'b0;//=x
                       Alu_sel= 4'b1010;
                       Asel= 1'b0; //=x
                       Bsel= 1'b1;
                       MemRW= 1'bx;
                       WBsel= 2'b01;
                     end
          //U-instruction (AUIPC)
          5'b00101:  begin
                       PCsel = 1'b0;
                       imm_sel = 3'b011;
                       RegWen = 1'b1;
                       BrUn = 1'b0;//=x
                       Alu_sel= 4'b0000;
                       Asel= 1'b1;
                       Bsel= 1'b1;
                       MemRW= 1'bx;
                       WBsel= 2'b01;
                     end
           //J-instruction (JAL)
           5'b11011: begin
                       PCsel = 1'b1;
                       imm_sel = 3'b100;
                       RegWen = 1'b1;
                       BrUn = 1'b0;//=x
                       Alu_sel= 4'b0000;
                       Asel= 1'b1;
                       Bsel= 1'b1;
                       MemRW= 1'bx;
                       WBsel= 2'b10;
                     end
                                              
           //J-instruction (JARL)
           5'b11001: begin
                       if (inst[14:12]==3'b000) begin
                         PCsel = 1'b1;
                         imm_sel = 3'b000;
                         RegWen = 1'b1;
                         BrUn = 1'b0;//=x
                         Alu_sel= 4'b0000;
                         Asel= 1'b0;
                         Bsel= 1'b1;
                         MemRW= 1'bx;
                         WBsel= 2'b10;
                       end
                     end
   endcase
 end
 endmodule
     
     
     
     