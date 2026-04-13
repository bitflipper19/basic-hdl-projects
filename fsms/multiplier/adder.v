module adder(
    output reg [15:0] out,
    input [15:0] a, b
);

    always @(*) out=a+b;
    
endmodule