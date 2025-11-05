module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    localparam  [0:0]   ON= 1'b1,OFF=1'b0;
    reg state, next_state;

    always @(*) begin
        case(state)
            ON: next_state= k?  OFF:ON;
            OFF:next_state= j?  ON:OFF;
            default:    next_state=OFF;//我其实不太清楚这一段有没有用
        endcase
        // State transition logic
    end

    always @(posedge clk) begin
        if(reset)       state<= OFF;
        else            state<= next_state;
        // State flip-flops with synchronous reset
    end

    assign  out=    (state==ON);
    // Output logic
    // assign out = (state == ...);

endmodule
