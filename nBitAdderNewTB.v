`timescale 1ns / 1ps
module tb_n_bitadder;
    parameter N=8;
    reg[N-1:0] a;
    reg[N-1:0] b;
    reg cin;
    
    wire cout;
    wire [N-1:0] sum;

    FA_Nbit #(.N(N)) dut(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        $dumpfile("nBitAdderTB.vcd");
        $dumpvars(0, tb_n_bitadder);
    end

    initial begin
        $display("Testing Full Adder");
        $monitor("a = %b, b = %b, cin = %b,  cout = %b,sum = %b", a, b, cin, sum, cout);

        // Apply various test cases
        a = 8'b10101010;b=8'b11110000; cin=1'b0 ; #10; 
        $finish;
    end


endmodule