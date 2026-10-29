`timescale 1ns/1ps

module tb;

    logic a, b, cin;
    logic s, cout;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        $display("A B Cin | Cout S | Result");

        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = 3'(i);
            #1;

            if ({cout, s} !== (2'(a) + 2'(b) + 2'(cin))) begin
                $fatal(1, "FAIL: a=%b b=%b cin=%b cout=%b s=%b",
                       a, b, cin, cout, s);
            end

            $display("%b %b  %b  |  %b   %b | PASS",
                     a, b, cin, cout, s);
        end

        $display("All 8 full-adder tests passed!");
        $finish;
    end

endmodule
