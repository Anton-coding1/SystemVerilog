module tb;
    logic a, b;
    logic s, c;

    half_adder dut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    initial begin
        for (int i = 0; i < 4; i++) begin
            {a, b} = 2'(i);
            #1;

            if ({c, s} !== (2'(a) + 2'(b)))
                $fatal(1, "FAIL: a=%b b=%b c=%b s=%b",
                       a, b, c, s);

            $display("PASS: %b + %b = %b%b", a, b, c, s);
        end

        $display("All half-adder tests passed.");
        $finish;
    end
endmodule
