// Gate level structural implementation of Full adder

module fa(cout, sum, a, b, cin);
    input a, b, cin;
    output cout, sum;
    wire w1, w2, w3, w4;
    xor (w4, a, b), (sum, w4, cin);
    and (w1, a, b), (w2, b, cin), (w3, cin, a);
    or (cout, w1, w2, w3);
endmodule