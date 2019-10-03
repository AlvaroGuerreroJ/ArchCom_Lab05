`include "HalfAdder.v"

module FullAdder (
    a,
    b,
    c_in,
    s,
    c_out
);

    input a;
    input b;
    input c_in;
    output s;
    output c_out;

    wire s_a_b;
    wire c_a_b;
    wire c_s_a_b_and_c_in;

    HalfAdder h_a_and_b (
        .a (a),
        .b (b),
        .s (s_a_b),
        .c_out (c_a_b)
    );
    HalfAdder h_a_b_and_c_in (
        .a (s_a_b),
        .b (c_in),
        .s (s),
        .c_out (c_s_a_b_and_c_in)
    );

    assign c_out = c_a_b | c_s_a_b_and_c_in;

endmodule // FullAdder
