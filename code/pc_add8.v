module pc_add8 (input [31:0] pc_in, 
                output [31:0] pc_out);

assign pc_out= pc_in +12;
endmodule