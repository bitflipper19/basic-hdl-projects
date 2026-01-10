module OneBitMemory (
    output q,
    input d,
    input we
);
    wire w1, w2, w3, nd;
    not (nd, d);
    nand (w1, d, we), (w2, nd, we), (q, w1, w3), (w3, w2, q);
endmodule