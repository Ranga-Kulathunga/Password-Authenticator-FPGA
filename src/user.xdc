## This file is a general .xdc for the Basys3 rev B board

## Clock signal

set_property PACKAGE_PIN W5 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

##7 segment display

set_property PACKAGE_PIN W7 [get_ports {SSG_D[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[0]}]

set_property PACKAGE_PIN W6 [get_ports {SSG_D[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[1]}]

set_property PACKAGE_PIN U8 [get_ports {SSG_D[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[2]}]

set_property PACKAGE_PIN V8 [get_ports {SSG_D[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[3]}]

set_property PACKAGE_PIN U5 [get_ports {SSG_D[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[4]}]

set_property PACKAGE_PIN V5 [get_ports {SSG_D[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[5]}]

set_property PACKAGE_PIN U7 [get_ports {SSG_D[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_D[6]}]

set_property PACKAGE_PIN U4 [get_ports {SSG_EN[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_EN[0]}]

set_property PACKAGE_PIN V4 [get_ports {SSG_EN[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_EN[1]}]

set_property PACKAGE_PIN W4 [get_ports {SSG_EN[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SSG_EN[2]}]

##Buttons

set_property PACKAGE_PIN U18 [get_ports rst]

set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN T17 [get_ports R]

set_property IOSTANDARD LVCMOS33 [get_ports R]

set_property PACKAGE_PIN W19 [get_ports L]

set_property IOSTANDARD LVCMOS33 [get_ports L]

set_property PACKAGE_PIN T18 [get_ports T]

set_property IOSTANDARD LVCMOS33 [get_ports T]

set_property PACKAGE_PIN U17 [get_ports D]

set_property IOSTANDARD LVCMOS33 [get_ports D]