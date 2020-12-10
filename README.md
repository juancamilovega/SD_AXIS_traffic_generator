# SD_AXIS_traffic_generator
Software defined cycle accurate AXI Stream traffic generator

1. git checkout arm64
2. cd hw && make
3. wait for the example project to be generated at hw/examples/SD_AXIS_traffic_gen_ex
4. open example project in Vivado, remove the fake app IP, replace it by your own IP.
5. configure the IP core SD_traffic_gen/SD_AXIS_traffic_gen_0 per your needs.
6. connect the traffic source with your IP and generate the bitstream
7. generate the binary file named it as "sd_traffic_gen.bin", move it to /lib/firmware in mpsoc ubuntu.
8. in mpsoc, run "overlay_program sd_traffic_gen.dtbo" as root
9. clone this project to mpsoc ubuntu, get the driver executable from sw/driver/output, generate the binary file from csv, run "traffic_gen <traffic_binary>"
