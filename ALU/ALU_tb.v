`include "ALU.v"

module ALU_tb ();

    reg clk;

    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] op;
    wire [31:0] out;
    wire all_zeroes;

    parameter clk_half_period = 0.5;
    parameter clk_period = 2 * clk_half_period;

    parameter op_add = 4'b0000;
    parameter op_sub = 4'b0010;
    parameter op_and = 4'b0100;
    parameter op_or = 4'b0101;
    parameter op_xor = 4'b0110;
    parameter op_nor = 4'b0111;
    parameter op_slt = 4'b1010;

    initial begin
        $monitor("a: %d,\t\t%b\nb: %d,\t\t%b\t\nop: %b\t\nout: %d,\t%b\t\nall_zeroes: %b\n",
                 a, a, b, b, op, out, out, all_zeroes);
        a = 32'd17;
        b = 32'd256;
        op = op_add;

        #(clk_period)
        op = op_sub;

        #(clk_period)
        op = op_slt;

        #(clk_period)
        b = 32'd17;
        a = 32'd256;

        #(clk_period)
        op = op_sub;

        #(clk_period)
        a = 32'b0011000001000011011111010101100;
        b = 32'b1100100000011011100110001011010;
        op = op_and;

        #(clk_period)
        op = op_or;

        #(clk_period)
        op = op_xor;

        #(clk_period)
        op = op_nor;

        #(clk_period)
        $finish;
    end

    always begin
        #clk_half_period clk = !clk;
    end

    initial begin
        $dumpfile("ALU_wave.vcd");
        $dumpvars;
    end

    ALU DUT (
        .a(a),
        .b(b),
        .op(op),
        .out(out),
        .all_zeroes(all_zeroes)
    );

endmodule // ALU_tb
