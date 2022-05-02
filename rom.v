//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 7

`timescale 1ns/10ps
module rom(DATA, ADDR, OE, CS);
parameter WIDTH = 8;
parameter DEPTH = 5;
output reg [WIDTH-1 : 0] DATA;
input [DEPTH-1 : 0] ADDR; 
input OE, CS;
reg [WIDTH-1 : 0] memory [0: 2**DEPTH-1]; //0:

//CS is ACTIVE LOW; WRITE AT POSEDGE WS WHEN OE=0; READ AT OE=1.

//READ OPERTAION 
always @*
assign DATA = (OE && !CS) ? memory[ADDR] : 8'bz;


endmodule

