module multiplexer(//多路选择器，一个自认为很不错的写法
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


module top_module ( //延时
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

module my_dff8(input clk, input [7:0] d, output reg [7:0] q);
    always @(posedge clk)
        q <= d;
endmodule


`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg [7:0] d;
    reg [1:0] sel;
    wire [7:0] q;

    // 实例化待测模块
    top_module uut (
        .clk(clk),
        .d(d),
        .sel(sel),
        .q(q)
    );

    // 时钟：10ns周期（100MHz）
    initial clk = 0;
    always #5 clk = ~clk;

    // 激励
    initial begin
        // 初始值
        d = 8'h00;
        sel = 2'b00;

        // 模拟输入序列
        repeat(2) @(posedge clk);   d = 8'hA1;
        repeat(1) @(posedge clk);   d = 8'hB2;
        repeat(1) @(posedge clk);   d = 8'hC3;
        repeat(1) @(posedge clk);   d = 8'hD4;
        repeat(1) @(posedge clk);   d = 8'hE5;

        // 测不同延迟的输出
        repeat(1) @(posedge clk); sel = 2'b00;  // 输出 d（无延迟）
        repeat(4) @(posedge clk); sel = 2'b01;  // 输出 q1（延迟1拍）
        repeat(4) @(posedge clk); sel = 2'b10;  // 输出 q2（延迟2拍）
        repeat(4) @(posedge clk); sel = 2'b11;  // 输出 q3（延迟3拍）

        repeat(5) @(posedge clk);
        $finish;
    end

endmodule
