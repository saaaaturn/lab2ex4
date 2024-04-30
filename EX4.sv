module EX4
(
	input logic clk, rst, en,
	input logic [2:0] sw,	//switchs
	output logic ss, ls		//short signal and long signal
);
//
reg start_signal;
reg [3:0] code;
reg [2:0] len;
reg fnsig;						//finish signal
//
initial begin 
	fnsig = 1'b1;
end
//
FSM	setting_states
(
	.en(en),
	.rst(rst),
	.finish(fnsig),
	.sel(sw),					//selection signals
	.start(start_signal)
);
//
DECODER	setting_morse
(
	.start(start_signal),
	.sw(sw),
	.mcode(code), 
	.mlength(len)
);
//
BLINK	blink_led
(
	.clk(clk),
	.mcode(code),
	.mlength(len),
	.shortbl(ss),
	.longbl(ls),	
	.finish(fnsig)
);
//
endmodule