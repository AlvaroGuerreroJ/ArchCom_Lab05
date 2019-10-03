`ifndef GUARD_ADDERCARRYLOOKAHEAD_V
`define GUARD_ADDERCARRYLOOKAHEAD_V

module AdderCarryLookahead32 (
    a,
    b,
    out
);

    input [31:0] a;
    input [31:0] b;
    output [31:0] out;

    wire [30:0] carry_generate;
    wire [30:0] carry_propagate;
    wire [30:0] carrys;

    genvar i;

    generate
        for (i = 0; i < 31; i = i + 1) begin
            assign carry_generate[i] = a[i] & b[i];
        end
    endgenerate

    generate
        for (i = 0; i < 31; i = i + 1) begin
            assign carry_propagate[i] = a[i] | b[i];
        end
    endgenerate

    assign carrys[0] = carry_generate[0];
    generate
        for (i = 1; i < 31; i = i + 1) begin
            assign carrys[i] = carry_generate[i] | (carry_propagate[i] & carrys[i - 1]);
        end
    endgenerate

    assign out[0] = a[0] ^ b[0];
    generate
        for (i = 1; i < 32; i = i + 1) begin
            assign out[i] = a[i] ^ b[i] ^ carrys[i - 1];
        end
    endgenerate

endmodule // AdderCarryLookahead32

`endif
