module full_adder(
    output cout, sum, 
    input a, b, cin
);
    wire [3:0] w;
    xor x0(w[0], a, b), x1(sum, cin, w[0]);

    and a0(w[1], a, b), a1(w[2], b, cin), a2(w[3], cin, a);
    or o0(cout, w[1], w[2], w[3]);
endmodule

module mux2to1(
    input i0, i1, sel,
    output o0
);
    // assign o0 = (~sel)&i0 + (sel)&i1;
    assign o0 = sel ? i1 : i0;
endmodule


module carrysel2bit(
    output [1:0] sum,
    output cout,
    input [1:0] a, b,
    input cin
);
    wire [4:0] w;
    full_adder fa0(w[0], sum[0], a[0], b[0], cin), 
    fa10(w[1], w[2], a[1], b[1], 0), 
    fa11(w[3], w[4], a[1], b[1], 1);
    mux2to1 m1(w[1], w[3], w[0], cout), m2(w[2], w[4], w[0], sum[1]);
endmodule