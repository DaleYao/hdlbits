module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    min_unit    dff_0(
        .data({SW[0],LEDR[2]}),
        .sel(KEY[1]),
        .clk(KEY[0]),
        .out(LEDR[0])
    );

    min_unit    dff_1(
        .data({SW[1],LEDR[0]}),
        .sel(KEY[1]),
        .clk(KEY[0]),
        .out(LEDR[1])
    );

    min_unit    dff_2(
        .data({SW[2],^LEDR[2:1]}),
        .sel(KEY[1]),
        .clk(KEY[0]),
        .out(LEDR[2])
    );

endmodule

module min_unit(
    input   [1:0]data,
    input   sel,
    input   clk,
    output  reg out
);

    always@(posedge clk)
    begin
        
        case(sel)
            1'b1:   out<=data[1];
            1'b0:   out<=data[0];//Used to q, but this output is "out":-(
        endcase

    end

endmodule