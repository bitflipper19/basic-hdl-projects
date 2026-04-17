// Task 1: add a way to have a universal bi-directional bus for input and output
// Task 2: Timing Constraints and it's analysis
// Task 3: Better design styles
// Task 4: Make this for 2's complement numbers, handle overflow, proper substraction 
// How is this stopping ?
module top(
    output done,
    input [15:0] sys_bus,
    input start, clk, rst
);

    wire ldA, ldB, sel1, sel2, sel_in, gt, lt, eq;

    datapath path(
        .gt(gt),
        .lt(lt),
        .eq(eq),
        .sys_bus(sys_bus),
        .ldA(ldA),
        .ldB(ldB),
        .sel1(sel1),
        .sel2(sel2),
        .sel_in(sel_in),
        .clk(clk)
    );

    controller fsm(
        .ldA(ldA),
        .ldB(ldB),
        .sel1(sel1),
        .sel2(sel2),
        .sel_in(sel_in),
        .done(done),
        .gt(gt),
        .lt(lt),
        .eq(eq),
        .start(start),
        .clk(clk),
        .rst(rst)
    );
    
endmodule