module comparator4(
    input logic [3:0] a, b,
    output logic equal,
    output logic less_unsigned,
    output logic less_signed
);

logic [3:0] s;
logic cout, overflow;

adder_subtractor_status4 ass4(
    .a(a),
    .b(b),
    .s(s),
    .sub(1'b1),
    .cout(cout),
    .overflow(overflow)
);

assign equal = ~|s;
assign less_unsigned = ~cout;
assign less_signed = s[3] ^ overflow;
endmodule