module tb;
    wire [15:0] bus;
    reg [15:0] bus_drv;
    reg bus_en;

    reg load, clk, write_back;
    wire [15:0] out;

    assign bus = (bus_en) ? bus_drv : 16'bz;

    pipo_bi DUT(
        .bus(bus),
        .out(out),
        .load(load),
        .clk(clk),
        .write_back(write_back)
    );

    initial begin
        bus_drv = 16'h000c;
        bus_en = 1;
        load = 0;
        clk = 0;
        write_back = 0;
    end

    initial begin
        #2 load = 1;
        #10 write_back = 1;
        #10 load = 0;

        #0 bus_drv = 16'h001c;
        #10 load = 1;

        #10 write_back = 1;
        #30 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("bi.vcd");
        $dumpvars(0, tb);
    end
endmodule