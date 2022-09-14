###################################################################

# Created by write_sdc on Wed Sep 14 17:28:04 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports i_clk]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports i_rst_n]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {i_in[4]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {i_in[3]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {i_in[2]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {i_in[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {i_in[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports i_load]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports i_up]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports i_down]
set_load -pin_load 0.5 [get_ports {o_counter[4]}]
set_load -pin_load 0.5 [get_ports {o_counter[3]}]
set_load -pin_load 0.5 [get_ports {o_counter[2]}]
set_load -pin_load 0.5 [get_ports {o_counter[1]}]
set_load -pin_load 0.5 [get_ports {o_counter[0]}]
set_load -pin_load 0.5 [get_ports o_high]
set_load -pin_load 0.5 [get_ports o_low]
create_clock [get_ports i_clk]  -name CLK  -period 100  -waveform {0 50}
set_clock_latency 0  [get_clocks CLK]
set_clock_uncertainty -setup 0.2  [get_clocks CLK]
set_clock_uncertainty -hold 0.1  [get_clocks CLK]
set_clock_transition -max -rise 0.05 [get_clocks CLK]
set_clock_transition -min -rise 0.05 [get_clocks CLK]
set_clock_transition -max -fall 0.05 [get_clocks CLK]
set_clock_transition -min -fall 0.05 [get_clocks CLK]
group_path -name INOUT  -from [list [get_ports i_clk] [get_ports i_rst_n] [get_ports {i_in[4]}] [get_ports {i_in[3]}] [get_ports {i_in[2]}] [get_ports {i_in[1]}] [get_ports {i_in[0]}] [get_ports i_load] [get_ports i_up] [get_ports i_down]]  -to [list [get_ports {o_counter[4]}] [get_ports {o_counter[3]}] [get_ports {o_counter[2]}] [get_ports {o_counter[1]}] [get_ports {o_counter[0]}] [get_ports o_high] [get_ports o_low]]
group_path -name INREG  -from [list [get_ports i_clk] [get_ports i_rst_n] [get_ports {i_in[4]}] [get_ports {i_in[3]}] [get_ports {i_in[2]}] [get_ports {i_in[1]}] [get_ports {i_in[0]}] [get_ports i_load] [get_ports i_up] [get_ports i_down]]
group_path -name REGOUT  -to [list [get_ports {o_counter[4]}] [get_ports {o_counter[3]}] [get_ports {o_counter[2]}] [get_ports {o_counter[1]}] [get_ports {o_counter[0]}] [get_ports o_high] [get_ports o_low]]
set_input_delay -clock CLK  40  [get_ports i_clk]
set_input_delay -clock CLK  40  [get_ports i_rst_n]
set_input_delay -clock CLK  40  [get_ports {i_in[4]}]
set_input_delay -clock CLK  40  [get_ports {i_in[3]}]
set_input_delay -clock CLK  40  [get_ports {i_in[2]}]
set_input_delay -clock CLK  40  [get_ports {i_in[1]}]
set_input_delay -clock CLK  40  [get_ports {i_in[0]}]
set_input_delay -clock CLK  40  [get_ports i_load]
set_input_delay -clock CLK  40  [get_ports i_up]
set_input_delay -clock CLK  20  [get_ports i_down]
set_output_delay -clock CLK  20  [get_ports {o_counter[4]}]
set_output_delay -clock CLK  20  [get_ports {o_counter[3]}]
set_output_delay -clock CLK  20  [get_ports {o_counter[2]}]
set_output_delay -clock CLK  20  [get_ports {o_counter[1]}]
set_output_delay -clock CLK  20  [get_ports {o_counter[0]}]
set_output_delay -clock CLK  20  [get_ports o_high]
set_output_delay -clock CLK  20  [get_ports o_low]
