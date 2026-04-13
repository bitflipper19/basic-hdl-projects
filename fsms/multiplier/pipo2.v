module pipo2(
    output reg [15:0] out,
    input [15:0] in,
    input load, clr, clk 
);

    always @(posedge clk) begin
        if(clr) out<=16'b0;
        else if(load) out<=in;
    end
    
endmodule