module four_bit_adder (
    input [3:0] A,B,
    input Cin,
    output [3:0] S,
    output Cout
);
    assign {Cout,S}=A+B+Cin;
endmodule

module full_adder_structural (
    input A,B,Cin,
    output reg S,Cout
);
    assign S=A^B^Cin;
    assign Cout=(A&B)|(Cin&(A^B));
endmodule

module full_adder_behavioural (
    input A,B,Cin,
    output reg S,Cout
);
    always @(*) begin
        case ({A,B,Cin})
            000: {Cout,S}=2'b00; 
            001: {Cout,S}=2'b01; 
            010: {Cout,S}=2'b01; 
            011: {Cout,S}=2'b10; 
            100: {Cout,S}=2'b01; 
            101: {Cout,S}=2'b10; 
            110: {Cout,S}=2'b10; 
            111: {Cout,S}=2'b11; 
            default:{Cout,S}=2'bxx; 
        endcase
    end
endmodule