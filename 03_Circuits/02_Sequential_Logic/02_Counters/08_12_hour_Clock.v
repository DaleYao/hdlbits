//Apart from some simple but disastrous mistakes, like wrong spells of virables, and unknowingly using the wrong virables in sentences, the biggest mistake is that 
//I have used 8-bit number to express a decimal number, while the problem uses top 4 bits to express the high decimal bit of the number, and last 4 bits to express the low decimal bit.
//I am stupid, I am stupid.
//And also blind. shame. pity that i have eyes.

module top_module(
    input clk,
    input reset,
    input ena,
    output reg  pm,
    output reg  [7:0] hh,
    output reg  [7:0] mm,
    output reg  [7:0] ss); 

    always@(posedge clk)
    begin
        
        if(reset)
        begin
            hh<=8'd12;
            mm<=8'd0;
            ss<=8'd0;
            pm<=1'b0;
        end

        else if(ena)
        begin

            if(ss>8'd58)
            begin
                ss<=8'd0;

                if(mm>8'd58)
                begin

                    mm<=8'd0;
                    
                    if(hh>8'd11)
                        hh<=8'd1;
                    else
                        hh<=hh+8'd1;

                    if(hh==8'd11)
                        pm<=!pm;

                end

                else
                    mm<=mm+8'd1;
            end

            else
                ss<=ss+8'd1;

        end
            
    end

endmodule