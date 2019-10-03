`ifndef GUARD_ANY4_CPP
`define GUARD_ANY4_CPP

`include "Any2.v"

module Any4 (
    in,
    out
);

    input [3:0] in;
    output out;

    wire r0;
    wire r1;

    Any2 any0 (
        .in(in[1:0]),
        .out(r0)
    );
    Any2 any1 (
        .in(in[3:2]),
        .out(r1)
    );

    assign out = r0 | r1;

endmodule // Any4

`endif
