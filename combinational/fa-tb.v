module fa_tb;
    reg a, b, cin;
    wire cout, sum;
    fa DUT(cout, sum, a, b, cin);

    initial begin
        $dumpfile("fa.vcd");
        $dumpvars(0, fa_tb);
        $monitor($time, " %b + %b + %b = %b%b", a, b, cin, sum, cout);
        #5 a=0; b=0; cin=0; // 0+0+0
        #5 a=1; // 1+0+0
        #5 a=0; b=1; cin=1; // 0+1+1
        #5 a=1; // 1+1+1
        #5 $finish;
    end
endmodule