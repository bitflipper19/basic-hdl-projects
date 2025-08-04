// ic-7483 is a 4-bit carry look ahead adder ic of 74 series [TTL]

module ic_7483(
    output [3:0] SUM,
    output Cout,
    input [3:0] A, B,
    input C0
);
    wire [3:0] norb, nandb, andb; // nor bus & nand bus & and bus
    wire NC0; assign NC0 = ~(C0);

// Generating Ai XOR Bi using (~NOR of Ai & Bi) & (NAND of Ai & Bi)
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

// Note: Above statements can also be implemented using a synthesizable for loop
// as follows

/*
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : xor_using_nand_nor
            nor (norb[i], A[i], B[i]);
            nand(nandb[i], A[i], B[i]);
            and (andb[i], ~norb[i], nandb[i]);  // Ai XOR Bi
        end
    endgenerate
*/
    
// Generating Ci and Si
    wire [3:0] carryb;

    // C0 & S0
    nor n4(carryb[0], NC0, NC0);
    xor S0(SUM[0], carryb[0], andb[0]);

    // C1 & S1
    wire [1:0] C1b;
    and a4(C1b[0], NC0, nandb[0]);
    buf b1(C1b[1], norb[0]);
    nor n5(carryb[1], C1b[0], C1b[1]);
    xor S1(SUM[1], carryb[1], andb[1]);

    // C2 & S2
    wire [2:0] C2b;
    and a5(C2b[0], NC0, nandb[0], nandb[1]);
    and a6(C2b[1], nandb[1], norb[0]);
    buf b2(C2b[2], norb[1]);
    nor n6(carryb[2], C2b[0], C2b[1], C2b[2]);
    xor S2(SUM[2], carryb[2], andb[2]);

    // C3 & S3
    wire [3:0] C3b;
    and a7(C3b[0], NC0, nandb[0], nandb[1], nandb[2]);
    and a8(C3b[1], nandb[2], nandb[1], norb[0]);
    and a9(C3b[2], nandb[2], norb[1]);
    buf b3(C3b[3], norb[2]);
    nor n7(carryb[3], C3b[0], C3b[1], C3b[2], C3b[3]);
    xor S3(SUM[3], carryb[3], andb[3]);

    // C4 - Final Carry Flag
    wire [4:0] C4b;
    and a10(C4b[0], NC0, nandb[0], nandb[1], nandb[2], nandb[3]);
    and a11(C4b[1], nandb[1], nandb[2], nandb[3], norb[0]);
    and a12(C4b[2], nandb[2], nandb[3], norb[1]);
    and a13(C4b[3], nandb[3], norb[2]);
    buf b4(C4b[4], norb[3]);
    nor n8(Cout, C4b[0], C4b[1], C4b[2], C4b[3], C4b[4]);
    
endmodule