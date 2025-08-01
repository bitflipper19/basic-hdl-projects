j// Behavioral description of full subtractor

module fs(d, Bo, a, b, Bin);
    input a, b, Bin;
    output d, Bo;
    assign d = a ^ b ^ Bin;
    assign Bo = Bin & (~(a^b))+(~a)&b;
endmodule