module FA_Nbit #(parameter N = 4)( 
    input wire [N-1:0] a,    // N-bit input A 
    input wire [N-1:0] b,    // N-bit input B 
    input wire cin,          // Carry-in for the LSB 
    output wire [N-1:0] sum, // N-bit sum output 
    output wire cout         // Carry-out for the MSB 
); 
// Define a temporary variable to hold the result of addition with carry 
    wire [N:0] result;  
// Behavioral modeling using arithmetic addition 
    assign result = a + b + cin; 
// Assign sum and carry-out from the result 
    assign sum = result[N-1:0]; // Lower N bits for sum 
    assign cout = result[N];     // Most significant bit as carry-out 
endmodule 