module mux2to1(
    output y,
    input i0, 
    input i1,
    input select
);  
    // Behavioral Modelling
    // assign y= (~select & i0) | (select & i1);


    // Gate-Level Modelling
    wire not_select, and1, and2;
    not (not_select, select);
    and (and1, not_select, i0);
    and (and2, select, i1);
    or (y, and1, and2);
endmodule
