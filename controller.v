module controller (
    input zero,
    input [2:0] phase, opcode,
    output reg sel,rd,ld_ir,halt,inc_pc,ld_ac,wr,ld_pc,data_e
);
    wire ALUOP;
    assign ALUOP=(opcode==3'b010)||(opcode==3'b011)||(opcode==3'b100)||(opcode==3'b101);

    always @(*) begin
        case(phase)
            3'b000:begin
                    sel   =1;
                    rd    =0;
                    ld_ir =0;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =0;
                    ld_pc =0;
                    wr    =0;
                    data_e=0;
                end
            3'b001:begin
                    sel   =1;
                    rd    =1;
                    ld_ir =0;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =0;
                    ld_pc =0;
                    wr    =0;
                    data_e=0;
                end
            3'b010:begin
                    sel   =1;
                    rd    =1;
                    ld_ir =1;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =0;
                    ld_pc =0;
                    wr    =0;
                    data_e=0;
                end
            3'b011:begin
                    sel   =1;
                    rd    =1;
                    ld_ir =1;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =0;
                    ld_pc =0;
                    wr    =0;
                    data_e=0;
                end
            3'b100:begin
                    sel   =0;
                    rd    =0;
                    ld_ir =0;
                    halt  =(opcode==3'b000);
                    inc_pc=1;
                    ld_ac =0;
                    ld_pc =0;
                    wr    =0;
                    data_e=0;
                end
            3'b101:begin
                    sel   =0;
                    rd    =(ALUOP);
                    ld_ir =0;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =0;
                    ld_pc =0;
                    wr    =0;
                    data_e=0;
                end
            3'b110:begin
                    sel   =0;
                    rd    =ALUOP;
                    ld_ir =0;
                    halt  =0;
                    inc_pc=(opcode==3'b001)&(zero);
                    ld_ac =0;
                    ld_pc =opcode==3'b111;
                    wr    =0;
                    data_e=opcode==3'b110;
                end
            3'b111:begin
                    sel   =0;
                    rd    =ALUOP;
                    ld_ir =0;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =ALUOP;
                    ld_pc =opcode==3'b111;
                    wr    =opcode==3'b110;
                    data_e=opcode==3'b110;
                end
            default:begin
                    sel   =1'b0;
                    rd    =1'b0;
                    ld_ir =0;
                    halt  =0;
                    inc_pc=0;
                    ld_ac =1'b0;
                    ld_pc =1'b0;
                    wr    =1'b0;
                    data_e=1'b0;
                end

        endcase
    end 
endmodule