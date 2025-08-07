// Full adder using 2 x half adders

`include "ha1.v"

module fa(cout, sum, a, b, cin);
    input a, b, cin;
    output cout, sum;
    wire sum1, cout1, cout2;
    ha ha1(cout1, sum1, a, b);
    ha ha2(cout2, sum, sum1, cin);
    or o1(cout, cout1, cout2);
endmodule