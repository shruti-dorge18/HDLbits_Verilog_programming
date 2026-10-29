module top_module(
	input too_cold, 
	input too_hot,
	input mode,
	input fan_on,
	output heater,
	output aircon,
	output fan
);

	assign fan = heater | aircon | fan_on;

	assign heater = (mode & too_cold);

	assign aircon = (~mode & too_hot);
		
endmodule

/* Interpreting the statements
1. In heating mode, turn the heater on when it is too cold (too_cold = 1) but do not use the air conditioner.
assign heater = (mode & too_cold & ~aircon) X because cold --> hence no AC --> dont use ~aircon

2. In cooling mode, turn the air conditioner on when it is too hot (too_hot = 1), but do not turn on the heater.
assign aircon = (~mode & too_hot & ~heater) X for heater --> mode=1 --> here mode=0 already --> dont use heater

3. When the heater or air conditioner are on, also turn on the fan to circulate the air.
In addition, the user can also request the fan to turn on (fan_on = 1),
even if the heater and air conditioner are off. 

meaning fan= on even if heater OR ac OR fan are ON or off
also,in Verilog, you can use one output signal to calculate another output signal
(aircon, heater are outputs)

*/
