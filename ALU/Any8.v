`ifndef GUARD_ANY4_V
`define GUARD_ANY4_V

`include "Any4.v"

module Any8 (
    in,
    out
);

    input [7:0] in;
    output out;

    wire r0;
    wire r1;

    Any4 any0 (
        .in(in[3:0]),
        .out(r0)
    );
    Any4 any1 (
        .in(in[7:4]),
        .out(r1)
    );

    assign out = r0 | r1;

endmodule // Any8

`endif
