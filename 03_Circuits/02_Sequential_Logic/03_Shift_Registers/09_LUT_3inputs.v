module  top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    wire [7:0]q;

    Reg_Shift_L_8   Register(
        .clk(clk),
        .en(enable),
        .D(S),
        .Q(q)
    );

    MUX_8           Mux(
        .data(q),
        .sel({A,B,C}),
        .out(Z)
    );


endmodule


module  Reg_Shift_L_8(
    input   clk,
    input   en,
    input   D,
    output  reg [7:0]Q
);

    always@(posedge clk)
    begin
        
        if(en)  Q<={Q[6:0], D};
        
    end

endmodule

module MUX_8(
    input   [7:0]   data,
    input   [2:0]   sel,
    output  reg     out
);

    always@(*)begin

        case(sel)
            3'd0:   out=data[0];
            3'd1:   out=data[1];
            3'd2:   out=data[2];
            3'd3:   out=data[3];
            3'd4:   out=data[4];
            3'd5:   out=data[5];
            3'd6:   out=data[6];
            3'd7:   out=data[7];
        endcase

    end
endmodule