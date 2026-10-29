`timescale 1ns/1ps

module tb;

    logic [3:0] a, b;
    logic equal, less_unsigned, less_signed;

    comparator4 dut (
        .a(a),
        .b(b),
        .equal(equal),
        .less_unsigned(less_unsigned),
        .less_signed(less_signed)
    );

    initial begin
        for (int i = 0; i < 256; i++) begin
            {a, b} = 8'(i);
            #1;

            if (equal !== (a == b) ||
                less_unsigned !== (a < b) ||
                less_signed !== ($signed(a) < $signed(b))) begin

                $fatal(1,
                    "FAIL: A=%b B=%b eq=%b unsigned_lt=%b signed_lt=%b",
                    a, b, equal, less_unsigned, less_signed);
            end
        end

        $display("All 256 comparator tests passed!");
        $finish;
    end

endmodule
