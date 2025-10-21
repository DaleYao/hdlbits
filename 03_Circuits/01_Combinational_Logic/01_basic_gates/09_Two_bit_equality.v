module top_module ( 
    input [1:0] A, 
    input [1:0] B, 
    output z 
); 
    
    assign	z	=	&(	~(A^B)	)	;

endmodule

//A simple module to test wether A==b;
//Another possible answer:

module top_module ( 
    input [1:0] A, 
    input [1:0] B, 
    output z 
); 
    
    assign	z	=   !   (   |     (A^B)		);

endmodule

//Recommended version:
module top_module ( 
    input [1:0] A, 
    input [1:0] B, 
    output z 
); 
    
    assign	z	=	A==B	;

endmodule

