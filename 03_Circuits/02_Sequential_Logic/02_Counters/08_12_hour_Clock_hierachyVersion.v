module top_module(
    input   clk,
    input   reset,
    input   ena,
    output  pm,
    output  [7:0] hh,
    output  [7:0] mm,
    output  [7:0] ss
); 

    wire    carry_ss,carry_mm;

    count_sm    ss_count(
        .clk(clk),
        .reset(reset),
        .en(ena),
        .carry(carry_ss),
        .sm(ss)
    );

    count_sm    mm_count(
        .clk(clk),
        .reset(reset),
        .en(carry_ss),
        .carry(carry_mm),
        .sm(mm)
    );

    count_hh    hh_count(
        .clk(clk),
        .reset(reset),
        .en(carry_mm),
        .hh(hh),
        .pm(pm)
    );

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
            out=d+8'h1;//Here we come again, don't forget about the latch issues!
    end

endmodule

module count_sm(
    input   clk,
    input   reset,
    input   en,
    output  carry,
    output  reg[7:0]sm
);

    wire    [7:0]temp;

    BCD_Add_1   add(
        .d(sm),
        .out(temp)
    );

    always@(posedge clk)
    begin
        if(reset)   sm<=8'h0;

        else if(en)
        begin
            
            if(sm>8'h58)    sm<=8'h0;
            else            sm<=temp;

        end

    end

    assign  carry   =   en  &&  (sm>8'h58);

endmodule




module count_hh(
    input   clk,
    input   reset,
    input   en,
    output  reg [7:0]hh,
    output  reg pm
);

    wire    [7:0]temp;

    BCD_Add_1   add(
        .d(hh),
        .out(temp)
    );

    always@(posedge clk)
    begin

        if(reset)   
        begin
            hh<=8'h12;
            pm<=1'b0;
        end

        else if(en)
        begin

            if(hh==8'h11)
                pm<=!pm;

            if(hh>8'h11)
                hh<=8'h1;
            else
                hh<=temp;

        end

    end

endmodule