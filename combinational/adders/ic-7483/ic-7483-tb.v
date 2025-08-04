module ic_7483_tb;
    reg [3:0] a, b;
    reg Cin;
    wire carry;
    wire [3:0] result;

    ic_7483 DUT(
        .SUM(result),
        .Cout(carry),
        .A(a),
        .B(b),
        .C0(Cin)
    );

    initial begin
        $dumpfile("ic-7483.vcd");
        $dumpvars(0, ic_7483_tb);
        $monitor("Time=%0t : %b + %b + %b = %b%b", $time, a, b, Cin, carry, result);

        a = 4'b0001; b = 4'b0010; Cin = 0; #5;
        a = 4'b1111; b = 4'b0001; Cin = 0; #5;
        a = 4'b1010; b = 4'b0101; Cin = 1; #5;
        a = 4'b1111; b = 4'b1111; Cin = 1; #5;
        a = 4'b0000; b = 4'b0000; Cin = 0; #5;
        a = 4'b0011; b = 4'b1100; Cin = 1; #5;

        $finish;
    end
endmodule
