`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2021 03:35:19 PM
// Design Name: 
// Module Name: blinky
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


module blinky(
//------------------------START DESIGN 1-------DESIGN 1: UNCOMMENT THE /* */ OF THIS DESIGN AND RECOMMENT DESIGN 2 WITH /* */------------------------------------
    input clk,//this is the clk signal being used for the program
    input rst,//this is the reset used when resetting the LED and counter in the program
    //input start,//not used in design 1 or 2
    input inc_freq,//this maps to the middle button on the board
    output reg [7:0] LED //this is used for the LEDs
    );
    
    reg [31:0] counter_internal;//creating a reg to act as a counter
    
    always@(posedge clk) begin//this runs continously at the pos edge of the clock
        if(rst) begin//when the reset switch is held down then the counter is reset to all 0s, the LEDs are turned off and the red LED is turned on
            counter_internal <= {32{1'b0}};//reset the internal counter back to 0
            
            LED <= {8{1'b0}};//reset the binary value back to 0
        end
        else begin//if rst is not switched, then the program goes to check conditions
            if(inc_freq) begin//if the middle button is pushed then the internal counter is increased by one
                counter_internal <= counter_internal + 1'b1;
            end
            
            if(counter_internal[24]) begin//once the counter is detected at certain value, the follwing will execute
                    LED <= LED + 1'b1;//increase value of LED in binary by one
                    counter_internal <= {32{1'b0}};//reset the internal counter
                end
                else begin//if the middle button is not pushed then the following is executed
                    LED <= LED;//the LED's get saved in the register
                end
            end
    end
    
    //------------------------END DESIGN 1---------------------------------------------------------------------------------------------------------------------------
    
    //------------------------START DESIGN 2-------DESIGN 2: UNCOMMENT THE /* */ OF THIS DESIGN AND RECOMMENT DESIGN 1 WITH /* */------------------------------------
    //NOTE************ for this design the #set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { LED16_R }]; #IO_L11P_T1_SRCC_14 Sch=led16_r     MUST BE UNCOMMENTED **************************************                  
    /*
    input clk,//this is the clk signal being used for the program
    input rst,//this is the reset used when resetting the LED and counter in the program
    //input start, //no longer needed
    input inc_freq,//this maps to the middle button on the board
    output reg [7:0] LED,//this is used for the LEDs
    output reg LED16_R//this holds a signal for when the middle button is being pressed, it lights up a red LED
    );
    
    reg [31:0] counter_internal;//creating a reg to act as a counter
    
    always@(posedge clk) begin//this runs continously at the pos edge of the clock
        if(rst) begin//when the reset switch is held down then the counter is reset to all 0s, the LEDs are turned off and the red LED is turned on
            counter_internal <= {32{1'b0}};
            
            LED <= {8{1'b0}};
            LED16_R <= 1'b1;
        end
        else begin//if rst is not switched, then the program goes to check conditions
            if(inc_freq) begin//if the middle button is pushed then the LEDs are increased in value by 1, the internal counter is increased by one, and red LED is turned off
                if(LED16_R) begin//this will only happen if the middle button is pressed and the red LED is on
                    LED <= LED + 1'b1;//increase value of LED in binary
                    //counter_internal <= {32{1'b0}};//reset counter, not needed for design 2
                    LED16_R <= LED16_R - 1'b1;//turn off LED
                end
            end
            else begin//if the middle button is not pushed then the following is executed
                LED16_R <= LED16_R + 1'b1;//red LED is turned back on
                LED <= LED;//the LED's get saved in the register
            end
        end
    end
    
*/
//------------------------END DESIGN 2---------------------------------------------------------------------------------------------------------------------------
    
endmodule