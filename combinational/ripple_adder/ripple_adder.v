// 4 bit ripple carry adder [Structural Gate level implementation using full adders]

module full_adder( // Gate level implementation of full adder
    output cout, 
    output sum,
    input a,
    input b,
    input Cin
);
    wire w1, w2, w3, w4;
    xor (w1, a, b), (sum, w1, Cin);
    and (w2, a, b), (w3, b, Cin), (w4, Cin, a);
    or (cout, w2, w3, w4);
endmodule

module ripple_adder (
    output carry,
    output [3:0] result,
    input [3:0] a,
    input [3:0] b,
    input Cin
);
    wire [3:0] w;
    full_adder f0(w[0], result[0], a[0], b[0], Cin);
    full_adder f1(w[1], result[1], a[1], b[1], w[0]);
    full_adder f2(w[2], result[2], a[2], b[2], w[1]);
    full_adder f3(w[3], result[3], a[3], b[3], w[2]);
    assign carry = w[3];
endmodule
    