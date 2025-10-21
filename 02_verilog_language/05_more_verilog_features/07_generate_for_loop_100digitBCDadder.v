module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    genvar	i;
    wire	[99:0]	carry_inter;

    generate
        for(i=0;i<100;i++)	begin:	bcd_fadd_chain
            bcd_fadd	add(
                .a      (a[4*i+3:4*i]),
                .b      (b[4*i+3:4*i]),
                .cin    (i==0?  cin :   carry_inter[i-1]),
                .cout   (carry_inter[i]),
                .sum    (sum[4*i+3:4*i])//Notice! The Term of i is 4, not 1! 
            );
        end
    endgenerate

    assign cout   =   carry_inter[99];//Do not foget any ports! It's assign, not wire!
               
endmodule

//Just a declaration. Defined somewhere else.
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );

endmodule