module fs_tb;
    reg a, b, Bin;
    wire d, Bo;
    fs DUT(d, Bo, a, b, Bin);

    initial begin
        $dumpfile("fs.vcd");
        $dumpvars(0, fs_tb);
        $monitor($time, " a=%b b=%b Bin=%b d=%b Bo=%b", a, b, Bin, d, Bo);
        #5 a=0; b=0; cin=0; 
        #5 a=1; 
        #5 a=0; b=1; cin=1; 
        #5 a=1; 
        #5 $finish;
    end
endmodule