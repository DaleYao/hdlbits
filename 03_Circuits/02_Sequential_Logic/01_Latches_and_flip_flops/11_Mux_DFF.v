module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always	@(posedge clk)
        Q<=L&&r_in||!L&&q_in;

endmodule

//A better version:

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always	@(posedge clk)
    begin
        if(L)   Q<=r_in;
        else    Q<=q_in;
    end

endmodule
