module controller(
    output reg ldA, ldB, sel1, sel2, sel_in, done,
    input gt, lt, eq, start, clk, rst
);
    reg [2:0] state; 
    localparam S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011,
               S4=3'b100, S5=3'b101, S6=3'b110;

    always @(posedge clk) begin
        if(rst) state<=S0;
        else case(state)
                S0: if(start) state<=S1;
                S1: state<=S2;
                S2: state<=S3;
                S3: begin
                    if(gt) state<=S4;
                    else if(lt) state<=S5;
                    else if(eq) state<=S6;
                end
                S4: state<=S3;
                S5: state<=S3;
                S6: state<=S6;
                default: state<=S0;
        endcase
    end

    always @(*) begin
        ldA=1'b0; ldB=1'b0; sel1=1'b0; sel2=1'b0; sel_in=1'b0; done=1'b0;
        if(!rst) case(state)
            S1: ldA=1'b1;
            S2: ldB=1'b1;
            S4: begin ldA=1'b1; sel1=1'b1; sel2=1'b0; sel_in=1'b1; end
            S5: begin ldB=1'b1; sel1=1'b0; sel2=1'b1; sel_in=1'b1; end
            S6: done=1'b1;
        endcase
    end
    
endmodule