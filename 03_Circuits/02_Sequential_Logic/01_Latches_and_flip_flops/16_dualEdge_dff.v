module top_module (
    input clk,
    input d,
    output q
);

    reg	qpos,qneg;
    always @(posedge	clk)
        qpos<=d;
    
    always	@(negedge	clk)
        qneg<=d;
    
    assign	q=clk?qpos:qneg;
endmodule

//上面这个简洁美观，用两个不同沿触发器和选择器实现双边沿触发
//下面是最开始写的版本，时序仿真没通过，但是不太清楚为什么

module top_module (
    input clk,
    input d,
    output reg q
);

    wire cheat=!clk;
    always@(posedge clk or posedge cheat)
        q<=d;
endmodule
