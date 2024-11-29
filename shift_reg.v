module shiftReg (
    input clk,
    input dir,
    input rst,
    input serial_in, // Single-bit serial input
    output reg [3:0] data, // 4-bit output register
    output reg serial_out // Single-bit serial output
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data <= 4'b0000;
            serial_out <= 0;
        end else begin
            if(dir) begin    
                serial_out <= data[3]; // The bit being shifted out
                data <= {serial_in ,data[0:2]}; // Shift right and insert new bit
            end else begin
                serial_out <= data[0]; // The bit being shifted out
                data <= {serial_in ,data[3:1]}; // Shift right and insert new bit
        end
    end
endmodule