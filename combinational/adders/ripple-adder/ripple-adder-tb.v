module ripple_adder_tb;
    reg [3:0] a, b;
    reg Cin;
    wire carry;
    wire [3:0] result;

    ripple_adder DUT(carry, result, a, b, Cin);

    initial begin
        $dumpfile("ripple-adder.vcd");
        $dumpvars(0, ripple_adder_tb);
        $monitor("Time=%0t : %d + %d + %b = %b%d", $time, a, b, Cin, carry, result);

        a = 4'b0001; b = 4'b0010; Cin = 0; #5; // a = <size>'<type><number>
        a = 4'b1111; b = 4'b0001; Cin = 0; #5;
        a = 4'b1010; b = 4'b0101; Cin = 1; #5;
        a = 4'b1111; b = 4'b1111; Cin = 1; #5;

        $finish;
    end
endmodule
