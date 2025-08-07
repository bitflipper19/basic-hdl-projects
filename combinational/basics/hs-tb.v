module hs_tb;
    reg a, b;
    wire d, Bo;
    hs DUT(d, Bo, a, b);

    initial begin
        $dumpfile("hs.vcd");
        $dumpvars(0, hs_tb);
        $monitor($time, " a=%b, b=%b, diff.=%b, Borrow=%b", a, b, d, Bo);
        #5 a=0; b=0;
        #5 a=1;
        #5 a=0; b=1;
        #5 a=1;
        #5 $finish;
    end
endmodule