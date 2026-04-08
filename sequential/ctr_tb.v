module tb;
    reg clk, rst; wire [1:0] q;

    ctr2 DUT(
        .q(q),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        rst=1'b0;
        clk=1'b0;
    end

    always #5 clk=~clk;

    initial #14 rst=1'b1;

    initial begin
        $dumpfile("ctr.vcd"); $dumpvars(0, tb);
        #100 $finish;
    end
endmodule