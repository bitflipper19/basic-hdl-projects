module ctr2 (
    output reg [1:0] q,
    input clk,
    input rst
);

    always @(posedge clk) begin
        if(!rst) q<=2'b00;
        else q<=q+1'b1;
    end
endmodule