// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // Company: 
// // Engineer: 
// // 
// // Create Date:    12:15:38 12/14/2017 
// // Design Name: 
// // Module Name:    vgaBitChange 
// // Project Name: 
// // Target Devices: 
// // Tool versions: 
// // Description: 
// //
// // Dependencies: 
// //
// // Revision: 
// // Revision 0.01 - File Created
// // Additional Comments: 
// //
// // Date: 04/04/2020
// // Author: Yue (Julien) Niu
// // Description: Port from NEXYS3 to NEXYS4
// //////////////////////////////////////////////////////////////////////////////////
// // module vga_bitchange(
// // 	input clk,
// // 	input bright,
// // 	input button,
// // 	input [9:0] hCount, vCount,
// // 	output reg [11:0] rgb,
// // 	output reg [15:0] score
// //    );
	
// // 	parameter BLACK = 12'b0000_0000_0000;
// // 	parameter WHITE = 12'b1111_1111_1111;
// // 	parameter RED   = 12'b1111_0000_0000;
// // 	parameter GREEN = 12'b0000_1111_0000;
// // 	parameter BLUE = 12'b0000_0000_1111;

// // 	wire ground;
// // 	wire mario;
// // 	reg reset;
// // 	reg[9:0] marioY;
// // 	reg[49:0] marioSpeed; 

// // 	initial begin
// // 		marioY = 10'd320;
// // 		score = 15'd0;
// // 		reset = 1'b0;
// // 	end
	
	
// // 	always@ (*) // paint a white box on a red background
// //     	if (~bright)
// // 		rgb = BLACK; // force black if not bright
// // 	 else if (mario == 1)
// // 		rgb = WHITE;
// // 	 else if (ground == 1)
// // 		rgb = BLACK; // white box
// // 	 else
// // 		rgb = BLUE; // background color

	
// // 	always@ (posedge clk)
// // 		begin
// // 		marioSpeed = marioSpeed + 50'd1;
// // 		if (marioSpeed >= 50'd500000) //500 thousand
// // 			begin
// // 			marioY = marioY + 10'd1;
// // 			marioSpeed = 50'd0;
// // 			if (marioY == 10'd779)
// // 				begin
// // 				marioY = 10'd0;
// // 				end
// // 			end
// // 		end

// // 	always@ (posedge clk)
// // 		if ((reset == 1'b0) && (button == 1'b1) && (hCount >= 10'd144) && (hCount <= 10'd784) && (marioY >= 10'd400) && (marioY <= 10'd475))
// // 			begin
// // 			score = score + 16'd1;
// // 			reset = 1'b1;
// // 			end
// // 		else if (marioY <= 10'd20)
// // 			begin
// // 			reset = 1'b0;
// // 			end

// // 	assign ground = ((hCount >= 10'd144) && (hCount <= 10'd784)) && ((vCount >= 10'd475) && (vCount <= 10'd519)) ? 1 : 0;

// // 	assign mario = ((hCount >= 10'd340) && (hCount < 10'd358)) &&
// // 				   ((vCount >= marioY) && (vCount <= marioY + 10'd24)) ? 1 : 0;
	
// // endmodule

// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // Block that can move left, right, and jump using solid color rectangles
// //////////////////////////////////////////////////////////////////////////////////
// module vga_bitchange(
//     input clk,
//     input rst,
//     input bright,
//     input btn_left,
//     input btn_right,
//     input btn_jump,
//     input [9:0] hCount, vCount,
//     output reg [11:0] rgb,
// 	output reg [15:0] score
// );

//     parameter BLACK = 12'b0000_0000_0000;
//     parameter WHITE = 12'b1111_1111_1111;
//     parameter RED   = 12'b1111_0000_0000;
//     parameter GREEN = 12'b0000_1111_0000;
//     parameter BLUE = 12'b0001_0001_0101;
    
//     // Character position
//     reg signed [9:0] posX = 10'd300;
//     reg signed [9:0] posY = 10'd400;
//     reg signed [6:0] V = 0;
//     reg isJumping = 0;
    
//     // Character size
//     parameter CHAR_WIDTH = 10'd18;
//     parameter CHAR_HEIGHT = 10'd24;

//     // Gravity and jump velocity
//     parameter G = 1;
//     parameter V_INIT = 7'd15;
    
//     wire [9:0] GROUND_Y = 10'd460;

//     reg[49:0] marioSpeed;
//     reg[49:0] jumpSpeed;

//     // Update character position
//     always @(posedge clk or posedge rst) begin
//         if (rst) begin
//             posX <= 10'd300;
//             posY <= GROUND_Y;
//             isJumping <= 0;
//             V <= 0;
//         end else begin
//             // Left/Right Movement
//             if (btn_left)
//             begin
//                 marioSpeed = marioSpeed + 50'd1;
//                     if (marioSpeed >= 50'd500000) //500 thousand
//                     begin
//                         posX <= posX - 10'd1;
//                         marioSpeed = 50'd0;
//                     end
//             end

//             else if (btn_right)
//             begin
//                 marioSpeed = marioSpeed + 50'd1;
//                 if (marioSpeed >= 50'd500000) //500 thousand
//                     begin
//                         posX <= posX + 10'd1;
//                         marioSpeed = 50'd0;
//                     end
//             end

//             // Jumping and Gravity
//             if (isJumping) begin
//                 jumpSpeed = jumpSpeed + 50'd1;
//                 if (jumpSpeed >= 50'd500000) //500 thousand
//                 begin
//                     V <= V + G;
//                     posY <= posY + V;
//                     jumpSpeed = 50'd0;
//                 end
//                 // posY <= posY + V;

//                 if (posY >= GROUND_Y) begin
//                     posY <= GROUND_Y;
//                     isJumping <= 0;
//                     V <= 0;
//                 end
//             end 
//             else if (btn_jump && posY >= GROUND_Y) begin
//                 isJumping <= 10'd1;
//                 V <= -V_INIT;
//                 posY <= posY - V_INIT;
//             end
//         end
//     end

//     // Drawing logic
//     wire inBlock = ((hCount >= posX) && (hCount < posX + CHAR_WIDTH)) &&
//                    ((vCount >= posY) && (vCount < posY + CHAR_HEIGHT));

//     wire inGround = (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);

//     // mario sprite
//     wire [15:0] mario_row_data;
//     wire [4:0] relY = vCount - posY;
//     wire [4:0] relX = hCount - posX;

//     mario_rom marioSprite(
//         .row(relY),
//         .pixels(mario_row_data)
//     );

//     wire isMarioPixel = (hCount >= posX && hCount < posX + 18 &&
//                         vCount >= posY && vCount < posY + 24 &&
//                         mario_row_data[15 - relX]); // left to right

//     always @(*) begin
//         if (!bright)
//             rgb = BLACK;
//         else if (isMarioPixel)
//             rgb = RED; // You can add shading/colors later
//         else if (inGround)
//             rgb = GREEN;
//         else
//             rgb = BLUE;
//     end

//     // always @(*) begin
//     //     if (!bright)
//     //         rgb = BLACK;
//     //     else if (inBlock)
//     //         rgb = WHITE;
//     //     else if (inGround)
//     //         rgb = GREEN;
//     //     else
//     //         rgb = BLUE;
//     // end

// endmodule


// // module bram (
// //     input wire clk,
// //     input wire [13:0] addr,
// //     output reg [15:0] data
// // );

// //     reg [15:0] mem_array [0:16383]; // Adjust size as needed

// //     initial begin
// //         $readmemh("m_hex.mem", mem_array);  // HEX format
// //     end

// //     always @(posedge clk) begin
// //         data <= mem_array[addr];
// //     end

// // endmodule

//  module mario_rom (
//     input wire clk,
//     input [13:0] row, 
//     output reg [15:0] pixels
// );

//     reg [15:0] rom_data [0:16383];

//     initial begin
//         $readmemh("m_hex.mem", rom_data);
//     end

//     always @(posedge clk) begin
//         pixels <= rom_data[row];
//     end

// endmodule


// LATEST VERSION
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
    // parameter BLUE = 12'b0001_0001_0101;
    parameter BLUE = 12'h7AF;

    parameter TRANSPARENT_COLOR = 12'h000;
    
    // Character position
    reg signed [9:0] posX = 10'd300;
    reg signed [9:0] posY = 10'd400;
    reg signed [6:0] V = 0;
    reg isJumping = 0;
    
    // Character size
    parameter CHAR_WIDTH = 10'd32;
    parameter CHAR_HEIGHT = 10'd32;

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
                if (jumpSpeed >= 50'd1000000) //500 thousand
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

    // mario sprite
    // wire [15:0] mario_row_data;
    wire [4:0] relY = vCount - posY;
    wire [4:0] relX = hCount - posX;

    wire [1:0] inSpriteBounds = hCount >= posX && hCount < posX + CHAR_WIDTH &&
                        vCount >= posY && vCount < posY + CHAR_HEIGHT;

    // assign sprite_addr = relY * CHAR_WIDTH + relX; // 1D address for pixel color
    wire [7:0] sprite_addr = inSpriteBounds ? (relY * CHAR_WIDTH + relX) : 0;
    // holds the 12-bit color hex
    wire [11:0] sprite_pixel_color;

    mario_rom marioSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(sprite_pixel_color)
    );

    // Pipeline registers
    reg [11:0] rgb_next;
    // reg [11:0] rgb_reg;

    reg isMarioPixel_d;
    reg inGround_d;
    reg bright_d;

    wire [2:0] red_8bit;
    wire [2:0] green_8bit;
    wire [2:0] blue_8bit;

    // Delay signals by 1 clock cycle
    always @(posedge clk) begin
        // Delay pixel condition logic
        isMarioPixel_d <= (hCount >= posX && hCount < posX + CHAR_WIDTH &&
                        vCount >= posY && vCount < posY + CHAR_HEIGHT &&
                        sprite_pixel_color != TRANSPARENT_COLOR);

        inGround_d <= (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);
        bright_d <= bright;

        // Convert 8-bit color to 12-bit
        if (!bright_d)
            rgb_next <= BLACK;
        else if (isMarioPixel_d) begin
            // Convert to 12-bit color
            // red_8bit   = sprite_pixel_color[7:5];
            // green_8bit = sprite_pixel_color[4:2];
            // blue_8bit  = sprite_pixel_color[1:0];
            // rgb_next <= {red_8bit, red_8bit, green_8bit, green_8bit, blue_8bit, blue_8bit};
            // rgb_next <= {sprite_pixel_color[7:5], sprite_pixel_color[7:5],   // red
            //     sprite_pixel_color[4:2], sprite_pixel_color[4:2],   // green
            //     sprite_pixel_color[1:0], sprite_pixel_color[1:0]};  // blue
            rgb_next <= sprite_pixel_color;
        end
        else if (inGround_d)
            rgb_next <= GREEN;
        else
            rgb_next <= BLUE;

        // send RGB output
        rgb <= rgb_next;
    end

    // wire isMarioPixel = (hCount >= posX && hCount < posX + 12 &&
    //                     vCount >= posY && vCount < posY + 16 &&
    //                     sprite_pixel_color != 8'h03); // left to right

    // wire [11:0] color_12bit;

    // // convert to 12-bit
    // wire [2:0] red_8bit   = sprite_pixel_color[7:5];  // 3-bit red
    // wire [2:0] green_8bit = sprite_pixel_color[4:2];  // 3-bit green
    // wire [1:0] blue_8bit  = sprite_pixel_color[1:0];  // 2-bit blue

    // assign color_12bit = {red_8bit, red_8bit, green_8bit, green_8bit, blue_8bit, blue_8bit};

    // always @(*) begin
    //     if (!bright)
    //         rgb = BLACK;
    //     else if (isMarioPixel)
    //         rgb = color_12bit; 
    //     else if (inGround)
    //         rgb = GREEN;
    //     else
    //         rgb = BLUE;
    // end

    // always @(*) begin
    //     if (!bright)
    //         rgb = BLACK;
    //     else if (inBlock)
    //         rgb = WHITE;
    //     else if (inGround)
    //         rgb = GREEN;
    //     else
    //         rgb = BLUE;
    // end

endmodule

// reading from a mem file
// move the mem file into a "ROM" array (for an n-pixel image, mem file should have n rows)
//      each row should contain the information for a single pixel
//      for our mem file, each pixel will be compressed 8-bit RGB formatted
// and every clock, extract the next element from the array and return it
 module mario_rom (
    input wire clk,
    input wire [7:0] addr,        // 8-bit address: 2^8 = 256 > 192 (12x16)
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 12 x 16 = 192 pixels
    reg [11:0] rom [0:191];        // 192 total pixels

    initial begin
        $readmemh("C:/Mario/m_hex.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

    // initial begin
    // for (integer i = 0; i < 192; i = i + 1)
    //     rom[i] = 8'hFF;  // white
    // end

endmodule

// reg [7:0] rom_data [0:431];

    // initial begin
    //     $readmemh("m_hex.mem", rom_data);
    // end

    // always @(posedge clk) begin
    //     pixels <= rom_data[row];
    // end


// module bram (
//     input wire clk,
//     input wire [13:0] addr,
//     output reg [15:0] data
// );

//     reg [15:0] mem_array [0:16383]; // Adjust size as needed

//     initial begin
//         $readmemh("m_hex.mem", mem_array);  // HEX format
//     end

//     always @(posedge clk) begin
//         data <= mem_array[addr];
//     end

// endmodule

// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // VGA Character Controller with ROM-based Mario sprite
// //////////////////////////////////////////////////////////////////////////////////
// module vga_bitchange(
//     input clk,
//     input rst,
//     input bright,
//     input btn_left,
//     input btn_right,
//     input btn_jump,
//     input [9:0] hCount, vCount,
//     output reg [11:0] rgb,
// 	output reg [15:0] score
// );

//     // Colors
//     parameter BLACK = 12'b0000_0000_0000;
//     parameter WHITE = 12'b1111_1111_1111;
//     parameter RED   = 12'b1111_0000_0000;
//     parameter GREEN = 12'b0000_1111_0000;
//     parameter BLUE = 12'b0001_0001_0101;

//     // Character config
//     parameter CHAR_WIDTH = 10'd18;
//     parameter CHAR_HEIGHT = 10'd24;
//     parameter G = 1;
//     parameter V_INIT = 7'd15;
//     wire [9:0] GROUND_Y = 10'd460;

//     // Position and state
//     reg signed [9:0] posX = 10'd300;
//     reg signed [9:0] posY = 10'd400;
//     reg signed [6:0] V = 0;
//     reg isJumping = 0;
//     reg [49:0] marioSpeed;
//     reg [49:0] jumpSpeed;

//     // ROM-related wires
//     wire [4:0] relY = vCount - posY;
//     wire [4:0] relX = hCount - posX;
//     wire [17:0] mario_row_data;
//     wire mario_visible = (hCount >= posX && hCount < posX + CHAR_WIDTH) &&
//                          (vCount >= posY && vCount < posY + CHAR_HEIGHT);
//     wire mario_pixel_on = mario_row_data[CHAR_WIDTH - 1 - relX];

//     // Instantiate mario sprite ROM
//     mario_rom mario_sprite (
//         .row(relY),
//         .pixels(mario_row_data)
//     );

//     // Movement & jump logic
//     always @(posedge clk or posedge rst) begin
//         if (rst) begin
//             posX <= 10'd300;
//             posY <= GROUND_Y;
//             isJumping <= 0;
//             V <= 0;
//         end else begin
//             // Left/Right
//             if (btn_left) begin
//                 marioSpeed = marioSpeed + 50'd1;
//                 if (marioSpeed >= 50'd500000) begin
//                     posX <= posX - 10'd1;
//                     marioSpeed = 50'd0;
//                 end
//             end else if (btn_right) begin
//                 marioSpeed = marioSpeed + 50'd1;
//                 if (marioSpeed >= 50'd500000) begin
//                     posX <= posX + 10'd1;
//                     marioSpeed = 50'd0;
//                 end
//             end

//             // Jumping
//             if (isJumping) begin
//                 jumpSpeed = jumpSpeed + 50'd1;
//                 if (jumpSpeed >= 50'd500000) begin
//                     V <= V + G;
//                     posY <= posY + V;
//                     jumpSpeed = 50'd0;
//                 end
//                 if (posY >= GROUND_Y) begin
//                     posY <= GROUND_Y;
//                     isJumping <= 0;
//                     V <= 0;
//                 end
//             end else if (btn_jump && posY >= GROUND_Y) begin
//                 isJumping <= 1;
//                 V <= -V_INIT;
//                 posY <= posY - V_INIT;
//             end
//         end
//     end

//     // Display logic
//     wire inGround = (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);
//     wire inBlock = mario_visible && mario_pixel_on;

//     always @(*) begin
//         if (!bright)
//             rgb = BLACK;
//         else if (inBlock)
//             rgb = RED; // You can make this match Mario’s actual color
//         else if (inGround)
//             rgb = GREEN;
//         else
//             rgb = BLUE;
//     end

// endmodule

// //////////////////////////////////////////////////////////////////////////////////
// // Embedded ROM for Mario sprite (18x24)
// //////////////////////////////////////////////////////////////////////////////////
// module mario_rom (
//     input [4:0] row,           // 0–23
//     output reg [17:0] pixels   // 18 pixels per row
// );

//     reg [17:0] rom [0:23];     // 24 rows

//     initial begin
//         $readmemh("mario_sprite.mem", rom);
//     end

//     always @(*) begin
//         pixels = rom[row];
//     end

// endmodule



// 03 03 03 A4 A4 A4 A4 A4 03 03 03 03
// 03 03 A4 A4 A4 A4 A4 A4 A4 A4 03 03
// 03 03 48 48 48 AC AC 48 AC 03 03 03
// 03 48 AC 48 AC AC AC 48 AC AC AC 03
// 03 48 AC 48 48 AC AC AC 48 AC AC AC
// 03 48 48 AC AC AC AC 48 48 48 48 03
// 03 03 03 AC AC AC AC AC AC AC 03 03
// 03 03 48 48 A4 48 48 48 03 03 03 03
// 03 48 48 48 A4 48 48 A4 48 48 48 03
// 48 48 48 48 A4 A4 A4 A4 48 48 48 48
// AC AC 48 A4 AC A4 A4 AC A4 48 AC AC
// AC AC AC A4 A4 A4 A4 A4 A4 AC AC AC
// AC AC A4 A4 A4 A4 A4 A4 A4 A4 AC AC
// 03 03 A4 A4 A4 03 03 A4 A4 A4 03 03
// 03 48 48 48 03 03 03 03 48 48 48 03
// 48 48 48 48 03 03 03 03 48 48 48 48