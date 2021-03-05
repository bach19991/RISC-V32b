module testbench;
  reg clk, rst_n;
////////////////////////////DATA_PATH///////////////////////////////
wire [31:0] pc_out, pc_out1, pc_out2, pc_out3;
assign pc_out= dut.pc_out;
assign pc_out1= dut.pc_out1;
assign pc_out2= dut.pc_out2;
assign pc_out3= dut.pc_out3;


wire [31:0] predict_pc, pc_final, pc_add4, pc_branch,pc_right;
wire  pc_sel_out;
assign pc_add4= dut.pc_add4;
assign pc_sel_out= dut.pc_sel_out;
assign predict_pc= dut.predict_pc;
assign pc_branch= dut.pc_branch;
assign pc_right = dut.pc_right;
assign pc_final= dut.pc_final;


wire [31:0] inst, inst1,inst2;
assign inst= dut.inst;
assign inst1= dut.inst1;
assign inst2= dut.inst2;

wire flush;
assign flush = dut.flush;

wire [4:0] rs1, rs2, rs1_out, rs2_out;
wire [4:0] rd, rd_out, rd_out1, rd_out2;
assign rs1= dut.inst1[19:15];
assign rs1_out= dut.rs1_out;
assign rs2= dut.inst1[24:20];
assign rs2_out= dut.rs2_out;

assign rd= dut.inst1[11:7];
assign rd_out= dut.rd_out;
assign rd_out1= dut.rd_out1;
assign rd_out2= dut.rd_out2;

wire [31:0] dataA, dataB, dataD;
wire [31:0] data1_out, data2_out;
assign dataA= dut.dataA;
assign dataB= dut.dataB;
assign dataD= dut.regs.dataD;
assign data1_out= dut.data1_out;
assign data2_out= dut.data2_out;

wire stall, pc_rewrite, stage1_rewrite;
assign stall= dut.stall;
assign pc_rewrite= dut.pc_rewrite;
assign stage1_rewrite= dut.stage1_rewrite;

wire [3:0] alu_op_outx;
wire [1:0]  Wbsel_outx;
wire branch_outx, MemRW_outx, RegWen_outx;
assign alu_op_outx= dut.alu_op_outx;
assign Wbsel_outx= dut.Wbsel_outx;
assign branch_outx = dut.branch_outx;
assign MemRW_outx= dut.MemRW_outx;
assign RegWen_outx= dut.RegWen_outx; 


wire [3:0] alu_op_out, alu_sel;
assign alu_op_out= dut.alu_op_out;
assign alu_sel= dut.alu_sel;

wire [31:0] imm_out, imm_out1;
wire [2:0] imm_sel;
assign imm_sel= dut.imm_sel;
assign imm_out= dut.imm_out;
assign imm_out1= dut.imm_out1;

wire BrUn, BrLt, BrEq, lt1, lt2, eq1, eq2;
assign BrUn= dut.BrUn;
assign BrLt= dut.BrLt;
assign BrEq= dut.BrEq;
assign lt1= dut.alu.lt1;
assign lt2= dut.alu.lt2;
assign eq1= dut.alu.eq1;
assign eq2= dut.alu.eq2;

wire B_sel;
assign B_sel= dut.B_sel;
wire [1:0] fa, fb;
assign fa= dut.fa;
assign fb= dut.fb;

wire [31:0]  muxA_out;
assign muxA_out= dut.muxA_out;

wire [31:0]  muxB_out;
assign muxB_out= dut.muxB_out;

wire [31:0] in1, in2;
wire [31:0] alu_out1, alu_out2;
assign in1= dut.alu.in1;
assign in2= dut.alu.in2;
assign alu_out1= dut.alu_out1;
assign alu_out2= dut.alu_out2;


wire [31:0] data_out2, dataWr;
assign data_out2= dut.data_out2;
assign dataWr= dut.dataWr;

wire [31:0] dataR;
assign dataR= dut.dataR;

wire [31:0] wb;
wire [31:0] data_out3,alu_out3,pc_add4_4;
assign wb= dut.wb;
assign data_out3= dut.data_out3;
assign alu_out3= dut.alu_out3;
assign pc_add4_4= dut.pc_add4_4;
/////////////////////////////////Controller//////////////////////////////
wire [1:0] WBsel, Wbsel_out1, Wbsel_out2, Wbsel_out3;
assign WBsel= dut.WBsel;
assign Wbsel_out1= dut.stage2.MemReg_out;
assign Wbsel_out2= dut.stage3.MemReg_out;
assign Wbsel_out3= dut.stage4.MemReg_out;

wire RegWen, RegWen_out1, RegWen_out2, RegWen_out3;
assign RegWen= dut.WBsel;
assign RegWen_out1= dut.RegWen_out1;
assign RegWen_out2= dut.RegWen_out2;
assign RegWen_out3= dut.RegWen_out3;

wire MemRW, MemRW_out1, MemRW_out2;
assign MemRW= dut.MemRW;
assign MemRW_out1= dut.MemRW_out1;
assign MemRW_out2= dut.MemRW_out2;
/////////////////////////////////REGs////////////////////////////////////
wire [31:0] reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7, 
           reg_8, reg_9, reg_10, reg_11, reg_12, reg_13, reg_14, reg_15,
           reg_16, reg_17, reg_18, reg_19, reg_20, reg_21, reg_22, reg_23, 
           reg_24, reg_25, reg_26, reg_27, reg_28, reg_29, reg_30, reg_31;
assign reg_0= dut.regs.reg_0;
assign reg_1= dut.regs.reg_1;  
assign reg_2= dut.regs.reg_2;
assign reg_3= dut.regs.reg_3; 
assign reg_4= dut.regs.reg_4;
assign reg_5= dut.regs.reg_5;  
assign reg_6= dut.regs.reg_6;
assign reg_7= dut.regs.reg_7; 
assign reg_8= dut.regs.reg_8;
assign reg_9= dut.regs.reg_9;  
assign reg_10= dut.regs.reg_10;
assign reg_11= dut.regs.reg_11; 
assign reg_12= dut.regs.reg_12;
assign reg_13= dut.regs.reg_13;  
assign reg_14= dut.regs.reg_14;
assign reg_15= dut.regs.reg_15; 
assign reg_16= dut.regs.reg_16;
assign reg_17= dut.regs.reg_17;  
assign reg_18= dut.regs.reg_18;
assign reg_19= dut.regs.reg_19; 
assign reg_20= dut.regs.reg_20;
assign reg_21= dut.regs.reg_21;  
assign reg_22= dut.regs.reg_22;
assign reg_23= dut.regs.reg_23; 
assign reg_24= dut.regs.reg_24;
assign reg_25= dut.regs.reg_25;  
assign reg_26= dut.regs.reg_26;
assign reg_27= dut.regs.reg_27; 
assign reg_28= dut.regs.reg_28;
assign reg_29= dut.regs.reg_29;  
assign reg_30= dut.regs.reg_30;
assign reg_31= dut.regs.reg_31; 
/////////////////////////////////////////////////////
/////////////////////////////////REGs////////////////////////////////////
wire [31:0] DMEM_0, DMEM_1, DMEM_2, DMEM_3, DMEM_4, DMEM_5, DMEM_6, DMEM_7, 
           DMEM_8, DMEM_9, DMEM_10, DMEM_11, DMEM_12, DMEM_13, DMEM_14, DMEM_15,
           DMEM_16, DMEM_17, DMEM_18, DMEM_19, DMEM_20, DMEM_21, DMEM_22, DMEM_23, 
           DMEM_24, DMEM_25, DMEM_26, DMEM_27, DMEM_28, DMEM_29, DMEM_30, DMEM_31,
           DMEM_32, DMEM_33, DMEM_34, DMEM_35, DMEM_36, DMEM_37, DMEM_38, DMEM_39, 
           DMEM_40, DMEM_41, DMEM_42, DMEM_43, DMEM_44, DMEM_45, DMEM_46, DMEM_47,
           DMEM_48, DMEM_49, DMEM_50, DMEM_51, DMEM_52, DMEM_53, DMEM_54, DMEM_55, 
           DMEM_56, DMEM_57, DMEM_58, DMEM_59, DMEM_60, DMEM_61, DMEM_62, DMEM_63;
assign DMEM_0= {dut.DMEM.DMEMi[3],dut.DMEM.DMEMi[2],dut.DMEM.DMEMi[1],dut.DMEM.DMEMi[0]} ;
assign DMEM_1= {dut.DMEM.DMEMi[7],dut.DMEM.DMEMi[6],dut.DMEM.DMEMi[5],dut.DMEM.DMEMi[4]};  
assign DMEM_2= {dut.DMEM.DMEMi[11],dut.DMEM.DMEMi[10],dut.DMEM.DMEMi[9],dut.DMEM.DMEMi[8]};
assign DMEM_3= {dut.DMEM.DMEMi[15],dut.DMEM.DMEMi[14],dut.DMEM.DMEMi[13],dut.DMEM.DMEMi[12]}; 
assign DMEM_4= {dut.DMEM.DMEMi[19],dut.DMEM.DMEMi[18],dut.DMEM.DMEMi[17],dut.DMEM.DMEMi[16]};
assign DMEM_5= {dut.DMEM.DMEMi[23],dut.DMEM.DMEMi[22],dut.DMEM.DMEMi[21],dut.DMEM.DMEMi[20]};  
assign DMEM_6= {dut.DMEM.DMEMi[27],dut.DMEM.DMEMi[26],dut.DMEM.DMEMi[25],dut.DMEM.DMEMi[24]};
assign DMEM_7= {dut.DMEM.DMEMi[31],dut.DMEM.DMEMi[30],dut.DMEM.DMEMi[29],dut.DMEM.DMEMi[28]}; 
assign DMEM_8= {dut.DMEM.DMEMi[35],dut.DMEM.DMEMi[34],dut.DMEM.DMEMi[33],dut.DMEM.DMEMi[32]};
assign DMEM_9= {dut.DMEM.DMEMi[39],dut.DMEM.DMEMi[38],dut.DMEM.DMEMi[37],dut.DMEM.DMEMi[36]};  
assign DMEM_10= {dut.DMEM.DMEMi[43],dut.DMEM.DMEMi[42],dut.DMEM.DMEMi[41],dut.DMEM.DMEMi[40]};
assign DMEM_11= {dut.DMEM.DMEMi[47],dut.DMEM.DMEMi[46],dut.DMEM.DMEMi[45],dut.DMEM.DMEMi[44]}; 
assign DMEM_12= {dut.DMEM.DMEMi[51],dut.DMEM.DMEMi[50],dut.DMEM.DMEMi[49],dut.DMEM.DMEMi[48]};
assign DMEM_13= {dut.DMEM.DMEMi[55],dut.DMEM.DMEMi[54],dut.DMEM.DMEMi[53],dut.DMEM.DMEMi[52]};
assign DMEM_14= {dut.DMEM.DMEMi[59],dut.DMEM.DMEMi[58],dut.DMEM.DMEMi[57],dut.DMEM.DMEMi[56]};
assign DMEM_15= {dut.DMEM.DMEMi[63],dut.DMEM.DMEMi[62],dut.DMEM.DMEMi[61],dut.DMEM.DMEMi[60]}; 
assign DMEM_16= {dut.DMEM.DMEMi[67],dut.DMEM.DMEMi[66],dut.DMEM.DMEMi[65],dut.DMEM.DMEMi[64]};
assign DMEM_17= {dut.DMEM.DMEMi[71],dut.DMEM.DMEMi[70],dut.DMEM.DMEMi[69],dut.DMEM.DMEMi[68]};  
assign DMEM_18= {dut.DMEM.DMEMi[75],dut.DMEM.DMEMi[74],dut.DMEM.DMEMi[73],dut.DMEM.DMEMi[72]};
assign DMEM_19= {dut.DMEM.DMEMi[79],dut.DMEM.DMEMi[78],dut.DMEM.DMEMi[77],dut.DMEM.DMEMi[76]}; 
assign DMEM_20= {dut.DMEM.DMEMi[83],dut.DMEM.DMEMi[82],dut.DMEM.DMEMi[81],dut.DMEM.DMEMi[80]};
assign DMEM_21= {dut.DMEM.DMEMi[87],dut.DMEM.DMEMi[86],dut.DMEM.DMEMi[85],dut.DMEM.DMEMi[84]};  
assign DMEM_22= {dut.DMEM.DMEMi[91],dut.DMEM.DMEMi[90],dut.DMEM.DMEMi[89],dut.DMEM.DMEMi[88]};
assign DMEM_23= {dut.DMEM.DMEMi[95],dut.DMEM.DMEMi[94],dut.DMEM.DMEMi[93],dut.DMEM.DMEMi[92]}; 
assign DMEM_24= {dut.DMEM.DMEMi[99],dut.DMEM.DMEMi[98],dut.DMEM.DMEMi[97],dut.DMEM.DMEMi[96]};
assign DMEM_25= {dut.DMEM.DMEMi[103],dut.DMEM.DMEMi[102],dut.DMEM.DMEMi[101],dut.DMEM.DMEMi[100]} ;
assign DMEM_26= {dut.DMEM.DMEMi[107],dut.DMEM.DMEMi[106],dut.DMEM.DMEMi[105],dut.DMEM.DMEMi[104]};  
assign DMEM_27= {dut.DMEM.DMEMi[111],dut.DMEM.DMEMi[110],dut.DMEM.DMEMi[109],dut.DMEM.DMEMi[108]};
assign DMEM_28= {dut.DMEM.DMEMi[115],dut.DMEM.DMEMi[114],dut.DMEM.DMEMi[113],dut.DMEM.DMEMi[112]}; 
assign DMEM_29= {dut.DMEM.DMEMi[119],dut.DMEM.DMEMi[118],dut.DMEM.DMEMi[117],dut.DMEM.DMEMi[116]};
assign DMEM_30= {dut.DMEM.DMEMi[123],dut.DMEM.DMEMi[122],dut.DMEM.DMEMi[121],dut.DMEM.DMEMi[120]};  
assign DMEM_31= {dut.DMEM.DMEMi[127],dut.DMEM.DMEMi[126],dut.DMEM.DMEMi[125],dut.DMEM.DMEMi[124]};
assign DMEM_32= {dut.DMEM.DMEMi[131],dut.DMEM.DMEMi[130],dut.DMEM.DMEMi[129],dut.DMEM.DMEMi[128]}; 
assign DMEM_33= {dut.DMEM.DMEMi[135],dut.DMEM.DMEMi[134],dut.DMEM.DMEMi[133],dut.DMEM.DMEMi[132]};
assign DMEM_34= {dut.DMEM.DMEMi[139],dut.DMEM.DMEMi[138],dut.DMEM.DMEMi[137],dut.DMEM.DMEMi[136]};  
assign DMEM_35= {dut.DMEM.DMEMi[143],dut.DMEM.DMEMi[142],dut.DMEM.DMEMi[141],dut.DMEM.DMEMi[140]};
assign DMEM_36= {dut.DMEM.DMEMi[147],dut.DMEM.DMEMi[146],dut.DMEM.DMEMi[145],dut.DMEM.DMEMi[144]}; 
assign DMEM_37= {dut.DMEM.DMEMi[151],dut.DMEM.DMEMi[150],dut.DMEM.DMEMi[149],dut.DMEM.DMEMi[148]};
assign DMEM_38= {dut.DMEM.DMEMi[155],dut.DMEM.DMEMi[154],dut.DMEM.DMEMi[153],dut.DMEM.DMEMi[152]};
assign DMEM_39= {dut.DMEM.DMEMi[159],dut.DMEM.DMEMi[158],dut.DMEM.DMEMi[157],dut.DMEM.DMEMi[156]};
assign DMEM_40= {dut.DMEM.DMEMi[163],dut.DMEM.DMEMi[162],dut.DMEM.DMEMi[161],dut.DMEM.DMEMi[160]}; 
assign DMEM_41= {dut.DMEM.DMEMi[167],dut.DMEM.DMEMi[166],dut.DMEM.DMEMi[165],dut.DMEM.DMEMi[164]};
assign DMEM_42= {dut.DMEM.DMEMi[171],dut.DMEM.DMEMi[170],dut.DMEM.DMEMi[169],dut.DMEM.DMEMi[168]};  
assign DMEM_43= {dut.DMEM.DMEMi[175],dut.DMEM.DMEMi[174],dut.DMEM.DMEMi[173],dut.DMEM.DMEMi[172]};
assign DMEM_44= {dut.DMEM.DMEMi[179],dut.DMEM.DMEMi[178],dut.DMEM.DMEMi[177],dut.DMEM.DMEMi[176]}; 
assign DMEM_45= {dut.DMEM.DMEMi[183],dut.DMEM.DMEMi[182],dut.DMEM.DMEMi[181],dut.DMEM.DMEMi[180]};
assign DMEM_46= {dut.DMEM.DMEMi[187],dut.DMEM.DMEMi[186],dut.DMEM.DMEMi[185],dut.DMEM.DMEMi[184]};  
assign DMEM_47= {dut.DMEM.DMEMi[191],dut.DMEM.DMEMi[190],dut.DMEM.DMEMi[189],dut.DMEM.DMEMi[188]};
assign DMEM_48= {dut.DMEM.DMEMi[195],dut.DMEM.DMEMi[194],dut.DMEM.DMEMi[193],dut.DMEM.DMEMi[192]}; 
assign DMEM_49= {dut.DMEM.DMEMi[199],dut.DMEM.DMEMi[198],dut.DMEM.DMEMi[197],dut.DMEM.DMEMi[196]};
assign DMEM_50= {dut.DMEM.DMEMi[203],dut.DMEM.DMEMi[202],dut.DMEM.DMEMi[201],dut.DMEM.DMEMi[200]} ;
assign DMEM_51= {dut.DMEM.DMEMi[207],dut.DMEM.DMEMi[206],dut.DMEM.DMEMi[205],dut.DMEM.DMEMi[204]};  
assign DMEM_52= {dut.DMEM.DMEMi[211],dut.DMEM.DMEMi[210],dut.DMEM.DMEMi[209],dut.DMEM.DMEMi[208]};
assign DMEM_53= {dut.DMEM.DMEMi[215],dut.DMEM.DMEMi[214],dut.DMEM.DMEMi[213],dut.DMEM.DMEMi[212]}; 
assign DMEM_54= {dut.DMEM.DMEMi[219],dut.DMEM.DMEMi[218],dut.DMEM.DMEMi[217],dut.DMEM.DMEMi[216]};
assign DMEM_55= {dut.DMEM.DMEMi[223],dut.DMEM.DMEMi[222],dut.DMEM.DMEMi[221],dut.DMEM.DMEMi[220]};  
assign DMEM_56= {dut.DMEM.DMEMi[227],dut.DMEM.DMEMi[226],dut.DMEM.DMEMi[225],dut.DMEM.DMEMi[224]};
assign DMEM_57= {dut.DMEM.DMEMi[231],dut.DMEM.DMEMi[230],dut.DMEM.DMEMi[229],dut.DMEM.DMEMi[228]}; 
assign DMEM_58= {dut.DMEM.DMEMi[235],dut.DMEM.DMEMi[234],dut.DMEM.DMEMi[233],dut.DMEM.DMEMi[232]};
assign DMEM_59= {dut.DMEM.DMEMi[239],dut.DMEM.DMEMi[238],dut.DMEM.DMEMi[237],dut.DMEM.DMEMi[236]};  
assign DMEM_60= {dut.DMEM.DMEMi[243],dut.DMEM.DMEMi[242],dut.DMEM.DMEMi[241],dut.DMEM.DMEMi[240]};
assign DMEM_61= {dut.DMEM.DMEMi[247],dut.DMEM.DMEMi[246],dut.DMEM.DMEMi[245],dut.DMEM.DMEMi[244]}; 
assign DMEM_62= {dut.DMEM.DMEMi[251],dut.DMEM.DMEMi[250],dut.DMEM.DMEMi[249],dut.DMEM.DMEMi[248]};
assign DMEM_63= {dut.DMEM.DMEMi[255],dut.DMEM.DMEMi[254],dut.DMEM.DMEMi[253],dut.DMEM.DMEMi[252]};
/////////////////////////////////////////////////////
cpu_top dut (.clk(clk), .rst_n(rst_n));

initial begin
  clk=0;
  forever #10 clk= ~clk;
end

initial begin
  rst_n=0;
  #20;
  rst_n= ~rst_n;
 // $finish;
end
endmodule