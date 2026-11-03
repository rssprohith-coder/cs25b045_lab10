```tcl
# Real Digital Boolean Board
# FPGA: XC7S50-CSGA324
# Top module: alu_top

# 6-bit input A: switches SW0-SW5
set_property -dict { PACKAGE_PIN V2 IOSTANDARD LVCMOS33 } [get_ports {A[0]}]
set_property -dict { PACKAGE_PIN U2 IOSTANDARD LVCMOS33 } [get_ports {A[1]}]
set_property -dict { PACKAGE_PIN U1 IOSTANDARD LVCMOS33 } [get_ports {A[2]}]
set_property -dict { PACKAGE_PIN T2 IOSTANDARD LVCMOS33 } [get_ports {A[3]}]
set_property -dict { PACKAGE_PIN T1 IOSTANDARD LVCMOS33 } [get_ports {A[4]}]
set_property -dict { PACKAGE_PIN R2 IOSTANDARD LVCMOS33 } [get_ports {A[5]}]

# 6-bit input B: switches SW6-SW11
set_property -dict { PACKAGE_PIN R1 IOSTANDARD LVCMOS33 } [get_ports {B[0]}]
set_property -dict { PACKAGE_PIN P2 IOSTANDARD LVCMOS33 } [get_ports {B[1]}]
set_property -dict { PACKAGE_PIN P1 IOSTANDARD LVCMOS33 } [get_ports {B[2]}]
set_property -dict { PACKAGE_PIN N2 IOSTANDARD LVCMOS33 } [get_ports {B[3]}]
set_property -dict { PACKAGE_PIN N1 IOSTANDARD LVCMOS33 } [get_ports {B[4]}]
set_property -dict { PACKAGE_PIN M2 IOSTANDARD LVCMOS33 } [get_ports {B[5]}]

# 3-bit operation selector: switches SW12-SW14
set_property -dict { PACKAGE_PIN M1 IOSTANDARD LVCMOS33 } [get_ports {sel[0]}]
set_property -dict { PACKAGE_PIN L1 IOSTANDARD LVCMOS33 } [get_ports {sel[1]}]
set_property -dict { PACKAGE_PIN K2 IOSTANDARD LVCMOS33 } [get_ports {sel[2]}]

# 6-bit result: LEDs LD0-LD5
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS33 } [get_ports {result[0]}]
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports {result[1]}]
set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS33 } [get_ports {result[2]}]
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS33 } [get_ports {result[3]}]
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS33 } [get_ports {result[4]}]
set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS33 } [get_ports {result[5]}]

# 2-bit comparator output: LEDs LD6-LD7
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports {cmp[0]}]
set_property -dict { PACKAGE_PIN E5 IOSTANDARD LVCMOS33 } [get_ports {cmp[1]}]

# Valid output: LED LD8
set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS33 } [get_ports {valid}]
```