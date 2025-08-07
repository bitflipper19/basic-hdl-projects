// Behavioral description of half subtractor

module hs(d, Bo, a, b);
    input a, b;
    output d, Bo;
    assign d = a^b;
    assign Bo = (~a)&b;
endmodule