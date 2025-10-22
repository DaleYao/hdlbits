module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    reg	[31:0]	prev,now;
    always	@(posedge	clk)
        begin
            if(reset)
                begin
                    prev<=32'b0;
                    now<=in;
                end
                    
            else
                begin
                    for(int i=0;i<32;i++)
                        begin
                            if(!(prev[i]&&!now[i]))
                               begin
                                   prev[i]	<=now[i];
                                   now[i]	<=in[i]	;
                               end
                        end
                end
                        
        end
    
    assign	out	=	prev&	~now;
    
endmodule

//Conclude: Executable, but unreadable. As a tifosi, I have to say that's just like this year's ferrari F1 car SF-25, runnable, but undriveable, completely a shitbox.\
//A more reconmended version:

module top_module (
    input clk,
    input reset,//sychronous,positive_sensitive
    input [31:0] in,
    output reg [31:0] out
);

    reg     [31:0]  prev      ;
    wire    [31:0]  set=prev&(~in);

    always @(posedge clk ) 
        begin
            prev <=  in  ;

            if(reset)
                out<=32'b0;
            else
                begin
                    for(int i=0;i<32;i++)
                        if(set[i])  out[i]<=1'b1;
                end
        end
    
endmodule
