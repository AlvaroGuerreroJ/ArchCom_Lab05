`include "AdderCarryLookahead32.v"

module NegateNumber32 (
    in,
    out
);

    input [31:0] in;
    output [31:0] out;

    wire [31:0] in_negated;

    assign in_negated = ~in;

    AdderCarryLookahead32 ad (
        .a(in_negated),
        .b(32'b1),
        .out(out)
    );

endmodule // NegateNumber32
