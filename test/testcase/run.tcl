read_firrtl $fir_path
elaborate
write_verilog $verilog_path -overwrite
clear_firdb -all
exit