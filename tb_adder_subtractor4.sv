
`timescale 1ns/1ps

module tb;

    logic [3:0] a, b;
    logic sub;
    logic [3:0] s;
    logic cout;

    logic [3:0] expected_s;
    logic expected_cout;
    int result;

    adder_subtractor4 dut (
        .a(a),
        .b(b),
        .sub(sub),
        .s(s),
        .cout(cout)
    );

    initial begin
        for (int i = 0; i < 512; i++) begin
            {a, b, sub} = 9'(i);
            #1;

            if (sub == 0) begin
                result = int'(a) + int'(b);
                expected_cout = (result >= 16);
            end
            else begin
                result = int'(a) - int'(b);
                expected_cout = (a >= b);
            end

            expected_s = 4'(result);

            if ({cout, s} !== {expected_cout, expected_s}) begin
                $fatal(1,
                    "FAIL: A=%b B=%b SUB=%b | Expected=%b_%b Got=%b_%b",
                    a, b, sub,
                    expected_cout, expected_s,
                    cout, s);
            end
        end

        $display("All 512 adder-subtractor tests passed!");
        $finish;
    end

endmodule
