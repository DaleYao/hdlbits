module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire c_in,gnd;
    assign gnd=1'b0;
    add16 add1(.a(a[15:0]),.b(b[15:0]),.cin(gnd),.sum(sum[15:0]),.cout(c_in));
    add16 add2(.a(a[31:16]),.b(b[31:16]),.cin(c_in),.sum(sum[31:16]),.cout());
endmodule
