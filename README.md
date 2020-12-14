# SD_AXIS_traffic_generator
Software defined cycle accurate AXI Stream traffic generator

1. Clone this repository in a server with Vivado installed and cd to the newly created repo. Run the following commands:
  a. git checkout arm64 -- to obtain the arm project
  b. cd hw && make -- to make the hardware project
2. wait for the example project to be generated at hw/examples/SD_AXIS_traffic_gen_ex
4. open example project in Vivado, remove the fake app IP, replace it with your own IP or project.
5. configure the IP core SD_traffic_gen/SD_AXIS_traffic_gen_0 to meet your needs.
6. connect the traffic source with your IP and generate the bitstream
7. generate the binary file named it as "sd_traffic_gen.bin", move it to /lib/firmware in mpsoc ubuntu. Also copy to this location sd_traffic_gen.dtbo
8. in the mpsoc ubuntu, run the following commands:
  a. sudo su -- to become root
  b. a. On U of T mpsoc machines run overlay_program sd_traffic_gen.dtbo. If overlay program is not defined run this instead:
     if [ ! -e /configfs/device-tree ]
     then
        mount -t configfs configfs /configfs
        mkdir /configfs/device-tree/overlays/full
        echo sd_traffic_gen.dtbo > /configfs/device-tree/overlays/full/path
     elif [ ! -e /configfs/device-tree/overlays/full ]
          then
               mkdir /configfs/device-tree/overlays/full
               echo sd_traffic_gen.dtbo > /configfs/device-tree/overlays/full/path
     else
          /root/disablePci.sh
          rmdir /configfs/device-tree/overlays/full
          mkdir /configfs/device-tree/overlays/full
          echo sd_traffic_gen.dtbo > /configfs/device-tree/overlays/full/path
     fi

9. clone this repository to mpsoc ubuntu
10. Generate the csv description of the test:
  Go to <repo_dir>/sw/utilities. There are two scripts, gen_traffic_csv.py and gen_traffic_bin.py
  gen_traffic_csv.py can build a basic csv based on provided flags, see python3 gen_traffic_csv.py -h for full flag description
  Alternatively the csv can be built by hand. The format is as follows:
'''
cycle_id,packet_id,tdata,tkeep,tlast,tvalid
0,0,0x7d434167bf7135e2dbf8e8c340d054ad1017f83e0763395376492af7e8edf9f65456aaf000000000000000000000000000000000000000000000000000000000,0xfffffffff0000000,1,1
1,1,0xa0f64e567742a25573724a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,0xffe0000000000000,1,1
2,2,0xb4f640434e6ee4b082a796eb57e0a8ffa15e53acea3f5a0000000000000000000000000000000000000000000000000000000000000000000000000000000000,0xfffffe0000000000,1,1
3,3,0xfa58c38f8604cc7a239ed86d17e3bb94072cf01ca4bb0f3fd97a5d6c3f1ff16d220c2e8b00000000000000000000000000000000000000000000000000000000,0xfffffffff0000000,1,1
4,4,0x0341aaa61a6b159a55910c1e697b6c9d40010f51224c4c740f8b6eb8cb150be998867a9f727fc40694930ef424fab4ac53d5756946052ac20000000000000000,0xffffffffffffff00,1,1
5,5,0xd46bd67a9ecc404f5de82e67006b70174a0724d68129e59a6cb8268537853df44d54a1f65d865785d665429a21cf2577055f11a0aeedfec557f0c6c72a4bb7e3,0xffffffffffffffff,0,1
6,5,0x7e5d3fa79089809058a126a956b1e90fd08261910000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,0xfffff00000000000,1,1
7,6,0x8e54a5c63ad9afcb34f0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,0xffe0000000000000,1,1
8,7,0x1a5db7bcc913ab07b366e9c28604faf9eb51020ba86eca3130c546ed9513ce03d58889f9d0fd089b89dfa2adc3f6b0746a36d16c395c0102e41d44cd9bf5a000,0xfffffffffffffffe,1,1
9,8,0x7414ae3fab8e0b133300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,0xff80000000000000,1,1
10,9,0xdc2bfb31f59528b293a333b376fb7b07f3b7a54f06392fcb49fe0eee19116c13986f5775ac1e85fef666d6c12e307bbd9bba7b3fcdc0fd6efbccffd5285a691b,0xffffffffffffffff,0,1
11,9,0x498ac431239a2dc457c9b661256fc1d58ef854a5df264c37082655e079455ed1a5bad2d66032f8b75d93c0ca074e053ba06a1e22dbdf25000000000000000000,0xfffffffffffffe00,1,1
12,10,0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,0x0000000000000000,0,0
'''
  Here you control the data cycle by cycle. This uses the standard AXI Streaming standard with tlast denoting the end on a packet. Set tvalid as 0 to skip a cycle (send no data one cycle).
11. Generate the test bin file:
  a. Navigate to <repo_dir>/sw/utilities and run:
  b. python3 gen_traffic_bin.py <name_of_csv.csv> -o <name_of_bin.bin>
12. Make the driver
  a. Navigate to <repo_dir>/sw/driver and run make
13. Run the driver using the bin file built in step 11
  a. Navigate to <repo_dir>/sw/driver/output
  b. To run the csv script N times (set N=0 for infinite times) run*:
      ./traffic_gen -n N <name_of_bin.bin>
      
* Note if some address regions of the ddr are in use, to specify the region that the traffic generator can use, if offset X is free run instead:
./traffic_gen -n N -o X <name_of_bin.bin>
  
, get the driver executable from sw/driver/output, generate the binary file from csv, run "traffic_gen <traffic_binary>"
