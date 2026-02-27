// trivial parallel input serial output implemented using 
// shift registers (right), outputs LSB first 

module piso(
    output tx,
    input clk,
    input [3:0] D,
    input shift
);

    reg [3:0] Q;

    always @(posedge clk) begin
        if(shift) Q<={1'b0, Q[3:1]};
        else Q<=D;
    end

    assign tx=Q[0];

endmodule