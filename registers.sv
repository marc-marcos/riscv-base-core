module registers(
        input clk,
        input [4:0] addr,
        input [31:0] in,
        input write,
        output reg [31:0] out
    );

    reg [31:0] regs [31:0];

    always @(posedge clk) begin 
        if (write) begin
            regs[addr] <= in;
        end
    end

    // Ouput logic
    always @(posedge clk) begin
        out <= regs[addr];
    end
    

endmodule
