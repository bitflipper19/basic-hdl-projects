module piso_tb;
    reg clk, shift;
    reg [3:0] D; 
    wire tx;

    piso dut(
        .tx(tx),
        .clk(clk),
        .D(D),
        .shift(shift)
    );

    initial begin
        clk=1'b0;
        shift=1'b0;
        D=4'hb;
    end

    always #5 clk=~clk;

    initial #12 shift=1'b1;

    initial begin
        $dumpfile("piso.vcd"); $dumpvars(0, piso_tb);
        #55 $finish;
    end

endmodule