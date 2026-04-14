module tb;
    wire done;
    reg [15:0] sys_bus;
    reg start, clk, rst;

    top DUT(
        .done(done),
        .sys_bus(sys_bus),
        .start(start),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk=1'b0;
        rst=1'b1;
        start=1'b0;
    end

    initial begin
        #2 rst=1'b0;
        #2 rst=0;
        sys_bus = 29;
        #10 start=1;
        #20 sys_bus = 87;
        #200 $finish;
    end

     always #5 clk=~clk;

    initial begin
        $monitor($time, " A=%d B=%d Output=%d", DUT.path.X, DUT.path.Y, DUT.path.Y);
        $dumpfile("gcd.vcd"); $dumpvars(0, tb);
    end
endmodule