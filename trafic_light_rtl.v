module Trafic_light_rtl(
	input clk,
	input rst,
	output reg [2:0] main_light,
	output reg [2:0] side_light
);
parameter RED=3'b000;
parameter YELLOW=3'b010;
parameter GREEN=3'b001;

parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;

parameter Green_Delay=10;
parameter Yellow_Delay=3;

reg [1:0] state,next_state;
reg [3:0] counter;

always @(posedge clk or posedge rst)
begin

if(rst)
state<=S0;

else
state<=next_state;
end

always @(posedge clk or posedge rst)

begin

if(rst)
counter<=0;

else if(counter==get_delay(state)-1)
counter<=0;

else
counter<=counter+1;

end

function [3:0] get_delay;
input [1:0] state;

begin
case (state)

S0:get_delay=Green_Delay;
S1:get_delay=Yellow_Delay;
S2:get_delay=Green_Delay;
S3:get_delay=Yellow_Delay;
default:get_delay=Green_Delay;

endcase
end
endfunction

always@(*)

begin
next_state=state;

case(state)

S0:
if(counter==Green_Delay-1)
next_state=S1;

S1:
if(counter==Yellow_Delay-1)
next_state=S2;

S2:
if(counter==Green_Delay-1)
next_state=S3;

S3:
if(counter==Yellow_Delay-1)
next_state=S0;

endcase

end

always@(*)

begin

case(state)
S0:
begin
main_light=GREEN;
side_light=RED;
end

S1:
begin
main_light=YELLOW;
side_light=RED;

end

S2:
begin
main_light=RED;
side_light=GREEN;

end

S3:
begin
main_light=RED;
side_light=YELLOW;
end
default:
begin
main_light=RED;
side_light=RED;
end
endcase
end

endmodule


