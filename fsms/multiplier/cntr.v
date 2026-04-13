module cntr(
    output reg [15:0] out,
    input [15:0] in,
    input load, dec, clk
);

    always @(posedge clk) begin
        if(load) out<=in-1'b1;
        else if(dec) out<=out-1;
    end
    
endmodule