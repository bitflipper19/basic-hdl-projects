// TASK: add a way to use the same bus as both input and output
// Task 1: add a way to have a universal bi-directional bus for input and output
// Task 2: Timing Constraints and it's analysis
// Task 3: Better design styles
// Task 4: Make this for 2's complement numbers, handle overflow, proper substraction

module top(
    output done,
    input [15:0] bus,
    input start, clk, rst
);
    wire ldA, ldB, ldP, clrP, decB, eqz;

    controller fsm(
        .ldA(ldA),
        .ldB(ldB),
        .ldP(ldP),
        .clrP(clrP),
        .decB(decB),
        .done(done),
        .start(start),
        .clk(clk),
        .rst(rst), 
        .eqz(eqz)
    );

    datapath path(
        .eqz(eqz),
        .data_in(bus),
        .ldA(ldA),
        .ldB(ldB),
        .ldP(ldP),
        .clrP(clrP),
        .decB(decB),
        .clk(clk)
    );


endmodule