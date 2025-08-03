module ic_7483(
    output [3:0] sum;
    output Cout;
    input [3:0] A, B;
    input C0;
);
    wire [3:0] norb, nandb, andb; // nor bus & nand bus & and bus
    wire NC0; assign NC0 = ~(C0);

// Ai XOR Bi using (~NOR of Ai & Bi) & (NAND of Ai & Bi)
    nor n0(norb[0], A[0], B[0]);
    nand na0(nandb[0], A[0], B[0]);
    and a0(andb[0], (~norb[0]), nandb[0]);

    nor n1(norb[1], A[1], B[1]);
    nand na1(nandb[1], A[1], B[1]);
    and a1(andb[1], (~norb[1]), nandb[1]);

    nor n2(norb[2], A[2], B[2]);
    nand na2(nandb[2], A[2], B[2]);
    and a2(andb[2], (~norb[2]), nandb[2]);

    nor n3(norb[3], A[3], B[3]);
    nand na3(nandb[3], A[3], B[3]);
    and a3(andb[3], (~norb[3]), nandb[3]);
    
// Generating Ci
    wire [3:0] carryb;
    // C0
    nor n4(carryb[0], NC0, NC0);

    // C1
    
endmodule