read_verilog full_adder_synth.v
link_design full_adder
create_clock -name clk -period 10 [get_ports clk]
set_input_delay -clock clk 2 [get_ports {a b cin}]
set_output_delay -clock clk 2 [get_ports {sum cout}]
report_checks -path_delay max
