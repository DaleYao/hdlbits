module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    
    assign	out_both		=	in[3:1]&in[2:0];
    assign	out_any			=	in[3:1]|in[2:0];
    assign	out_different	=	{in[0],in[3:1]}^in;

endmodule
//A simple but interesting problem.

//The next problem is an another version of this, but with a vector that's way larger.

module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    assign	out_both		=	in[99:1]&in[98:0]	;
    assign	out_any			=	in[99:1]|in[98:0]	;
    assign	out_different	=	{in[0],in[99:1]}^in	;

endmodule


//And that's the end of Circuits_CombinationalLogic_BasicGates! Congratulations to myself!