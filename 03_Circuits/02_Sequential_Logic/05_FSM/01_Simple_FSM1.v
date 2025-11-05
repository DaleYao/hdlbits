module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block

        if      (state==A)begin
            case(in)
                1'b0:   next_state= B;
                1'b1:   next_state= A;
            endcase
        end

        else if (state==B)begin
            case(in)
                1'b0:   next_state= A;
                1'b1:   next_state= B;
            endcase
        end

        // State transition logic
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block

        if(areset)  state<= B;
        else        state<= next_state;
        // State flip-flops with asynchronous reset
    end

    assign  out=    (state==B)?1'b1:1'b0;
    // Output logic
    // assign out = (state == ...);

endmodule
