`timescale 1ns / 1ps
module FF_D_TB;
    reg clk;
    reg d;
    wire q;
     // Instantiate the D flip-flop Design Under Test (dut)
    FF_D dut (
        .clk(clk),
        .d(d),
        .q(q)
    );
    initial begin
        $dumpfile("FF_D_TB.vcd");
        $dumpvars(0, FF_D_TB);
    end
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    // Test sequence
    initial begin
    // $monitor("time= %t, d = %b, q = %b", $time, d, q);
        $monitor("clock= %b, d = %b, q = %b", clk, d, q);
        d = 0;
        #10 d = 1;
        #7 d = 0;
        #6 d = 1;
        $finish;
    end
endmodule
