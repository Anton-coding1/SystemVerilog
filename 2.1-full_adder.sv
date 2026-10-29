module full_adder(
    input logic a,b,cin,
    output logic cout,s
);

logic x, p;

half_adder ha1 (
    .a(a),
    .b(b),
    .s(x),
    .c(p)
);
logic q;

half_adder ha2 (
    .a(cin),
    .b(x),
    .s(s),
    .c(q)
);

assign cout = p | q;
endmodule
