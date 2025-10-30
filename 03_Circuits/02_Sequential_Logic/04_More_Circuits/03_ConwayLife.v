//mark
module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    genvar  i,j;
    generate
        for(i=0;i<16;i++)begin:gen_cal_next_row
        for(j=0;j<16;j++)begin:gen_cal_next_column

        if(i==0)begin:bottom
            ff  ff(
                .clk(clk),
                .load(load),
                .data(data[16*i+j]),
                .q(q[16*i+j]),
                .neighbor({ q[16+j],                                        //up
                            q[240+j],                                       //down

                            q[(j==0)?   15  :   (j-1)       ],              //left
                            q[(j==0)?   31  :   (15+j)      ],              //up_left
                            q[(j==0)?   255 :   (239+j)     ],              //down_left
                            
                            q[(j==15)?  0   :   (j+1)       ],              //right
                            q[(j==15)?  16  :   (j+17)      ],              //up_right
                            q[(j==15)?  240 :   (j+241)     ]               //down_right
                            })
            );
        end

        else if(i==15)begin:top
            ff  ff(
                .clk(clk),
                .load(load),
                .data(data[16*i+j]),
                .q(q[16*i+j]),
                .neighbor({ q[j],                                           //up
                            q[224+j],                                       //down

                            q[(j==0)?   255 :   (239+j)     ],              //left
                            q[(j==0)?   15  :   (j-1)       ],              //up_left
                            q[(j==0)?   239 :   (223+j)     ],              //down_left
                            
                            q[(j==15)?  240 :   (241+j)     ],              //right
                            q[(j==15)?  0   :   (j+1)       ],              //up_right
                            q[(j==15)?  224 :   (225+j)     ]               //down_right
                            })
            );
        end

        else    begin:middle
            ff  ff(
                .clk(clk),
                .load(load),
                .data(data[16*i+j]),
                .q(q[16*i+j]),
                .neighbor({ q[16*(i+1)+j],                                              //up
                            q[16*(i-1)+j],                                              //down

                            q[(j==0)?   (16*i+15)       :   (16*i+j-1)      ],          //left
                            q[(j==0)?   (16*(i+1)+15)   :   (16*(i+1)+j-1)  ],          //up_left
                            q[(j==0)?   (16*(i-1)+15)   :   (16*(i-1)+j-1)  ],          //down_left

                            q[(j==15)?  (16*i)          :   (16*i+j+1)      ],          //right
                            q[(j==15)?  (16*(i+1))      :   (16*(i+1)+j+1)  ],          //up_right
                            q[(j==15)?  (16*(i-1))      :   (16*(i-1)+j+1)  ]           //down_right
                            })
            );
        end
            
        end
        end
    endgenerate

endmodule

module  ff(
    input   [7:0]neighbor,
    input   clk,
    input   load,
    input   data,
    output  reg q
);
    wire    [3:0]num=   neighbor[7]+    neighbor[6]+    neighbor[5]+    neighbor[4]+    
                        neighbor[3]+    neighbor[2]+    neighbor[1]+    neighbor[0];

    always@(posedge clk)begin
        if(load)    q<=data;
        else if(num==4'd3)   q<=1'b1;
        else if(num!=4'd2)   q<=1'b0;
        //num==4'd2 keep q.
    end
endmodule