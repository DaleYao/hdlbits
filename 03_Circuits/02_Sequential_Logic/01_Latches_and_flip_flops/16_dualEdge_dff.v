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

//�������������ۣ���������ͬ�ش�������ѡ����ʵ��˫���ش���
//�������ʼд�İ汾��ʱ�����ûͨ�������ǲ�̫���Ϊʲô

module top_module (
    input clk,
    input d,
    output reg q
);

    wire cheat=!clk;
    always@(posedge clk or posedge cheat)
        q<=d;
endmodule
