module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire    c_in;
    wire    [31:0]  b_inv;

    assign  b_inv   =   {32{sub}}   ^   b;

    add16   add1(   .a(a[15:0]),    .b(b_inv[15:0]),    .cin(sub),   .sum(sum[15:0]),   .cout(c_in) );
    add16   add2(   .a(a[31:16]),   .b(b_inv[31:16]),   .cin(c_in),  .sum(sum[31:16]),  .cout()     );
    

endmodule

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

endmodule