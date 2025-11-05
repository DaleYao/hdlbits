module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    localparam A=   4'b0001;
    localparam B=   4'b0010;
    localparam C=   4'b0100;
    localparam D=   4'b1000;

    reg [3:0] state,next_state;

    always@(*)begin
        case(state)
            A:  next_state=!in?  A:B;
            B:  next_state=!in?  C:B;
            C:  next_state=!in?  A:D;
            D:  next_state=!in?  C:B;
            default:    next_state=A;
        endcase
    end
    // State transition logic
    always@(posedge clk or posedge  areset)begin
        if(areset)      state<=A;
        else            state<=next_state;
    end
    // State flip-flops with asynchronous reset

    assign  out=    (state==D);
    // Output logic

endmodule
