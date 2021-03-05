module muxBB (input [1:0] fb,
              input [31:0] dataB, muxB_out,
              output [31:0] dataW);
assign dataW= (fb != 2'b00) ? dataB: muxB_out;
endmodule


