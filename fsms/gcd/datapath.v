module datapath(
    output gt, lt, eq,
    input [15:0] sys_bus,
    input ldA, ldB, sel1, sel2, sel_in, clk
);

    wire [15:0] bus, X, Y, m1_out, m2_out, S_out;

    pipo A (X, bus, ldA, clk);
    pipo B (Y, bus, ldB, clk);

    comp C0 (gt, lt, eq, X, Y);

    mux m1 (m1_out, sel1, X, Y);
    mux m2 (m2_out, sel2, X, Y);

    sub S0 (S_out, m1_out, m2_out);

    mux m3 (bus, sel_in, S_out, sys_bus);
endmodule