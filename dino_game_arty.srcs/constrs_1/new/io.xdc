set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
set_property PACKAGE_PIN E3 [get_ports clk_in]

set_property IOSTANDARD LVCMOS33 [get_ports o_pwm_0]
set_property PACKAGE_PIN G13 [get_ports o_pwm_0]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
