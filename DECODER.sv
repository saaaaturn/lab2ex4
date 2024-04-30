module DECODER
(
	input logic start,
	input logic [2:0] sw,
	output logic [3:0] mcode, 
	output logic [2:0] mlength
);
//
reg [3:0] morse_cd;
reg [2:0] morse_len;
//
assign mcode = morse_cd & start;
assign mlength = morse_len & start;
//
always@(*)
begin
case (sw)
3'b000:							//A
	begin 
	morse_cd	 = 4'b0010;
	morse_len = 3'b010;
	end
3'b001:							//B
	begin 
	morse_cd	 = 4'b0001;
	morse_len = 3'b100;
	end
3'b010:							//C
	begin 
	morse_cd	 = 4'b0101;
	morse_len = 3'b100;
	end
3'b011:							//D
	begin 
	morse_cd	 = 4'b0001;
	morse_len = 3'b011;
	end
3'b100:							//E
	begin 
	morse_cd	 = 4'b0000;
	morse_len = 3'b001;
	end
3'b101:							//F
	begin 
	morse_cd	 = 4'b0100;
	morse_len = 3'b100;
	end
3'b110:							//G
	begin 
	morse_cd	 = 4'b0011;
	morse_len = 3'b011;
	end
3'b111:							//H
	begin 
	morse_cd	 = 4'b0000;
	morse_len = 3'b100;
	end
default:
	begin
	morse_cd = 4'b0000;
	morse_len = 3'b000;
	end
endcase
end
endmodule