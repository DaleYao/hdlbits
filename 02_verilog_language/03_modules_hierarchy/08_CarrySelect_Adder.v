module 	top_module(
    input 	[31:0]	a,
    input 	[31:0] 	b,
    output 	[31:0] 	sum
);

    wire	vcc	=	1'b1;
    wire 	gnd	=	1'b0;
    wire 	sel;
    wire	[15:0]	sum0;
    wire    [15:0]  sum1;

    //六百六十六，经典错误之[16:0]V.S.[15:0]，百思不得其解结果最后居然是这里错了
    
    add16		add1(	.a(a[15:0]),	.b(b[15:0]),	.cin(gnd),	.sum(sum[15:0]),	.cout(sel)	);
    add16		add2(	.a(a[31:16]),	.b(b[31:16]),	.cin(gnd),	.sum(sum0),			.cout()		);
    add16		add3(	.a(a[31:16]),	.b(b[31:16]),	.cin(vcc),	.sum(sum1),			.cout()		);
    multiplexer	plx	(	.sel(sel),		.data({sum1,sum0}),			.out(sum[31:16]));
    
endmodule


module 	multiplexer(
    input 	sel,
    input 	[31:0]data,
    output	[15:0]out
);
    
    assign	out	=	{16{sel}}	&	data[31:16]	|
        			~{16{sel}}	&	data[15:0];
    
endmodule

//If compile fails, check whether an unpaired { ( [ exists, wether a lackage of \; exists, or wether u'r using a Chinese \， etc. .
//If compile succeeds, but the simulation outcome doesn't match the answer, check: 1.LOGIC; 2.BIT WIDTH; 3.SEQUENCE; 4. I forgot.

