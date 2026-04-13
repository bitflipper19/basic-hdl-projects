module tb;
    reg [15:0] bus; 
    wire done;
    reg start, clk, rst;

    top DUT(
        .bus(bus),
        .start(start),
        .clk(clk),
        .rst(rst),
        .done(done)
    );

    initial begin
        clk=1'b0;
        rst=1'b1;
        start=1'b0;
    end
    
    initial begin
        #2 rst=1'b0;
        #7 start=1'b1;
        #10 bus=12;
        #10 bus=5;
        #200 $finish;
    end

    always #5 clk=~clk;

    initial begin
        $monitor($time, " A=%d B=%d Output=%d", DUT.path.X, DUT.path.Bout, DUT.path.Y);
        $dumpfile("mx.vcd"); $dumpvars(0, tb);
    end
endmodule