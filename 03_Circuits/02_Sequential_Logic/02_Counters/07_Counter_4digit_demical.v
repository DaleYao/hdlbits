module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign  ena[1]  =   q[3:0]==4'd9;
    assign  ena[2]  =   (q[7:4]==4'd9)  ?   ena[1]:0;
    assign  ena[3]  =   (q[11:8]==4'd9) ?   ena[2]:0;

    always@(posedge clk)
    begin

        if(reset)q<=16'b0;

        else 
        begin

            if(q[3:0]>4'd8)     q[3:0]<=4'd0;
            else                q[3:0]<=q[3:0]+4'd1;

            if(ena[1])
            begin
                if(q[7:4]>4'd8)     q[7:4]<=4'd0;
                else                q[7:4]<=q[7:4]+4'd1;
            end
            //Another mistake...enable tells when to update, including reset it to 4'd0...

            if(ena[2])
            begin
                if(q[11:8]>4'd8)    q[11:8]<=4'd0;
                else                q[11:8]<=q[11:8]+4'd1;
            end

            if(ena[3])
            begin
                if(q[15:12]>4'd8)   q[15:12]<=4'd0;
                else                q[15:12]<=q[15:12]+4'd1;
            end

        end

    end
    
endmodule