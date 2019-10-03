`ifndef GUARD_ANY2_V
`define GUARD_ANY2_V

module Any2 (
    in,
    out
);

    input [1:0] in;
    output out;

    assign out = in[0] | in[1];

endmodule // Any2

`endif
