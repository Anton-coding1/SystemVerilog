module adder_subtractor4(
    input logic [3:0] a,b,
    input logic sub,
    output logic [3:0] s,
    output logic cout
);
logic [3:0] b_modified;
assign b_modified = b ^ {4{sub}};

ripple_adder4 ra4(
    .a(a),
    .b(b_modified),
    .cin(sub),
    .s(s),
    .cout(cout)
);
endmodule
