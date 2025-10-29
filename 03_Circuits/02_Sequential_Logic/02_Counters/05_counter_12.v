module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    //assign  c_load  =   &Q[3:2] ||  reset;
    //Wrong answer above. the load is used to increment number, not to load number, so it should consider enable signal.
    assign  c_load  =   (enable &&  &Q[3:2])    ||reset;


    assign  c_d     =   c_load? 4'b1:Q;
    assign  c_enable=   enable;

    count4 the_counter (
        .clk(clk), 
        .enable(c_enable), 
        .load(c_load), 
        .d(c_d),
        .Q(Q)
    );

endmodule



module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);

//declared elsewhere

endmodule