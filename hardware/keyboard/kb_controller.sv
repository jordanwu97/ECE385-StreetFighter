module keyboard_controller (input logic CLK_50, psClk, psData, RESET_H,
									 output logic [3:0] P1_Direction // 
									 );
logic[7:0] keyCode;
logic press;

always_ff @ (posedge Clk)
begin
	if (reset)
	begin
		for (int i = 0; i < 4; i++)
			P1_Direction[i] <= 0;
	end
	case(keyCode)
		// W
		8'h1d:
		P1_Direction[0] <= press;
		// A
		8'h1c:
		P1_Direction[1] <= press;
		// S
		8'h1b:
		P1_Direction[2] <= press;
		// D
		8'h23:
		P1_Direction[3] <= press;
	endcase
end

keyboard kb_0(.Clk(CLOCK_50), .psClk(PS2_KBCLK), .psData(PS2_KBDAT), .reset(RESET_H), .keyCode(keyCode), .press(press));
									 
endmodule