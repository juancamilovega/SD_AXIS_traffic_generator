set project_dir [file dirname [file dirname [file normalize [info script]]]]
set project_name "SD_AXIS_traffic_gen_ex"
set script_dir [file dirname [file normalize [info script]]]
source $script_dir/util.tcl
create_project $project_name $project_dir/$project_name -part xczu19eg-ffvc1760-2-i
create_bd_design $project_name
set_property ip_repo_paths "${project_dir}/../ip_repo" [current_project]
update_ip_catalog -rebuild

source $script_dir/bd.tcl

validate_bd_design
make_wrapper -files [get_files $project_dir/$project_name/${project_name}.srcs/sources_1/bd/${project_name}/${project_name}.bd] -top
add_files -norecurse $project_dir/$project_name/${project_name}.srcs/sources_1/bd/${project_name}/hdl/${project_name}_wrapper.v
save_bd_design
add_files -fileset constrs_1 -norecurse $project_dir/constraints/sidewinder100.xdc
close_project
exit
