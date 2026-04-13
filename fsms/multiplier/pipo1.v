module pipo1(
    output reg [15:0] out,
    input [15:0] in,
    input load, clk
);

    always @(posedge clk) begin
        if(load) out<=in;
    end
    
endmodule