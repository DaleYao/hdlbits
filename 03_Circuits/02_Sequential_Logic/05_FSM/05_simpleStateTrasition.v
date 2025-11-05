module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    localparam [1:0] A=2'd0, B=2'd1, C=2'd2, D=2'd3;

    always@(*)begin// State transition logic: next_state = f(state, in)
        case(state)
            A:  next_state= in? B:A;
            B:  next_state= in? B:C;
            C:  next_state= in? D:A;
            D:  next_state= in? B:C;
            default:next_state=A;
        endcase
    end

    assign  out=    (state==D);// Output logic:  out = f(state) for a Moore state machine

endmodule

//Why lack sequential part: the requirement of problem
//Implement only the state transition logic and output logic (the combinational logic portion) for this state machine.