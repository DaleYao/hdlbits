module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire gnd = 1'b0;
    wire c_in;
    
    add16 add1(.a(a[15:0]),.b(b[15:0]),.cin(gnd),.sum(sum[15:0]),.cout(c_in));
    add16 add2(.a(a[31:16]),.b(b[31:16]),.cin(c_in),.sum(sum[31:16]),.cout());
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = a^b^cin;
    assign cout = a&&b||a&&cin||b&&cin;
    
endmodule

//add16 is declared somewhere else(the hdlbits practice environment).