`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:38 12/14/2017 
// Design Name: 
// Module Name:    vgaBitChange 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Date: 04/04/2020
// Author: Yue (Julien) Niu
// Description: Port from NEXYS3 to NEXYS4
//////////////////////////////////////////////////////////////////////////////////
// module vga_bitchange(
// 	input clk,
// 	input bright,
// 	input button,
// 	input [9:0] hCount, vCount,
// 	output reg [11:0] rgb,
// 	output reg [15:0] score
//    );
	
// 	parameter BLACK = 12'b0000_0000_0000;
// 	parameter WHITE = 12'b1111_1111_1111;
// 	parameter RED   = 12'b1111_0000_0000;
// 	parameter GREEN = 12'b0000_1111_0000;
// 	parameter BLUE = 12'b0000_0000_1111;

// 	wire ground;
// 	wire mario;
// 	reg reset;
// 	reg[9:0] marioY;
// 	reg[49:0] marioSpeed; 

// 	initial begin
// 		marioY = 10'd320;
// 		score = 15'd0;
// 		reset = 1'b0;
// 	end
	
	
// 	always@ (*) // paint a white box on a red background
//     	if (~bright)
// 		rgb = BLACK; // force black if not bright
// 	 else if (mario == 1)
// 		rgb = WHITE;
// 	 else if (ground == 1)
// 		rgb = BLACK; // white box
// 	 else
// 		rgb = BLUE; // background color

	
// 	always@ (posedge clk)
// 		begin
// 		marioSpeed = marioSpeed + 50'd1;
// 		if (marioSpeed >= 50'd500000) //500 thousand
// 			begin
// 			marioY = marioY + 10'd1;
// 			marioSpeed = 50'd0;
// 			if (marioY == 10'd779)
// 				begin
// 				marioY = 10'd0;
// 				end
// 			end
// 		end

// 	always@ (posedge clk)
// 		if ((reset == 1'b0) && (button == 1'b1) && (hCount >= 10'd144) && (hCount <= 10'd784) && (marioY >= 10'd400) && (marioY <= 10'd475))
// 			begin
// 			score = score + 16'd1;
// 			reset = 1'b1;
// 			end
// 		else if (marioY <= 10'd20)
// 			begin
// 			reset = 1'b0;
// 			end

// 	assign ground = ((hCount >= 10'd144) && (hCount <= 10'd784)) && ((vCount >= 10'd475) && (vCount <= 10'd519)) ? 1 : 0;

// 	assign mario = ((hCount >= 10'd340) && (hCount < 10'd358)) &&
// 				   ((vCount >= marioY) && (vCount <= marioY + 10'd24)) ? 1 : 0;
	
// endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Block that can move left, right, and jump using solid color rectangles
//////////////////////////////////////////////////////////////////////////////////
module vga_bitchange(
    input clk,
    input rst,
    input bright,
    input btn_left,
    input btn_right,
    input btn_jump,
    input [9:0] hCount, vCount,
    output reg [11:0] rgb,
	output reg [15:0] score
);

    parameter BLACK = 12'b0000_0000_0000;
    parameter WHITE = 12'b1111_1111_1111;
    parameter RED   = 12'b1111_0000_0000;
    parameter GREEN = 12'b0000_1111_0000;
    parameter BLUE = 12'b0001_0001_0101;
    
    // Character position
    reg signed [9:0] posX = 10'd300;
    reg signed [9:0] posY = 10'd400;
    reg signed [6:0] V = 0;
    reg isJumping = 0;
    
    // Character size
    parameter CHAR_WIDTH = 10'd18;
    parameter CHAR_HEIGHT = 10'd24;

    // Gravity and jump velocity
    parameter G = 1;
    parameter V_INIT = 7'd15;
    
    wire [9:0] GROUND_Y = 10'd460;

    reg[49:0] marioSpeed;
    reg[49:0] jumpSpeed;

    // Update character position
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            posX <= 10'd300;
            posY <= GROUND_Y;
            isJumping <= 0;
            V <= 0;
        end else begin
            // Left/Right Movement
            if (btn_left)
            begin
                marioSpeed = marioSpeed + 50'd1;
                    if (marioSpeed >= 50'd500000) //500 thousand
                    begin
                        posX <= posX - 10'd1;
                        marioSpeed = 50'd0;
                    end
            end

            else if (btn_right)
            begin
                marioSpeed = marioSpeed + 50'd1;
                if (marioSpeed >= 50'd500000) //500 thousand
                    begin
                        posX <= posX + 10'd1;
                        marioSpeed = 50'd0;
                    end
            end

            // Jumping and Gravity
            if (isJumping) begin
                jumpSpeed = jumpSpeed + 50'd1;
                if (jumpSpeed >= 50'd500000) //500 thousand
                begin
                    V <= V + G;
                    posY <= posY + V;
                    jumpSpeed = 50'd0;
                end
                // posY <= posY + V;

                if (posY >= GROUND_Y) begin
                    posY <= GROUND_Y;
                    isJumping <= 0;
                    V <= 0;
                end
            end 
            else if (btn_jump && posY >= GROUND_Y) begin
                isJumping <= 10'd1;
                V <= -V_INIT;
                posY <= posY - V_INIT;
            end
        end
    end

    // Drawing logic
    wire inBlock = ((hCount >= posX) && (hCount < posX + CHAR_WIDTH)) &&
                   ((vCount >= posY) && (vCount < posY + CHAR_HEIGHT));

    wire inGround = (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);

    always @(*) begin
        if (!bright)
            rgb = BLACK;
        else if (inBlock)
            rgb = WHITE;
        else if (inGround)
            rgb = GREEN;
        else
            rgb = BLUE;
    end

endmodule
