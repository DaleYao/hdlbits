module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign	out	=	in[sel];

endmodule

//A case statement is no loger useful.