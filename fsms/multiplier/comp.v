module comp(
    output eqz,
    input [15:0] in
);

    assign eqz=~(|in);
    
endmodule