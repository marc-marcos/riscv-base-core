all:

registers: registers.sv
	iverilog -o registers_tb registers_tb.sv
