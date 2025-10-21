module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,	//a synchronous, active-low reset signal
    input [15:0] d,
    output [15:0] q
);
    
    always	@(posedge	clk)
        begin:	dff16e
            if(!resetn)		q<=	16'b0;
            else 
                begin:assignpart
                    if(byteena[1])	q[15:8]	<=	d[15:8]	;
                    if(byteena[0])	q[7:0]	<=	d[7:0]	;
                    //If enable not on, keep the status, not reset the status.
                end
        end

endmodule
