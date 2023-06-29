`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2023 08:47:27 PM
// Design Name: 
// Module Name: switchlight
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module switchlight(
    input CLK100MHZ,
    input rst,
    
    output reg [6:0] seg,
    output reg [7:0] AN,
    output reg [7:0] LED
    );
    reg [31:0] counter;
    reg [6:0] segHOLDER;
    localparam bit1 = 1'b1;
    
    always@(posedge CLK100MHZ) begin
        if(rst) begin
            counter <= {32{1'b0}};
            LED <= {8{1'b0}};
            AN <= 8'b11111110;
            seg <= {7{1'b1}};
        end
        else begin
            counter <= counter + 1'b1;
            if(counter[24])begin
                LED <= LED + 1'b1;
                seg <= seg - 1'b1;
                counter <= {32{1'b0}};
            end
            else begin
                LED <= LED;
                seg <= seg;
            end
        end
    end
endmodule















