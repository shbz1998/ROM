//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 7

`timescale 1ns/10ps
`define MONITOR_STR_1 " MONITOR: %d: ADDRESS=%h, CS=%d, OE=%d |DATA_OUT=%h, %b"
`define MONITOR_STR_2 " MONITOR: %d: ADDRESS=%d, CS=%d, OE=%d, WS=%d |DATA_OUT=%b  DATA_IN=%b"

module rom_tb();

parameter WIDTH=8;
parameter DEPTH=5;
reg OE, CS;
reg [DEPTH-1 : 0] ADDR_inst;
wire [WIDTH-1 : 0] DATA_inst;
integer i, j, k;

reg OE2, CS2, WS2;
reg [DEPTH-1 : 0] ADDR_inst2;
wire [WIDTH-1 : 0] DATA_2;
reg [WIDTH-1 : 0] DATA_1;
reg [WIDTH-1 : 0] DATA_TEMP[0: 2**DEPTH-1];
reg [7:0] SCRAMBLED_DATA;


assign DATA_2 = (!OE2 && !CS2) ? DATA_1:8'bz; 

rom ROM1(DATA_inst, ADDR_inst, OE, CS);
regfile RAM2(DATA_2, ADDR_ins2, OE2, CS2, WS2);

initial 
begin
//PART A: INITIALIZE MEMORY
$readmemh("mem_file.txt", ROM1.memory, 4);
end

initial begin
$vcdpluson;
$monitor(`MONITOR_STR_1, $time, ADDR_inst, CS, OE, DATA_inst, DATA_inst);
end

initial begin

#15 $display("\n----PART B, C, D, E----");
#15 $monitoroff; CS=0; OE=1; j=0; CS2=0; OE2=0; WS2=0; 
#15 $monitoron;
#15 $display("READ");
for(i=4; i<=30; i=i+1) begin
#15 ADDR_inst=i;

//scrambling
#15 SCRAMBLED_DATA[7]=DATA_inst[0];
#15 SCRAMBLED_DATA[6]=DATA_inst[7];
#15 SCRAMBLED_DATA[5]=DATA_inst[1];
#15 SCRAMBLED_DATA[4]=DATA_inst[6];
#15 SCRAMBLED_DATA[3]=DATA_inst[2];
#15 SCRAMBLED_DATA[2]=DATA_inst[5];
#15 SCRAMBLED_DATA[1]=DATA_inst[3];
#15 SCRAMBLED_DATA[0]=DATA_inst[4];

#15 DATA_TEMP[j]=SCRAMBLED_DATA;
#15 $strobe("SCRAMBLED DATA: %b\n" , DATA_TEMP[j]);
#15 j=j+1;
end

#15 $monitoroff;
#15 $display("WRITING TO RAM");
#15 CS2=0; OE2=0; 
for(i=0;i<27;i=i+1) begin
#15 $monitoroff; 
#15 WS2=0; DATA_1=DATA_TEMP[i]; ADDR_inst2=i;
#15 $strobe(`MONITOR_STR_2, $time, ADDR_inst2, CS2, OE2, WS2, DATA_2, DATA_1);
#15 WS2=1;
end



end


endmodule
