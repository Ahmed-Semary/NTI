module up_down_counter
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input up, //when asserted the counter is up counter; otherwise, it is a down counter
    output reg [BITS - 1:0] Q
    );

    always @(posedge clk , negedge reset_n) begin
        if (~reset_n)
            Q<='b0;
        else if (up)
            Q<=Q+enable;
        else
            Q<=Q-enable;
    end

endmodule
