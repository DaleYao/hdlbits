module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    
    assign	heater	=	mode	&&	too_cold	;
    assign	aircon	=	!mode	&&	too_hot		;
    assign	fan		=	fan_on	||	heater	||	aircon	;

endmodule


//The logic of this problem is not perfect. What if hot and cold are both on? And under which circumstance, when mode changes from 0 to 1, both the heater and the aircon could be on.
//Better use wire [1:0]mode as an input? ~|mode to start the aircon, and &mode to start the heater, and in states between the two, both are off.