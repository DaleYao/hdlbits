//2 types of LFSR: Galois / Fibonacci.
//Fibonacci :   tapped bits xored together as the next state of MSB.
//Galois    :   the left bit of the tapped bit and the LSB xored together as the next state of the tapped bit.

//Galois LSFR has better timing, as Fibonacci category has so many xor gates placed together, generating disastrously tons of combinational and gate latency.

//This is a Galois LSFR.
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

    always@(posedge clk)
    begin
        
        if(reset)           q<=32'h00000001;
        else                
        q<={q[0],
            q[31:23],
            q[22]^q[0],
            q[21:3],
            q[2]^q[0],
            q[1]^q[0]
        };        

    end

endmodule