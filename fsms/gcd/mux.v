module mux(
    output [15:0] out,
    input sel,
    input [15:0] A, B
);

    assign out=sel? A: B;
    
endmodule