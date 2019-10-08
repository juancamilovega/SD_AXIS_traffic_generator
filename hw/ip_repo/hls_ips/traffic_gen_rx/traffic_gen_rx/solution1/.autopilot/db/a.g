#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/owl/git_repos/AXIS_traffic_generator/ip_repo/hls_ips/traffic_gen_rx/traffic_gen_rx/solution1/.autopilot/db/a.g.bc ${1+"$@"}
