// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 

    always	@(*)	begin
        left	=	1'b0;
        down	=	1'b0;
        right	=	1'b0;
        up		=	1'b0;
        
        case	(scancode)	
            16'he06b	:	left	=	1'b1;
            16'he072	:	down	=	1'b1;
            16'he074	:	right	=	1'b1;
            16'he075	:	up		=	1'b1;
        endcase
        
    end
endmodule

//This is the end of learning and practicing verilog on hdlbits today! I have finally been so close to finishing the first chapter ---- only some uncommonly used features to learn.
//2 core ideas learnt with this module: 1. Verilog is a description language, hardware does not "execute" the lines of code in sequence. 2.Check "always @(*)" blob 2 times to avoid possible latches
//1.I have made this clear. It's just an description, not a function, the "case" block only tells the compiler to build a circuit according to my requirements, not to generate a fucking program that runs my description, which, is obviously not a command to be executed, line by line!
//2.In the blob, You have to declare each and every of the output signals, under each and very combination of input signals. One conbination uncovered, or one output undeclared, one possible latch inferred.
//for example, can I replace the blob below with this?:
always	@(*)	begin
        //left	=	1'b0;
        //down	=	1'b0;
        //right	=	1'b0;
        //up		=	1'b0;
        
        case	(scancode)	
            16'he06b	:	left	=	1'b1;
            16'he072	:	down	=	1'b1;
            16'he074	:	right	=	1'b1;
            16'he075	:	up		=	1'b1;
            default     :   begin
                left	=	1'b0;
                down	=	1'b0;
                right	=	1'b0;
                up		=	1'b0;
            end

        endcase
        
    end
//Not really. "Default" makes sure that all combinations are covered. But in the first 4 cases, the left 3 keys to be set as 1'b0 are not declared--which is the 2nd situation I mentioned.
//And even worse? Skip the "default"? Not covering all conbinations basicly means no escape from a sweet latch?.