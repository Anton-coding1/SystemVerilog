module adder_subtractor_status4(
    input logic [3:0] a, b,
    input logic sub,
    output logic [3:0] s,
    output logic cout,
    output logic overflow
);

adder_subtractor4 ad4(
    .a(a),
    .b(b),
    .sub(sub),
    .s(s),
    .cout(cout)
);

assign overflow = (a[3] ^ s[3]) & ~(a[3] ^ b[3] ^ sub);
endmodule
