`ifndef GUARD_ANY16_V
`define GUARD_ANY16_V

`include "Any8.v"

module Any16 (
    in,
    out
);

    input [15:0] in;
    output out;

    wire r0;
    wire r1;

    Any8 any0 (
        .in(in[7:0]),
        .out(r0)
    );
    Any8 any1 (
        .in(in[15:8]),
        .out(r1)
    );

    assign out = r0 | r1;

endmodule // Any16

`endif
