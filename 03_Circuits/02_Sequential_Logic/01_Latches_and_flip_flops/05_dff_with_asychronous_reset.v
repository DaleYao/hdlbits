module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    always	@(posedge	clk	or	posedge	areset)
        begin:	dff8_ar
            if(areset)	q<=8'b0;
            else		q<=d;
        end
    
endmodule
