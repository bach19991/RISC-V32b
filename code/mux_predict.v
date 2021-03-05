module mux_predict (input [31:0] pc, predict,
                    input prediction,
                    output [31:0] pc_mux_out);
assign pc_mux_out= (prediction==1'b1)? predict:pc;
endmodule