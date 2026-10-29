module half_adder(
    input logic a,b,
    output logic c,s
);

assign c = a &b ;
assign s = a ^ b;
endmodule 
