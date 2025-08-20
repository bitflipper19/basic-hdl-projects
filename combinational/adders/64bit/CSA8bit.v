`include "../ic-7483/ic-7483.v"

module bitCSA8(
    output [7:0] sum,
    output cout,
    input [7:0] a, b,
    input cin
);
    wire cout0, coutH0, coutH1; wire [3:0] b0, b1;
    ic_7483 aL0(sum[3:0], cout0, a[3:0], b[3:0], cin),
            aH0(b0, coutH0, a[7:4], b[7:4], 1'b0),
            aH1(b1, coutH1, a[7:4], b[7:4], 1'b1);

    assign sum[7:4] = (cout0 == 0) ? b0: b1; 
    assign cout = (cout0 == 0) ? coutH0: coutH1;
endmodule

module tb_CSA8bit;
    reg  [7:0] a, b;
    reg  cin;
    wire [7:0] sum;
    wire cout;

    // DUT
    bitCSA8 dut(sum, cout, a, b, cin);

    initial begin
        $dumpfile("CSA8bit_tb.vcd");
        $dumpvars(0, tb_CSA8bit);
        $monitor("t=%0t | a=%08b b=%08b cin=%b => sum=%08b cout=%b", 
                  $time, a, b, cin, sum, cout);

        // Some test values
        a = 8'd15;  b = 8'd20;  cin = 0; #10;
        a = 8'd100; b = 8'd55;  cin = 0; #10;
        a = 8'd200; b = 8'd100; cin = 1; #10;
        a = 8'd255; b = 8'd1;   cin = 0; #10;

        $finish;
    end
endmodule