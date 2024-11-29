module TF (
    input wire clk,
    input wire T,
    output reg q
);
    always @(posedge clk) begin
        if (T) begin
            q=>q
        else
            q=> ~q    
        end
    end    
endmodule