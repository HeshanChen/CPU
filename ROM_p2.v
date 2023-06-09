module ROM_p2(step, instruction, data_var, clk);
	//input [7:0] read_address; // In total, the ROM can store 256 instructions.
	input step, clk;
	output reg [15:0] data_var;
	output reg [8:0] instruction;

	reg [7:0] read_address;

	initial begin
		read_address = 8'b00000000;
	end

	always @ (posedge step) begin
		read_address = read_address + 1;
	end

	always @ (read_address) begin
		case(read_address)
			// load r0, 9
			8'b00000000: begin instruction = 9'b000000000; data_var = 16'b0000000000001001; end 

			// move r1, r0
			8'b00000001: begin instruction = 9'b001001000; data_var = 16'b0000000000000000; end

			// move r2, r0
			8'b00000010: begin instruction = 9'b001010000; data_var = 16'b0000000000000000; end

			// add r1, r0
			8'b00000011: begin instruction = 9'b010001000; data_var = 16'b0000000000000000; end

			// xor r2, r1
			8'b00000100: begin instruction = 9'b011010001; data_var = 16'b0000000000000000; end

			// Terminate
			8'b00000101: begin instruction = 9'b100000000; data_var = 16'b0000000000000000; end
			default: begin instruction = 9'b100000000; data_var = 16'b0000000000000000; end
		endcase
	end
endmodule
