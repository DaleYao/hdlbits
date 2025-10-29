//Apart from some simple but disastrous mistakes, like wrong spells of virables, and unknowingly using the wrong virables in sentences, the biggest mistake is that 
//I have used 8-bit number to express a decimal number, while the problem uses top 4 bits to express the high decimal bit of the number, and last 4 bits to express the low decimal bit.
//I am stupid, I am stupid.
//And also blind. shame. pity that i have eyes. Should've donate them.

//Miracle. countlessly spell and minor logical mistakes, blind eyes, and only one success within JUST 9 trials, with success rate up to 11%. feels soooo good.


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
            hh<=8'h12;
            mm<=8'h0;
            ss<=8'h0;
            pm<=1'b0;
        end

        else if(ena)
        begin

            if(ss>8'h58)
            begin
                ss<=8'h0;

                if(mm>8'h58)
                begin

                    mm<=8'h0;
                    
                    if(hh>8'h11)
                        hh<=8'h1;//Once wrote "hm" here, honestly! 
                    else
                    begin
                        
                        if(hh[3:0]==4'd9)
                        begin
                            hh[3:0]<=4'b0;
                            hh[7:4]<=hh[7:4]+4'b1;
                        end

                        else    hh[3:0]<=hh[3:0]+4'b1;//So stupid: once wrote "+4'b0 "here.

                    end

                    if(hh==8'h11)
                        pm<=!pm;

                end

                else
                begin
                        
                    if(mm[3:0]==4'd9)
                    begin
                        mm[3:0]<=4'b0;
                        mm[7:4]<=mm[7:4]+4'b1;
                    end

                    else    mm[3:0]<=mm[3:0]+4'b1;//and same here.

                end

            end

            else
            begin
                
                if(ss[3:0]==4'd9)   
                begin
                    ss[3:0]<=4'b0;
                    ss[7:4]<=ss[7:4]+4'b1;
                end

                else    ss[3:0]<=ss[3:0]+4'b1;//here i was right about 1'b1, but wrote "ss[7:4]"...quite funny huh? correct here, and error there. feels so good.

            end


        end
            
    end

endmodule