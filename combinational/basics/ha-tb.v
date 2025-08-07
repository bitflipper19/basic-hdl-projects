// Testbench for all abstractions/implementations of half-adder

module ha_tb;
    wire cout, sum;
    reg a, b;
    ha DUT(cout, sum, a, b);
    initial begin
        $dumpfile("ha.vcd");
        $dumpvars(0, ha_tb);
        $monitor($time, " %b + %b = %b%b", a, b, cout, sum);
        #5 a=0; b=0;
        #5 a=1;
        #5 a=0; b=1;
        #5 a=1;
        #5 $finish;
    end
endmodule