//Apart from some simple but disastrous mistakes, like wrong spells of virables, and unknowingly using the wrong virables in sentences, the biggest mistake is that 
//I have used 8-bit number to express a decimal number, while the problem uses top 4 bits to express the high decimal bit of the number, and last 4 bits to express the low decimal bit.
//I am stupid, I am stupid.
//And also blind. shame. pity that i have eyes. Should've donate them.

//Miracle. countlessly spell and minor logical mistakes, blind eyes, and only one success within JUST 9 trials, with success rate up to 11%. feels soooo good that i just want to throw this shit out of my domitory.


module top_module(
    input clk,
    input reset,
    input ena,
    output reg  pm,
    output reg  [7:0] hh,
    output reg  [7:0] mm,
    output reg  [7:0] ss); 

    wire[7:0] addss,addmm,addhh;

    BCD_Add_1   Add_mm(
        .d(mm),
        .out(addmm)
    );

    BCD_Add_1   Add_ss(
        .d(ss),
        .out(addss)
    );

    BCD_Add_1   Add_hh(
        .d(hh),
        .out(addhh)
    );


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
                        hh<=addhh;
                    /*begin
                        
                        if(hh[3:0]==4'd9)
                        begin
                            hh[3:0]<=4'b0;
                            hh[7:4]<=hh[7:4]+4'b1;
                        end

                        else    hh[3:0]<=hh[3:0]+4'b1;//So stupid: once wrote "+4'b0 "here.

                    end*/

                    if(hh==8'h11)
                        pm<=!pm;

                end

                else
                    mm<=addmm;
                /*begin
                        
                    if(mm[3:0]==4'd9)
                    begin
                        mm[3:0]<=4'b0;
                        mm[7:4]<=mm[7:4]+4'b1;
                    end

                    else    mm[3:0]<=mm[3:0]+4'b1;//and same here.

                end*/

            end

            else
                ss<=addss;

        end
            
    end

endmodule

module  BCD_Add_1(
    input[7:0]  d,
    output[7:0] out
);

    always@(*)
    begin
        if(d[3:0]==4'h9)
        begin
            out[3:0]=4'h0;
            out[7:4]=d[7:4]+4'h1;//After getting used to sequential logic, i've forgot that there is no such thing like q=q+1.
        end

        else
            out=d+4'h1;//Here we come again, don't forget about the latch issues!
    end

endmodule