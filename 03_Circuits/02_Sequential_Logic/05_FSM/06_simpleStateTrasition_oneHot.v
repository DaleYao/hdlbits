module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    localparam [1:0]    index_A=2'd0, 
                        index_B=2'd1, 
                        index_C=2'd2,
                        index_D=2'd3;

    // State transition logic: index_Derive an equation for each state flip-flop.
    assign next_state[index_A] = state[index_A]&&!in  ||state[index_C]&&!in;
    assign next_state[index_B] = state[index_A]&&in   ||state[index_B]&&in    ||state[index_D]&&in;
    assign next_state[index_C] = state[index_B]&&!in  ||state[index_D]&&!in;
    assign next_state[index_D] = state[index_C]&&in;

    // Output logic: 
    assign out = state[index_D];

endmodule
