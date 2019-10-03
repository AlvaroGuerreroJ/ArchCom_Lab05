`ifndef GUARD_ALU_V
`define GUARD_ALU_V

`include "ArithmeticPart.v"
`include "Any32.v"
`include "LogicPart.v"

module ALU (
    a,
    b,
    op,
    out,
    all_zeroes
);

    input [31:0] a;
    input [31:0] b;
    input [3:0] op;

    output [31:0] out;
    output all_zeroes;

    wire [31:0] arithmetic_out;
    wire [31:0] logic_out;
    wire not_all_zeroes;

    ArithmeticPart ap (
        .a(a),
        .b(b),
        .op({op[3], op[1]}),
        .out(arithmetic_out)
    );
    LogicPart lp (
        .a(a),
        .b(b),
        .op(op[1:0]),
        .out(logic_out)
    );

    assign out = op[2] ? logic_out : arithmetic_out;

    Any32 any32 (
        .in(out),
        .out(not_all_zeroes)
    );

    assign all_zeroes = ~not_all_zeroes;

endmodule // ALU

`endif
