module  top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    wire[511:0] temp;

    genvar i;    
    generate
        for(i=0;i<512;i++)begin:gen_cal_next
            Rule_110    cal(
                .left((i==511)?1'b0:q[i+1]),
                .center(q[i]),
                .right((i==0)?1'b0:q[i-1]),
                .out(temp[i])
            );
        end
    endgenerate

    always@(posedge clk)begin
        if(load)    q<=data;
        else        q<=temp;
    end

endmodule

module  Rule_110(
    input   left,center,right,
    output  reg out
);

    always@(*)  begin
        case({left,center,right})
            3'b111:     out=1'b0;
            3'b100:     out=1'b0;
            3'b000:     out=1'b0;
            default:    out=1'b1;
        endcase
    end

endmodule