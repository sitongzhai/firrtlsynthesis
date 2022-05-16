#!/usr/bin/env tclsh

set cur_path [pwd]
set case_name [file tail $cur_path]
set fir_path "$cur_path/$case_name.fir"
set result_path "[file dirnam [file dirnam [file dirname $cur_path]]]/result/$case_name"
set verilog_path "$result_path/$case_name.v"
set firrtlsyn_log "$result_path/$case_name.log"
# create result file
if {[file exists [file dirnam [file dirnam [file dirname $cur_path]]]]} {
    file delete -force "[file dirnam [file dirnam [file dirname $cur_path]]]/result"
    file mkdir $result_path
}

# read testcase global run.tcl
set run_all_tcl "[file dirnam [file dirname $cur_path]]/run.tcl"
set f_run_all_tcl [open $run_all_tcl r]
while {![eof $f_run_all_tcl]} {
    set firrtlsyn_command [gets $f_run_all_tcl] 
    regsub {\$fir_path} $firrtlsyn_command $fir_path firrtlsyn_command
    regsub {\$verilog_path} $firrtlsyn_command $verilog_path firrtlsyn_command
    if {[regexp "exit" $firrtlsyn_command] } {
        # move firrtlsyn.log to result/log before firrtlsyn exit
        file rename "firrtlsyn.log" $firrtlsyn_log
        puts "the log is on: $result_path"
    }
    eval $firrtlsyn_command
}
