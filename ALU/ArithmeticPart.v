`ifndef GUARD_ARITHMETIC_PART
`define GUARD_ARITHMETIC_PART

`include "AdderCarryLookahead32.v"
`include "NegateNumber32.v"

module ArithmeticPart (
    a,
    b,
    op,
    out
);

    input [31:0] a;
    input [31:0] b;
    input [1:0] op;
    output [31:0] out;

    wire [31:0] negated_b;
    wire [31:0] evaluated_b;
    wire [31:0] plus_a_b;
    wire [31:0] slt_res;

    NegateNumber32 neg_b (
        .in(b),
        .out(negated_b)
    );

    assign evaluated_b = op[0] ? negated_b : b;

    AdderCarryLookahead32 add_a_ev (
        .a(a),
        .b(evaluated_b),
        .out(plus_a_b)
    );

    /*genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin
            assign slt_res[i] = plus_a_b[31];
        end
    endgenerate*/
    assign slt_res = (plus_a_b[31] == 1'b1) ? 32'hFFFFFFFF : 32'h0;
    assign out = op[1] ? slt_res : plus_a_b;

endmodule // ArithmeticPart

`endif
