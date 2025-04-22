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

    // Character size
    parameter CHAR_WIDTH = 10'd32;
    parameter CHAR_HEIGHT = 10'd32;

    parameter SCREEN_LEFT  = 10'd143;
    parameter SCREEN_RIGHT = 10'd734 - CHAR_WIDTH;
    
    // Character position
    reg signed [9:0] posX = 10'd300;
    reg signed [9:0] posY = 10'd400;
    // reg signed [9:0] old_posX = 10'd300;
    reg signed [6:0] V = 0;
    reg isJumping = 0;

    // Gravity and jump velocity
    parameter G = 1;
    parameter V_INIT = 7'd15;
    
    wire [9:0] GROUND_Y = 10'd460;

    reg[49:0] marioSpeed;
    reg[49:0] jumpSpeed;
    reg [49:0] jumpWait;
    reg [49:0] movement_counter; // counts how many pixels Mario has moved since last frame switch
    reg [1:0] walkAnimation; // 0 for walk, 1 for jump

    // reg[49:0] animateSpeed;

    // drawing logic variables
    wire inBlock = ((hCount >= posX) && (hCount < posX + CHAR_WIDTH)) &&
                   ((vCount >= posY) && (vCount < posY + CHAR_HEIGHT));

    wire inGround = (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);

    // mario sprite

    // direction flag for jumping when not pressing any other button
    reg [1:0] marioDirection; // 0 for right, 1 for left

    // wire [15:0] mario_row_data;
    wire [4:0] relY = vCount - posY;
    wire [4:0] relX = hCount - posX;

    wire [1:0] inSpriteBounds = hCount >= posX && hCount < posX + CHAR_WIDTH &&
                        vCount >= posY && vCount < posY + CHAR_HEIGHT;

    // holds the address of the sprite bit in the rom array
    wire [9:0] sprite_addr = inSpriteBounds ? (relY * CHAR_WIDTH + relX) : 0;
    // holds the 12-bit color hex
    reg [11:0] sprite_pixel_color;

    // hold the color hex for each sprite
    wire [11:0] idle_right_sprite_color;
    wire [11:0] idle_left_sprite_color;
    wire [11:0] walk_right_sprite_color;
    wire [11:0] walk_left_sprite_color;
    wire [11:0] jump_right_sprite_color;
    wire [11:0] jump_left_sprite_color;

    // instantiate map tiles
    wire [11:0] ground_pixel;
    wire [9:0] ground_sprite_addr = ((vCount - GROUND_Y) % TILE_SIZE) * TILE_SIZE + (hCount % TILE_SIZE);
    parameter TILE_SIZE = 24; // adjust to match your sprite's tile size

    ground_tile groundSprite(
        .clk(clk),
        .addr(ground_sprite_addr),
        .pixel_data(ground_pixel)
    );

    wire isGroundTile = (vCount >= GROUND_Y && vCount < GROUND_Y + TILE_SIZE);

    // instantiate all sprites
    mario_idle_right marioIdleRightSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(idle_right_sprite_color)
    );

    mario_idle_left marioIdleLeftSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(idle_left_sprite_color)
    );

    mario_walk_right marioWalkRightSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(walk_right_sprite_color)
    );

    mario_walk_left marioWalkLeftSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(walk_left_sprite_color)
    );

    mario_jump_left marioJumpLeftSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(jump_left_sprite_color)
    );

    mario_jump_right marioJumpRightSprite(
        .clk(clk),
        .addr(sprite_addr),
        .pixel_data(jump_right_sprite_color)
    );


    // Update character position
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            posX <= 10'd300;
            posY <= GROUND_Y;
            isJumping <= 0;
            V <= 0;
    
        end else begin

            // load default sprite if nothing's happening
            if (!btn_left && !btn_right && !isJumping) begin
                if (marioDirection) // left 
                    sprite_pixel_color = idle_left_sprite_color;
                else if (!marioDirection) // right
                    sprite_pixel_color = idle_right_sprite_color;
            end


            // Left/Right Movement
            if (btn_left)
            begin

                // set the direction flag
                marioDirection = 1'b1;

                marioSpeed = marioSpeed + 50'd1;
                    if (marioSpeed >= 50'd500000) //500 thousand
                    begin
                        posX <= posX - 10'd1;
                        marioSpeed = 50'd0;
                        movement_counter = movement_counter + 50'd1;
                    end

                // set flag for animating sprite
                if (movement_counter >= 50'd15)
                begin 
                    if (!walkAnimation)
                    begin
                        walkAnimation = 1'd1;
                    end
                    
                    else
                    begin
                        walkAnimation = 1'd0;
                    end
                    movement_counter = 50'd0;
                end
            end

            else if (btn_right)
            begin
                // set direction flag
                marioDirection = 1'b0;

                marioSpeed = marioSpeed + 50'd1;
                if (marioSpeed >= 50'd500000) //500 thousand
                    begin
                        posX <= posX + 10'd1;
                        marioSpeed = 50'd0;
                        movement_counter = movement_counter + 50'd1;
                    end

                // animate sprite
                if (movement_counter >= 50'd15)
                begin 
                    if (!walkAnimation)
                    begin
                        walkAnimation = 1'd1;
                    end
                    else
                    begin
                        walkAnimation = 1'd0;
                    end
                    movement_counter = 50'd0;
                end
            end

            // Jumping and Gravity

            if (isJumping) begin

                // set the correct sprite depending on which direction mario was facing
                if (!marioDirection || btn_right) begin // right facing
                    sprite_pixel_color = jump_right_sprite_color;
                end
                else if (marioDirection || btn_left) begin // left facing
                    sprite_pixel_color = jump_left_sprite_color;
                end

                jumpSpeed = jumpSpeed + 50'd1;
                if (jumpSpeed >= 50'd1000000) //500 thousand
                begin
                    V <= V + G;
                    posY <= posY + V;
                    jumpSpeed = 50'd0;
                    jumpWait = jumpWait + 50'd1;
                end
                // posY <= posY + V;

                if (posY >= GROUND_Y) begin // if on the ground
                    posY <= GROUND_Y;
                    isJumping <= 0;
                    V <= 0;
                    jumpWait <= 0;
                end
            end 
            else if (btn_jump && posY >= GROUND_Y && jumpWait >= 50'd100000) begin
                isJumping <= 10'd1;
                V <= -V_INIT;
                posY <= posY - V_INIT;
            end


            // walking animation control
            if (!walkAnimation && btn_left) begin
                sprite_pixel_color = walk_left_sprite_color;
            end
            else if (!walkAnimation && btn_right) begin
                sprite_pixel_color = walk_right_sprite_color;
            end
            else if (walkAnimation && btn_left) begin
                sprite_pixel_color = jump_left_sprite_color;
            end
            else if (walkAnimation && btn_right) begin
                sprite_pixel_color = jump_right_sprite_color;
            end
        end
    end



// ----------------------------------------- HELLO MADISON I ADDED THIS PART, MUST CHECK IF THIS WORKS OR NOT ----------------------------
    // CHARACTER DEDUCTIONS
    
    // parameter SCREEN_LEFT  = 10'd143;
    // parameter SCREEN_RIGHT = 10'd734 - CHAR_WIDTH;
    // always @(posedge clk or posedge rst) begin
    //     if (rst) begin
    //         posX <= 10'd300;
    //     end else begin
    //         if (posX < SCREEN_LEFT)
    //             posX <= SCREEN_LEFT;
    //         else if (posX > SCREEN_RIGHT)
    //             posX <= SCREEN_RIGHT;
    //     end
    // end
// ---------------------------------------------------------------------------------------------------------------------------

    // Drawing logic
    // wire inBlock = ((hCount >= posX) && (hCount < posX + CHAR_WIDTH)) &&
    //                ((vCount >= posY) && (vCount < posY + CHAR_HEIGHT));

    // wire inGround = (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);

    // // mario sprite
    // // wire [15:0] mario_row_data;
    // wire [4:0] relY = vCount - posY;
    // wire [4:0] relX = hCount - posX;

    // wire [1:0] inSpriteBounds = hCount >= posX && hCount < posX + CHAR_WIDTH &&
    //                     vCount >= posY && vCount < posY + CHAR_HEIGHT;

    // assign sprite_addr = relY * CHAR_WIDTH + relX; // 1D address for pixel color
    // wire [9:0] sprite_addr = inSpriteBounds ? (relY * CHAR_WIDTH + relX) : 0;
    // // holds the 12-bit color hex
    // wire [11:0] sprite_pixel_color;

    // mario_jump_right marioSprite(
    //     .clk(clk),
    //     .addr(sprite_addr),
    //     .pixel_data(sprite_pixel_color)
    // );

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
            rgb_next <= sprite_pixel_color;
        end
        else if (inGround_d)
            rgb_next <= ground_pixel;
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
//  module mario_jump_right (
//     input wire clk,
//     input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
//     output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
// );

//     // 32x32 = 1024 pixels
//     reg [11:0] rom [0:1023];        // 1024 total pixels

//     initial begin
//         $readmemh("C:/Mario/m_hex.mem", rom);
//     end

//     always @(posedge clk) begin
//         pixel_data <= rom[addr];
//     end

//     // initial begin
//     // for (integer i = 0; i < 192; i = i + 1)
//     //     rom[i] = 8'hFF;  // white
//     // end

// endmodule

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