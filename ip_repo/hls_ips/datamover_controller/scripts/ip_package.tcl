set ip_name [lindex $argv 0]
set part_name [lindex $argv 1]
set project_name ${ip_name}_ip
create_project ${project_name} ${project_name} -part $part_name
import_files $ip_name/solution1/syn/verilog
ipx::package_project -root_dir ${project_name}/${project_name}.srcs/sources_1/imports -vendor clarkshen.com -library user -taxonomy /UserIP
set_property vendor_display_name {clarkshen.com} [ipx::current_core]
set_property name $ip_name [ipx::current_core]
set_property display_name $ip_name [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::associate_bus_interfaces -busif m_axis -clock ap_clk [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
close_project 
exit
