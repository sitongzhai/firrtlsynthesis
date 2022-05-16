read -dut1 -sysv_2005 -top $m $v1
read -dut2 -sysv_2005 -top $m $v2

write -format verilog firrtlsyn_lec.netlist.v

def_clk clock
def_rst reset -val 1

add_cons -postreset reset -pinvalue 0

set_opt -cec_use_reset on
# default is on


#set_opt -cec_no_split_max  64
set_opt -cec_dff_cells {DFF}

set_opt -cec_match_type on
set_opt -cec_bus_miter on

set_opt -show_miter_support_diff on

match -name
show_match -spec -impl -ma -summary 

match -auto
show_match -spec -impl -ma -summary -dump

set_opt -eng cec1
#set_opt -engine par -par {cec1 cec2 cec3 cec4}

cec_prove
show_miter -list -summ -eng