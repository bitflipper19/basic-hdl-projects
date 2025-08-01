// Structural gate level description of half subtractor

module hs(d, Bo, a, b);
    input a, b;
    output d, Bo;
    xor x1 (d, a, b);
    and a1 (Bo, ~a, b);
endmodule