`timescale 1ns/1ps

module tb;

    logic [3:0] a, b;
    logic cin;
    logic [3:0] s;
    logic cout;

    ripple_adder4 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        for (int i = 0; i < 512; i++) begin
            {a, b, cin} = 9'(i);
            #1;

            if ({cout, s} !==
                (5'(a) + 5'(b) + 5'(cin))) begin
                $fatal(1,
                    "FAIL: A=%b B=%b Cin=%b Cout=%b S=%b",
                    a, b, cin, cout, s);
            end
        end

        $display("All 512 ripple-adder tests passed!");
        $finish;
    end

endmodule
