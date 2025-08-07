module memory #(
    parameter AWIDTH =5,
    parameter DWIDTH =8 
) (
    input clk, wr, rd,
    input [AWIDTH-1:0] addr,
    inout [DWIDTH-1:0] data
);
    reg [DWIDTH-1:0] mem [2**AWIDTH-1:0];

    always @(posedge clk) begin
        if(wr)
            mem[addr]<=data;
    end  

    assign data = rd ? mem[addr] : 'bz ;

endmodule
