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

// ----------------------------------------- LOADING SPRITES -----------------------------------------

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


// ----------------------------------------- CHARACTER MOVEMENT -----------------------------------------
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
                        if (posX > SCREEN_LEFT)
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
                         if ((posX < SCREEN_RIGHT))
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
            jumpWait = jumpWait + 50'd1;

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

// ------------------------------------------PLATFORMS-----------------------------------------------

    reg isPlatformPixel;
    reg [11:0] selected_platform_pixel;
    reg [9:0] platform_sprite_addr;

    
    platform_tile platformSprite (
        .clk(clk),
        .addr(platform_sprite_addr),
        .pixel_data(platform_pixel)
    );

    // Platform definitions
    parameter NUM_PLATFORMS = 3;

    reg [9:0] platform_x[0:NUM_PLATFORMS-1];
    reg [9:0] platform_y[0:NUM_PLATFORMS-1];

    // Platform initialization (inside an `initial` block)
    initial begin
        platform_x[0] = 500; platform_y[0] = 360;
        platform_x[1] = 250; platform_y[1] = 300;
        platform_x[2] = 500; platform_y[2] = 220;
    end

    // Handle platform sprite logic
    always @(*) begin
        isPlatformPixel = 0;
        selected_platform_pixel = 12'hF00; // fallback color
        platform_sprite_addr = 0;

        // Platform 0
        if (hCount >= platform_x[0] && hCount < platform_x[0] + TILE_SIZE &&
            vCount >= platform_y[0] && vCount < platform_y[0] + TILE_SIZE) begin
            isPlatformPixel = 1;
            platform_sprite_addr = (vCount - platform_y[0]) * TILE_SIZE + (hCount - platform_x[0]);
        end
        // Platform 1
        else if (hCount >= platform_x[1] && hCount < platform_x[1] + TILE_SIZE &&
                vCount >= platform_y[1] && vCount < platform_y[1] + TILE_SIZE) begin
            isPlatformPixel = 1;
            platform_sprite_addr = (vCount - platform_y[1]) * TILE_SIZE + (hCount - platform_x[1]);
        end
        // Platform 2
        else if (hCount >= platform_x[2] && hCount < platform_x[2] + TILE_SIZE &&
                vCount >= platform_y[2] && vCount < platform_y[2] + TILE_SIZE) begin
            isPlatformPixel = 1;
            platform_sprite_addr = (vCount - platform_y[2]) * TILE_SIZE + (hCount - platform_x[2]);
        end

        // Only grab sprite pixel if we're inside a platform
        if (isPlatformPixel)
            selected_platform_pixel = platform_pixel;
    end





// ------------------------------------------------------------------------------------------------------------------------------

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
        else if (isPlatformPixel)
            rgb_next <= selected_platform_pixel;
        else
            rgb_next <= BLUE;

        // send RGB output
        rgb <= rgb_next;
    end

endmodule