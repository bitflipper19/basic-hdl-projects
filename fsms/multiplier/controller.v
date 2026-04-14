module controller(
    output reg ldA, ldB, ldP, clrP, decB, done,
    input start, clk, rst, eqz
);
    reg [2:0] state;
    localparam S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;

    always @(posedge clk) begin
        if(rst) state <= S0;
        else case(state)
            S0: if(start) state <= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: if(eqz) state <= S4;
                else     state <= S3;
            S4: state <= S4;
            default: state <= S0;
        endcase
    end

    always @(*) begin
        ldA=1'b0; ldB=1'b0; ldP=1'b0; clrP=1'b0; decB=1'b0; done=1'b0;
        if(!rst) case(state)
            S1: ldA=1'b1;
            S2: begin ldB=1'b1; clrP=1'b1; end
            S3: begin ldP=1'b1; decB=1'b1; end
            S4: done = 1'b1;
        endcase
    end
endmodule