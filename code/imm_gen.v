module imm_gen (input [31:7] imm_in,
                input [2:0] imm_sel,
                output reg [31:0] imm_out);
always @(imm_sel, imm_in) 
begin
  case (imm_sel)
    3'b000: //I-format
              imm_out= (imm_in[31]==1'b1) ? {21'b111111111111111111111, imm_in[30:20]}:{21'b000000000000000000000, imm_in[30:20]}; 
    3'b001: //S-format
              imm_out= (imm_in[31]==1'b1) ? {21'b111111111111111111111, imm_in[30:25], imm_in[11:7]}: {21'b000000000000000000000, imm_in[30:25], imm_in[11:7]};
    3'b010: //B-format
              imm_out= (imm_in[31]==1'b1) ? {20'b11111111111111111111, imm_in[7], imm_in[30:25], imm_in[11:8], 1'b0}: {20'b00000000000000000000, imm_in[7], imm_in[30:25], imm_in[11:8], 1'b0};
    3'b011: //U-format
              imm_out= {imm_in[31:12], 12'b000000000000};
    3'b100: //J-format
              imm_out= (imm_in[31]==1'b1) ? {11'b11111111111, imm_in[31], imm_in[19:12], imm_in[20], imm_in[30:21], 1'b0}: {11'b00000000000, imm_in[31], imm_in[19:12], imm_in[20], imm_in[30:21], 1'b0};
    3'b101: //R-format
              imm_out= 32'h00000000; 
    default:;
  endcase
end
endmodule
    