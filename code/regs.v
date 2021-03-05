module regs (input clk, rst_n,
             input [4:0] rs1, rs2, rd,
             input [31:0] wb,
             input RegWen,
             output reg [31:0] dataA, dataB);
reg [31:0] reg_0;
reg [31:0] reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7, 
           reg_8, reg_9, reg_10, reg_11, reg_12, reg_13, reg_14, reg_15,
           reg_16, reg_17, reg_18, reg_19, reg_20, reg_21, reg_22, reg_23, 
           reg_24, reg_25, reg_26, reg_27, reg_28, reg_29, reg_30, reg_31;
reg [31:0] dataD;
reg flag;

always @(posedge clk,wb,rd)
begin
  if (!rst_n)
begin
    dataD <= 32'h00000000;
	reg_0 <= 32'h00000000;
	reg_1 <= 32'h00000000;
	reg_2 <= 32'h00000000;
	reg_3 <= 32'h00000000;
	reg_4 <= 32'h00000000;
	reg_5 <= 32'h00000000;
	reg_6 <= 32'h00000000;
	reg_7 <= 32'h00000000;
	reg_8 <= 32'h00000000;
	reg_9 <= 32'h00000000;
	reg_10 <= 32'h00000000;
	reg_11 <= 32'h00000000;
	reg_12 <= 32'h00000000;
	reg_13 <= 32'h00000000;
	reg_14 <= 32'h00000000;
	reg_15 <= 32'h00000000;
	reg_16 <= 32'h00000000;
	reg_17 <= 32'h00000000;
	reg_18 <= 32'h00000000;
	reg_19 <= 32'h00000000;
	reg_20 <= 32'h00000000;
	reg_21 <= 32'h00000000;
	reg_22 <= 32'h00000000;
	reg_23 <= 32'h00000000;
	reg_24 <= 32'h00000000;
	reg_25 <= 32'h00000000;
	reg_26 <= 32'h00000000;
	reg_27 <= 32'h00000000;
	reg_28 <= 32'h00000000;
	reg_29 <= 32'h00000000;
	reg_30 <= 32'h00000000;
	reg_31 <= 32'h00000000;
end
  else if (RegWen) begin
    flag=1;
    dataD <= wb;
  end
  else 
    dataD <= dataD;
end

always @(negedge clk)
begin
  case (rs1)
    5'b00000: dataA<= 32'h00000000;
    5'b00001: dataA<= reg_1;
    5'b00010: dataA<= reg_2;
    5'b00011: dataA<= reg_3;
    5'b00100: dataA<= reg_4;
    5'b00101: dataA<= reg_5;
    5'b00110: dataA<= reg_6;
    5'b00111: dataA<= reg_7;
    5'b01000: dataA<= reg_8;
    5'b01001: dataA<= reg_9;
    5'b01010: dataA<= reg_10;
    5'b01011: dataA<= reg_11;
    5'b01100: dataA<= reg_12;
    5'b01101: dataA<= reg_13;
    5'b01110: dataA<= reg_14;
    5'b01111: dataA<= reg_15;
    5'b10000: dataA<= reg_16;
    5'b10001: dataA<= reg_17;
    5'b10010: dataA<= reg_18;
    5'b10011: dataA<= reg_19;
    5'b10100: dataA<= reg_20;
    5'b10101: dataA<= reg_21;
    5'b10110: dataA<= reg_22;
    5'b10111: dataA<= reg_23;
    5'b11000: dataA<= reg_24;
    5'b11001: dataA<= reg_25;
    5'b11010: dataA<= reg_26;
    5'b11011: dataA<= reg_27;
    5'b11100: dataA<= reg_28;
    5'b11101: dataA<= reg_29;
    5'b11110: dataA<= reg_30;
    5'b11111: dataA<= reg_31;
  endcase
end

always @(negedge clk)
begin
  case (rs2)
    5'b00000: dataB<= 32'h00000000;
    5'b00001: dataB<= reg_1;
    5'b00010: dataB<= reg_2;
    5'b00011: dataB<= reg_3;
    5'b00100: dataB<= reg_4;
    5'b00101: dataB<= reg_5;
    5'b00110: dataB<= reg_6;
    5'b00111: dataB<= reg_7;
    5'b01000: dataB<= reg_8;
    5'b01001: dataB<= reg_9;
    5'b01010: dataB<= reg_10;
    5'b01011: dataB<= reg_11;
    5'b01100: dataB<= reg_12;
    5'b01101: dataB<= reg_13;
    5'b01110: dataB<= reg_14;
    5'b01111: dataB<= reg_15;
    5'b10000: dataB<= reg_16;
    5'b10001: dataB<= reg_17;
    5'b10010: dataB<= reg_18;
    5'b10011: dataB<= reg_19;
    5'b10100: dataB<= reg_20;
    5'b10101: dataB<= reg_21;
    5'b10110: dataB<= reg_22;
    5'b10111: dataB<= reg_23;
    5'b11000: dataB<= reg_24;
    5'b11001: dataB<= reg_25;
    5'b11010: dataB<= reg_26;
    5'b11011: dataB<= reg_27;
    5'b11100: dataB<= reg_28;
    5'b11101: dataB<= reg_29;
    5'b11110: dataB<= reg_30;
    5'b11111: dataB<= reg_31;
  endcase
end

always @(flag, dataD)
begin
  flag = 0;
  case (rd)
    5'b00001: reg_1= dataD;
    5'b00010: reg_2= dataD;
    5'b00011: reg_3= dataD;
    5'b00100: reg_4= dataD;
    5'b00101: reg_5= dataD;
    5'b00110: reg_6= dataD;
    5'b00111: reg_7= dataD;
    5'b01000: reg_8= dataD;
    5'b01001: reg_9= dataD;
    5'b01010: reg_10= dataD;
    5'b01011: reg_11= dataD;
    5'b01100: reg_12= dataD;
    5'b01101: reg_13= dataD;
    5'b01110: reg_14= dataD;
    5'b01111: reg_15= dataD;
    5'b10000: reg_16= dataD;
    5'b10001: reg_17= dataD;
    5'b10010: reg_18= dataD;
    5'b10011: reg_19= dataD;
    5'b10100: reg_20= dataD;
    5'b10101: reg_21= dataD;
    5'b10110: reg_22= dataD;
    5'b10111: reg_23= dataD;
    5'b11000: reg_24= dataD;
    5'b11001: reg_25= dataD;
    5'b11010: reg_26= dataD;
    5'b11011: reg_27= dataD;
    5'b11100: reg_28= dataD;
    5'b11101: reg_29= dataD;
    5'b11110: reg_30= dataD;
    5'b11111: reg_31= dataD;
  endcase
end
endmodule

