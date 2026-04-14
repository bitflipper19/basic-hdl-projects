module comp(
    output gt, lt, eq,
    input [15:0] A, B
);

    assign gt = A>B;
    assign lt = A<B;
    assign eq = A==B;
    
endmodule