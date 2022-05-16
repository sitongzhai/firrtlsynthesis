#!/usr/bin/env tclsh

set cur_path [pwd]
set case_name [file tail $cur_path]
set fir_path "$cur_path/$case_name.fir"
set result_path "[file dirnam [file dirnam [file dirname $cur_path]]]/result/$case_name"
set verilog_path "$result_path/$case_name.v"
set firrtlsynyn_log "$result_path/$case_name.log"
# create result file
if {[file exists [file dirnam [file dirnam [file dirname $cur_path]]]]} {
    file delete -force "[file dirnam [file dirnam [file dirname $cur_path]]]/result"
    file mkdir $result_path
}

# read testcase global run.tcl
set run_all_tcl "[file dirnam [file dirname $cur_path]]/run.tcl"
set f_run_all_tcl [open $run_all_tcl r]
while {![eof $f_run_all_tcl]} {
    set firrtlsynyn_command [gets $f_run_all_tcl] 
    regsub {\$fir_path} $firrtlsynyn_command $fir_patfirrtlsynlsyn_command
    regsub {\$verilog_path} $firrtlsynyn_command $verilog_patfirrtlsynlsyn_command
    if {[regexp "exit" $firrtlsynyn_command] } {
        # move firrtlsynyn.log to result/log beforfirrtlsynlsyn exit
        file rename "firrtlsynyn.log"firrtlsynlsyn_log
        puts "the log is on: $result_path"
    }
    eval $firrtlsynyn_command
}
