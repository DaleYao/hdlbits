module	fadd(
    input	a,b,cin,
    output	cout,sum
);
    assign	cout	=	a&&b	||	a&&cin	||	b&&cin;
    assign	sum		=	a	^	b	^   cin	;
    
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar	i;
    generate	
        for(i=0	;i<100;i++)	begin	:	fadd_chain//Just a block name, for convinience when compiling and simulating. Irrelevant with the logic inside or outside the block.
            if(i==0)	begin		:	fadd0
                fadd	fa(.a(a[0]),	.b(b[0]),	.cin(cin)	,.cout(cout[0]),.sum(sum[0]));
            end
            else		begin		:	faddi
                fadd	fa(.a(a[i]),	.b(b[i]),	.cin(cout[i-1])	,.cout(cout[i]),.sum(sum[i]));
            end
        end
    endgenerate
        

endmodule


//A better version:

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar	i;
    generate	
        for(i=0	;i<100;i++)	begin	:	fadd_chain
            fadd	fa(
                .a      (a[i])                  ,
                .b      (b[i])                  ,	
                .cin    (i==0?cin:cout[i-1])	,//Use conditional ternary operator.
                .cout   (cout[i])               ,
                .sum    (sum[i])
                );
        end
    endgenerate
        

endmodule

