module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    localparam  OFF=1'b0, ON=1'b1; 
    reg state, next_state;

    always @(*) begin
        case(state)
            ON:     next_state  =   k?  OFF:ON;
            OFF:    next_state  =   j?  ON:OFF;
            default:next_state  =   state;
        endcase
        // State transition logic
    end

    always @(posedge clk, posedge areset) begin
        if(areset)  state   <=   OFF;
        else        state   <=   next_state;
        // State flip-flops with asynchronous reset
    end

    assign  out=    (state==ON);

    // Output logic
    // assign out = (state == ...);

endmodule
