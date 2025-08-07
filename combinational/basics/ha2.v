// Structural gate level description of half adder

module ha(cout, sum, a, b);
    input a, b;
    output cout, sum;
    and a1(cout, a, b);
    xor x1(sum, a, b);
endmodule