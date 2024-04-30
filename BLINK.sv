module BLINK
(
	input logic clk,
	input logic [3:0] mcode,
	input logic [2:0] mlength,
	output logic shortbl, longbl,	//short blink(0) long blink (1)
	output logic finish
);
//
wire x;
reg [3:0] mc,mc2; //morse code
reg [2:0] ml,ml2; //morse length
//
assign mc = mcode;
assign ml = mlength;
assign x = mc2[0];
//
always@(posedge clk)
begin
if (ml2 != 0)
	begin
	ml2 = ml - 3'b001;
	mc2 = mc >>1;
	finish =0;
	end
//
else if (ml2 == 0)
	finish =1;
else
	finish =0;
end
//
assign shortbl = ~x;
assign longbl = x;
endmodule