

module FA ( 
    input wire a, 
    input wire b, 
    input wire cin, 
    output wire sum, 
    output wire cout 
); 
    assign sum = a ^ b ^ cin; 
    assign cout = ((a ^ b) & cin) | (a & b); 
 
endmodule 
 
 
module FA_Nbit #(parameter N = 4)( 
    input wire [N-1:0] a,    // N-bit input A 
    input wire [N-1:0] b,    // N-bit input B 
    input wire cin,          // Carry-in for the LSB 
    output wire [N-1:0] sum, // N-bit sum output 
    output wire cout         // Carry-out for the MSB 
); 
 
    wire [N:0] carry; // Create a carry wire array of N+1 bits 
    assign carry[0] = cin; 
 
    // Generate N instances of the 1-bit Full Adder 
    genvar i; 
    generate 
        for (i = 0; i < N; i = i + 1) 
            begin: bit_adders 
                FA fa ( 
                    .a(a[i]), 
                    .b(b[i]), 
                    .cin(carry[i]), 
                    .sum(sum[i]), 
                    .cout(carry[i+1])
                    ); 
end 
endgenerate 
// The final carry-out is the carry from the last adder 
assign cout = carry[N]; 
endmodule 
