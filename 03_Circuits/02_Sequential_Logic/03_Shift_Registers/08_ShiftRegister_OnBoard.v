module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    genvar i;
    generate
        for(i=0;i<4;i++)begin: gen_dff//Always name the generate_for loop to declare the name space of instances;
        //for example, this will generate four instances:   gen_dff[0].dff
                                                        //  gen_dff[1].dff
                                                        //  gen_dff[2].dff
                                                        //  gen_dff[3].dff
        //So that there won't be four module instances with the same name.
        // 4-bit shift register with parallel load and enable control.
            MUXDFF  dff(
                .clk(KEY[0]), 
                .sel_E(KEY[1]), 
                .sel_L(KEY[2]), 
                .w((i==3)?KEY[3]:LEDR[i+1]), 
                .r(SW[i]), 
                .Q(LEDR[i])
            );
        end
    endgenerate
    
endmodule

module MUXDFF (
    input   clk,
    input   sel_E,
    input   sel_L,
    input   w,
    input   r,
    output  reg Q
    );

    always@(posedge clk)
    begin

       if(sel_L)        Q<=r;
       else if(sel_E)   Q<=w;

    end

endmodule
