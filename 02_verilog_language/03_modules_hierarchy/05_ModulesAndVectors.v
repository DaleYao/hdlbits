module multiplexer(//��·ѡ������һ������Ϊ�ܲ����д��
    input [1:0] sel,
    input [31:0] data,
    output [7:0]out
);
    assign out =
		(	{8{(&sel)}}				&	data[31:24]	)	|
        (	{8{(sel[1]&!sel[0])}}	&	data[23:16]	)	|
        (	{8{(!sel[1]&sel[0])}}	&	data[15:8]	)	|    
        (	{8{&(~sel)}}			&	data[7:0]	);

endmodule


module top_module ( //��ʱ
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] q1,q2,q3;
    
    my_dff8 dff01(.clk(clk),.d(d),.q(q1));
    my_dff8 dff02(.clk(clk),.d(q1),.q(q2));
    my_dff8 dff03(.clk(clk),.d(q2),.q(q3));
          
    multiplexer plx(.sel(sel),.data({q3,q2,q1,d}),.out(q));
endmodule
