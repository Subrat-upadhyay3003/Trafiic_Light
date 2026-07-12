module Trafic_loght_testbench;
reg clk,rst;
wire[2:0] main_light;
wire [2:0] side_light;

Trafic_light_rtl dut(.clk(clk),.rst(rst),.main_light(main_light),.side_light(side_light));

always #5 clk=~clk;

initial
begin
clk=0;
rst=1;
#20 rst=0;
#500 $finish;

end

initial
begin
$monitor("Time=%t,counter=%d,main=%b,side=%b",$time,dut.counter,main_light,side_light);
end
endmodule