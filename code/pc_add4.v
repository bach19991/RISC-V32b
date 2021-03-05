module pc_add4 (input [31:0] pc_in,
                output reg [31:0] pc_out);
always @(pc_in) 
begin
 pc_out= pc_in +4;
end
endmodule 