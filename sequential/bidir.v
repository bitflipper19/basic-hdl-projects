module pipo_bi(
    inout [15:0] bus,
    output reg [15:0] out, 
    input load, clk, write_back
);

    always @(posedge clk) begin
        if(load) out<=bus;
    end
    
    assign bus=write_back? out: 16'bz;
endmodule