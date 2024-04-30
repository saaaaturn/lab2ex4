module FSM
(
	input logic en,rst,finish,
	input logic [2:0] sel,	//selection signals
	output logic start
);
//
typedef enum logic [1:0] 
{
	IDLE = 2'b01,
	RUN = 2'b10
} state;
state current_state, next_state;
//
initial 
begin
	current_state <= IDLE;
end
//
always_ff @(posedge en)
begin
	if (!rst)
	current_state <= IDLE;
	else 
	current_state <= next_state;
end
//
always@(*)
begin
case (current_state)
IDLE:
	if (en == 1'b1 && finish == 1'b1)
	next_state <= RUN;
	else 
	next_state <= IDLE;
RUN:
	if (finish == 1'b1)
	next_state <= IDLE;
	else
	next_state <= RUN;
default:
	next_state <= IDLE; 
endcase 
end
//
always@(*)
begin
case (current_state)
IDLE:
	start = 1'b0;
RUN:
	start = 1'b1;
default:
	start = 1'b0;
endcase
end
//
endmodule