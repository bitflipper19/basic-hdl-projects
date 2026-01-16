`timescale 1ns/1ps

module mux2to1_tb;
    reg i0, i1, select;
    wire y;

    mux2to1 DUT(
        y, 
        i0, 
        i1, 
        select
    );

    initial begin
        $display("Time\ti0\ti1\tselect\ty");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, i0, i1, select, y);

        $dumpfile("mux2to1.vcd");
        $dumpvars(0, mux2to1_tb);

        i0 = 0; i1 = 1; select = 0; #3;
        i0 = 0; i1 = 1; select = 1; #3;
        i0 = 1; i1 = 0; select = 1; #3;

        $finish;
    end

endmodule





