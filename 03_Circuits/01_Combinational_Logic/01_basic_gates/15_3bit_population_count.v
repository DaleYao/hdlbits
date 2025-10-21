module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    reg	[1:0]	inter	;
    
    always	@(*)	begin
        inter	=	2'b0	;
        for(int	i=0;i<3;i++)	inter	=	inter	+	in[i]	;
    end
    
    assign	out	=	inter	;
    
endmodule
//circulation not needed. inter =   in[0]+in[1]+in[2];.BUt i'd love to. Who tmd cares?
//just useoutput reg out. Though this problem doesn't allow to change input name.
//It's a full adder, why not just assign?
//another version

module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    
    assign	out	=	{|{&in[2:1],&in[1:0],in[2]&&in[1]},^in};
    
endmodule