module cpu_top (input clk, rst_n);
  
  //I/O PCmux
  wire [31:0] pc_add4, pc_final, pc_right;
  wire [31:0] inst,inst2;
  wire  pc_sel, pc_src,flush;
  wire [31:0] pc_branch; //addsum
  wire [31:0] pc_out,pc_out3;
  wire pc_sel_out;
  wire [31:0] predict_pc;  
    prediction prediction (.clk(clk), .rst_n(rst_n), .pc(pc_out), .inst(inst), .pc_sel(flush), .pc_sel_out(pc_sel_out), .predict_pc(predict_pc));
    
    mux_predict mux_predict (.pc(pc_add4), .predict(predict_pc), .prediction(pc_sel_out), .pc_mux_out(pc_final));
  
  //I/O PC

  wire pc_rewrite;
    PC PC (.clk(clk), .rst_n(rst_n), .pc_in(pc_final), .pc_out(pc_out), .pc_rewrite(pc_rewrite), .flush(flush),.pc_right(pc_right));
    
    pc_add4 pc_add (.pc_in(pc_out), .pc_out(pc_add4));
    
  //I/O IMEM
 
    IMEM IMEM (.PC(pc_out), .inst(inst));
  
  /////*IF_to_ID*////
  wire [31:0] pc_out1, pc_add4_1, pc_add4_2, pc_add4_3, pc_add4_4;
  wire [31:0] inst1;
  
  wire stage1_rewrite;
  IF_to_ID stage1 (.clk(clk), .rst_n(rst_n), .pc_in(pc_out), .inst_in(inst), .pc_out(pc_out1), .inst_out(inst1), .pc_add4(pc_add4), .pc_add4_out(pc_add4_1),
                   .stage1_rewrite(stage1_rewrite), .flush(flush));
  
  ////*ID_to_EX*////
   wire [31:0] wb, dataA, dataB; //I/O regs
   wire [31:0] imm_out; //I/O imm gen
   wire B_sel, B_sel_out; // mux B
   wire A_sel;
   wire MemRW; //DMEM
   wire [1:0] WBsel;
   //wire RegWen;
   wire [3:0] alu_sel; //alu
wire branch;
wire branch_out1, alu_src_out, MemRW_out1, RegWen_out1;
wire [3:0] alu_op_out;
wire [1:0] Wbsel_out1;
wire [4:0] rd_out, rs1_out, rs2_out;
wire [31:0] pc_out2, data1_out, data2_out, imm_out1;
//assign branch= inst1[6]&inst[5]&(~inst[4])&(~inst[3])&(~inst[2]);  
wire stall;
hazard_detection hazard_detection (.rd(rd_out), .rs1(inst1[19:15]), .rs2(inst1[24:20]), .MemRead(MemRW_out1), .RegWen(RegWen_out1),
                                   .pc_rewrite(pc_rewrite), .stage1_rewrite(stage1_rewrite), .stall(stall));


wire [3:0] alu_op_outx;
wire [1:0]  Wbsel_outx;
wire branch_outx, MemRW_outx, RegWen_outx;
  mux_hazard mux_hazard (.stall(stall), .alu_op(alu_sel), .branch(pc_sel), .MemRW(MemRW), .RegW(RegWen), .MemReg(WBsel), 
                         .alu_op_out(alu_op_outx), .branch_out(branch_outx), .MemRW_out(MemRW_outx), .RegW_out(RegWen_outx), .MemReg_out(Wbsel_outx));


  ID_to_EX stage2 (.clk(clk), .rst_n(rst_n), .pc_in(pc_out1), .data1_in(dataA), .data2_in(dataB), .imm_in(imm_out), .rd(inst1[11:7]), .rs1(inst1[19:15]), .rs2(inst1[24:20]),
                   .pc_add4(pc_add4_1), .pc_add4_out(pc_add4_2), .B_sel_in(B_sel), .flush(flush), .inst(inst1),
                   .alu_op(alu_op_outx), .branch(branch_outx), .memRW(MemRW_outx), .RegW(RegWen_outx), .MemReg(Wbsel_outx), 
                   .alu_op_out(alu_op_out), .branch_out(branch_out1), .B_sel_out(B_sel_out),
                   .memRW_out(MemRW_out1), .RegW_out(RegWen_out1), .MemReg_out(Wbsel_out1), .rd_out(rd_out), .rs1_out(rs1_out), .rs2_out(rs2_out),
                   .pc_out(pc_out2), .data1_out(data1_out), .data2_out(data2_out), .imm_out(imm_out1),.inst_out(inst2));

addsum addsum (.pc(pc_out2), .imm(imm_out1), .pc_branch(pc_branch));  

mux2to1 mux (.pc_branch(pc_branch),. pc_out1(pc_out1),.inst(inst2), .flush(flush),.pc_right(pc_right),.branch(branch_out1));               
/////*EX_to_MEM*////
wire branch_out2, MemRW_out2, RegWen_out2;
wire [1:0] Wbsel_out2;
wire [4:0] rd_out1;
wire [31:0] data_out2, alu_out1, alu_out2;
EX_to_MEM stage3  (.clk(clk), .rst_n(rst_n), .pc_branch(pc_branch), .data_in(data2_out), .alu_in(alu_out1), .rd(rd_out), .pc_add4(pc_add4_2), .pc_add4_out(pc_add4_3), 
                   .branch(branch_out1), .memRW(MemRW_out1), .RegW(RegWen_out1), .MemReg(Wbsel_out1),.flush(flush),
                   .branch_out(pc_src), .memRW_out(MemRW_out2), 
                   .RegW_out(RegWen_out2), .MemReg_out(Wbsel_out2),
                   .pc_branch_out(pc_out3), .data_out(data_out2), .alu_out(alu_out2), .rd_out(rd_out1));
                                      
////*MEM_to_WB*////
wire RegWen_out3;
wire [1:0] Wbsel_out3;
wire [4:0] rd_out2;
wire [31:0] data_out3, alu_out3;
wire [31:0] dataR; //DMEM output
MEM_to_WB stage4 ( .clk(clk), .rst_n(rst_n), .alu_in(alu_out2), .dataR_in(dataR), .rd(rd_out1), .pc_add4(pc_add4_3), .pc_add4_out(pc_add4_4),
                   .RegW(RegWen_out2), .MemReg(Wbsel_out2),
                   .RegW_out(RegWen_out3), .MemReg_out(Wbsel_out3),
                   .dataR_out(data_out3), .alu_out(alu_out3), .rd_out(rd_out2));                  
    
///*FORWARDING_UNIT*///
wire [1:0] fa, fb;
forwarding_unit fw (.EX_MEM_rd(rd_out1), .MEM_WB_rd(rd_out2), .RegW_in1(RegWen_out2), .RegW_in2(RegWen_out3), .rs1(rs1_out), .rs2(rs2_out), .fa(fa), .fb(fb), .B_sel(B_sel));
    
//I/O mux_A 
  wire [31:0] muxA_out;
    mux_A mux_A (.A_sel(fa), .wb(wb), .alu_out(alu_out1), .rs1(data1_out), .muxA_out(muxA_out));
    
    
  //I/O mux_B
 
  wire [31:0] muxB_out;
    mux_B mux_B (.B_sel(fb), .wb(wb), .alu_out(alu_out2), .rs2(data2_out), .imm_in(imm_out1), .muxB_out(muxB_out));   
  //I/O regs
  
 
    regs regs (.clk(clk), .rst_n(rst_n), .rs1(inst1[19:15]), .rs2(inst1[24:20]), .rd(rd_out2), .RegWen(RegWen_out3), .wb(wb), .dataA(dataA), .dataB(dataB));
  
  //I/O imm_gen
  wire [2:0] imm_sel;

    imm_gen imm_gen (.imm_in(inst1[31:7]), .imm_sel(imm_sel), .imm_out(imm_out));
    
  //I/O branch_comp
  wire BrUn, BrLt, BrEq;
  
    branch_comp branch_comp (.rs1(dataA), .rs2(dataB), .BrUn(BrUn), .BrEq(BrEq), .BrLt(BrLt));
  
  
    
  //I/O alu
  
    alu alu (.in1(muxA_out), .in2(muxB_out), .alu_sel(alu_op_out), .alu_out(alu_out1));
    
    
  //I/O DMEM
  wire [31:0] dataWr;
  muxBB muxBB (.fb(fb), .dataB(wb), .muxB_out(muxB_out), .dataW(dataWr));

  DMEM DMEM (.clk(clk), .rst_n(rst_n), .dataW(dataWr), .Addr(alu_out2), .MemRW(MemRW_out2), .dataR(dataR));
  //DMEM_2 DMEM (.clk(clk), .rst_n(rst_n), .dataW(dataB), .Addr(alu_out[4:0]), .MemRW(MemRW), .dataR(dataR));
  
  //I/O mux_W

    mux_W mux_W (.mem(data_out3), .alu(alu_out3), .pc_add4(pc_add4_4), .WB_sel(Wbsel_out3), .wb(wb));
    
  controller controller (.inst(inst1), .BrEq(BrEq), .BrLt(BrLt), .PCsel(pc_sel),
						 .RegWen(RegWen), .BrUn(BrUn), 
                         .Bsel(B_sel), .Asel(A_sel), .MemRW(MemRW),
						 .imm_sel(imm_sel), .Alu_sel(alu_sel), .WBsel(WBsel));
endmodule 
    
    