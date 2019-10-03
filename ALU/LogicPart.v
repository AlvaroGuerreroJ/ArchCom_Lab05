`ifndef GUARD_LOGIC_PART
`define GUARD_LOGIC_PART

module LogicPart (
    a,
    b,
    op,
    out
);

    input [31:0] a;
    input [31:0] b;
    input [1:0] op;
    output [31:0] out;

    wire [31:0] temp_or;
    wire [31:0] temp_xor_and;
    wire [31:0] temp_nor_or;

    assign temp_or = a | b;
    assign temp_nor_or = (op[1]) ? ~temp_or : temp_or;

    assign temp_xor_and = (op[1]) ? (a ^ b) : (a & b);

    assign out = (op[0]) ? temp_nor_or : temp_xor_and;

endmodule // LogicPart

`endif
