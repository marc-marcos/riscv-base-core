`include "registers.sv"

module registers_tb();
    reg clk;
    reg [31:0] in;
    reg write;
    reg [4:0] addr;
    wire [31:0] out;

    registers uut (
        .clk(clk),
        .addr(addr),
        .in(in),
        .write(write),
        .out(out)
    ); 

    initial begin
        forever begin
            clk = 0; 
            #100;
            clk = 1;
            #100;
        end
    end

    initial begin
        addr = 5'b00000; 
        write = 1'b1; 
        in = 32'b00000000000000000000000000000001; 
        #200;

        addr = 5'b00001; 
        write = 1'b0; 
        in = 32'b00000000000000000000000000000000; 
        #200;

        addr = 5'b00000; 
        write = 1'b0; 
        in = 32'b00000000000000000000000000000000; 
        #200;

        $finish; 
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, registers_tb);
    end

endmodule
