module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);

    always	@(posedge clk or posedge ar)
        begin
            if(ar)
            begin
                q<=1'b0;
            end

            else
            begin
                q<=d;
            end

        end
    
endmodule

//Don't know the how the guys came up with this, only understand that it's correct, so just remember it.

//Hold on, I've come up with an idea: outputs of any logical circuit, sequential or combinational, change when inputs change, and only when inputs change, this makes describing level-sensitive with edge-senstive possible: 
//@ posedge clk, it changes: to d if(!reset); @ posedge ar it changes to 0