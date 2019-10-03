`ifndef GUARD_ANY32_V
`define GUARD_ANY32_V

`include "Any16.v"

module Any32 (
    in,
    out
);

    input [31:0] in;
    output out;

    wire r0;
    wire r1;

    Any16 any0 (
        .in(in[15:0]),
        .out(r0)
    );
    Any16 any1 (
        .in(in[31:16]),
        .out(r1)
    );

    assign out = r0 | r1;

endmodule // Any32

`endif
