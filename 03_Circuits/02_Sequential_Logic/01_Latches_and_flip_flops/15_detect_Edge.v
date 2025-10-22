//State Transfer:
/*
|Current|Next||output|
|---|---|---|---|
||x=0|x=1||
|s0: 00|s2: 11|s1: 01|1|
|s1: 01|s2: 11|s1: 01|0|
|s2: 11|s2: 11|s0: 00|0|
|s3: 10|s2: 11|s0: 00|0|
*/

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg	[7:0]q1,q0;
    always	@(posedge	clk)
        begin
            q1<=~in;
            q2<=~(in&q1);
        end

    assign  pedge   =   ~q1 &   ~q2;

endmodule

//Another Version:

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg	[7:0]prev,now;
    always @(posedge clk ) begin
        prev<=  now;
        now<=   in;
    end

    assign  pedge   =   now &   ~prev;     

endmodule