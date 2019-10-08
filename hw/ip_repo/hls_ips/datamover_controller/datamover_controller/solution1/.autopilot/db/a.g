#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/owl/git_repos/AXIS_traffic_generator/ip_repo/hls_ips/datamover_controller/datamover_controller/solution1/.autopilot/db/a.g.bc ${1+"$@"}
