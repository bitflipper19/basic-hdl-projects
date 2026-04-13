module datapath(
    output eqz,
    input [15:0] data_in,
    input ldA, ldB, ldP, clrP, decB, clk  
);
    wire [15:0] X, Y, Z, Bout;

    pipo1 A (X, data_in, ldA, clk);
    pipo2 P (Y, Z, ldP, clrP, clk);
    adder A0 (Z, X, Y);

    cntr B (Bout, data_in, ldB, decB, clk);
    comp C0 (eqz, Bout);
endmodule

