`timescale 1ns / 1ps
module FF_JK_TB;
    reg clk;
    reg j,k;
    wire q;
 // Instantiate the D flip-flop Design Under Test (dut)
    TF dut (
        .clk(clk),
        .T(T),
        .q(q)
    );
    initial begin
        $dumpfile("TF_TB.vcd");

        $dumpvars(0, FF_JK_TB);
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
        j=0 ; k=1;
        #15 j= 1; k =0;
        #10 j=0 ; k= 1
    end
endmodule
