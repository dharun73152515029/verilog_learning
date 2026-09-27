set ::env(DESIGN_NAME) counter_4bit
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/*.v]
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10.0"
set ::env(FP_CORE_UTIL) 20
set ::env(FP_PDN_VPITCH) 10
set ::env(FP_PDN_HPITCH) 10
