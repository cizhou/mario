// `timescale 1ns / 1ps

// LATEST VERSION
module vga_bitchange(
    input clk,
    input rst,
    input bright,
    input btn_left,
    input btn_right,
    input btn_jump,
    input [9:0] hCount, vCount,
    input [9:0] map_num,
    output reg [11:0] rgb,
	output reg [15:0] score
);

//----------------------------------------------PARAMETERS----------------------------------------------

    // SCREEN PARAMETERS
    parameter BLACK = 12'b0000_0000_0000;
    parameter WHITE = 12'b1111_1111_1111;
    parameter RED   = 12'b1111_0000_0000;
    parameter GREEN = 12'b0000_1111_0000;
    parameter BLUE = 12'h7AF;

    parameter SCREEN_LEFT  = 10'd143;
    parameter SCREEN_RIGHT = 10'd734;

    parameter TRANSPARENT_COLOR = 12'h000;

    // CHARACTER PARAMETERS
    // Character size
    parameter CHAR_WIDTH = 10'd32;
    parameter CHAR_HEIGHT = 10'd32;

    // Gravity and jump velocity
    parameter G = 1;
    parameter V_INIT = 7'd15;

    // GROUND PARAMETERS
    parameter GROUND_Y = 10'd460; // y-coord of the top of the ground section

    // PLATFORM PARAMETERS
    parameter NUM_PLATFORMS = 6;
    parameter TILE_SIZE = 24; // adjust to match your sprite's tile size

    // COIN PARAMETERS
    parameter NUM_COINS = 4;
    parameter COIN_SIZE = 16;


//------------------------------------------------VARIABLES----------------------------------------------

    // CHARACTER VARIABLES
    // Character position
    reg signed [9:0] posX = 10'd300;
    reg signed [9:0] posY = 10'd400;
    reg signed [6:0] V = 0;
    reg isJumping = 0;

    reg[49:0] marioSpeed;
    reg[49:0] jumpSpeed;
    reg [49:0] jumpWait;
    reg [49:0] movement_counter; // counts how many pixels Mario has moved since last frame switch
    reg [1:0] walkAnimation; // 0 for walk, 1 for jump

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


    // GROUND VARIABLES
    wire inGround = (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);

    // instantiate map tiles
    wire [11:0] ground_pixel;
    // CHANGED
    wire [9:0] ground_sprite_addr = ((vCount - (GROUND_Y + CHAR_HEIGHT)) % TILE_SIZE) * TILE_SIZE + (hCount % TILE_SIZE);


    // PLATFORM VARIABLES
    // instantiate platform tiles
    wire [11:0] platform_pixel;
    reg [9:0] platform_sprite_addr;


    // COIN VARIABLES
    reg [9:0] coin_sprite_addr; // to be calculated right before drawing
    reg [3:0] touchedCoin; // store which coin Mario collided with
    reg [3:0] touchedCoin_d;  // delayed version for next clock
    reg [3:0] touchedCoinIndex;
    
    // coin animation variables
    reg [49:0] coin_anim_counter = 0;
    reg [1:0] coin_frame = 0; // 0 = dark, 1 = mid, 2 = light
    reg [11:0] coin_pixel_color = TRANSPARENT_COLOR; // hold the coin pixel color

    // hold color hex for each coin frame
    wire [11:0] dark_coin_pixel;
    wire [11:0] mid_coin_pixel;
    wire [11:0] light_coin_pixel;


    // GAME VARIABLES
    reg [15:0] score_temp;
    integer i; // for character movement loops

    reg prev_map_num; // Stores the previous value of map_num to detect changes
    reg coin_reset_done; // Flag to track if the coins have been reset for the current map


    // old variables
    // drawing logic variables
    wire inBlock = ((hCount >= posX) && (hCount < posX + CHAR_WIDTH)) &&
                   ((vCount >= posY) && (vCount < posY + CHAR_HEIGHT));

// ----------------------------------------- LOADING SPRITES -----------------------------------------

    ground_tile groundSprite(
        .clk(clk),
        .addr(ground_sprite_addr),
        .pixel_data(ground_pixel)
    );

    platform_tile platformSprite (
        .clk(clk),
        .addr(platform_sprite_addr),
        .pixel_data(platform_pixel)
    );

    dark_coin darkCoinSprite (
        .clk(clk),
        .addr(coin_sprite_addr),
        .pixel_data(dark_coin_pixel)
    );

    mid_coin midCoinSprite (
        .clk(clk),
        .addr(coin_sprite_addr),
        .pixel_data(mid_coin_pixel)
    );

    light_coin lightCoinSprite (
        .clk(clk),
        .addr(coin_sprite_addr),
        .pixel_data(light_coin_pixel)
    );

    // instantiate all Mario sprites
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


// ------------------------------------------GAME LOGIC-----------------------------------------------
    initial begin
        score = 0;  // Initialize score to 0 at the start
    end

// ------------------------------------------PLATFORMS-----------------------------------------------

    // LOADING PLATFORM LOCATIONS
    reg [9:0] platform_x_start[0:NUM_PLATFORMS*2-1];
    reg [9:0] platform_x_end[0:NUM_PLATFORMS*2-1];
    reg [9:0] platform_y[0:NUM_PLATFORMS*2-1];

    // Platform initialization (inside an `initial` block)
    initial begin
        // platforms for map 1
        platform_x_start[0] = 500; platform_x_end[0] = 540; platform_y[0] = 400;
        platform_x_start[1] = 250; platform_x_end[1] = 290; platform_y[1] = 300;
        platform_x_start[2] = 600; platform_x_end[2] = 640; platform_y[2] = 400;
        platform_x_start[3] = 350; platform_x_end[3] = 450; platform_y[3] = 350;
        platform_x_start[4] = SCREEN_LEFT; platform_x_end[4] = 200; platform_y[4] = 250;
        platform_x_start[5] = 400; platform_x_end[5] = 500; platform_y[5] = 250;
        

        // platforms for map 2
        platform_x_start[6] = 600; platform_x_end[6] = 640; platform_y[6] = 400;
        platform_x_start[7] = 400; platform_x_end[7] = 540; platform_y[7] = 340;
        platform_x_start[8] = 540; platform_x_end[8] = 700; platform_y[8] = 240;
        platform_x_start[9] = 430; platform_x_end[9] = 470; platform_y[9] = 200;
        platform_x_start[10] = 250; platform_x_end[10] = 400; platform_y[10] = 200;
        platform_x_start[11] = 250; platform_x_end[11] = 300; platform_y[11] = 300;

    end

    // necessary functions
    function isPlayerInPlatform;
        input [9:0] x;
        input [9:0] y;
        integer i;
        integer start_index;
        begin
            isPlayerInPlatform = 0;
            start_index = 0;

            if (map_num == 1) begin
                start_index = 6;
            end
            

            for (i = 0; i < NUM_PLATFORMS; i = i + 1) begin
                if (((x + CHAR_WIDTH > platform_x_start[i + start_index] && x + CHAR_WIDTH < platform_x_end[i + start_index]) ||
                    (x > platform_x_start[i + start_index] && x < platform_x_end[i + start_index])) &&
                    y + CHAR_HEIGHT > platform_y[i + start_index] &&
                    y < platform_y[i + start_index] + TILE_SIZE) begin
                    isPlayerInPlatform = 1;
                end
            end
        end
    endfunction

    function isHeadbuttingPlatform;
        input [9:0] x;
        input [9:0] y;
        integer i;
        integer start_index;
        begin
            isHeadbuttingPlatform = 0;
            start_index = 0;

            if (map_num == 1) begin
                start_index = 6;
            end

            for (i = 0; i < NUM_PLATFORMS; i = i + 1) begin
                if (
                    // Horizontal: either side of Mario is within the platform bounds
                    ((x + CHAR_WIDTH > platform_x_start[i + start_index] && x + CHAR_WIDTH < platform_x_end[i + start_index]) ||
                    (x > platform_x_start[i + start_index] && x < platform_x_end[i + start_index])) &&
                    // Vertical: Mario's top touching platform's bottom
                    y <= platform_y[i + start_index] + TILE_SIZE &&
                    y > platform_y[i + start_index]
                ) begin
                    isHeadbuttingPlatform = 1;
                end
            end
        end
    endfunction

    function isStandingOnPlatform;
        input [9:0] x;
        input [9:0] y;
        integer i;
        integer start_index;
        begin
            isStandingOnPlatform = 0;
            start_index = 0;

            if (map_num == 1) begin
                start_index = 6;
            end

            for (i = 0; i < NUM_PLATFORMS; i = i + 1) begin
                if (((x + CHAR_WIDTH > platform_x_start[i + start_index] && x + CHAR_WIDTH < platform_x_end[i + start_index]) ||
                    (x > platform_x_start[i + start_index] && x < platform_x_end[i + start_index])) &&
                    y + CHAR_HEIGHT >= platform_y[i + start_index] &&
                    y + CHAR_HEIGHT <= platform_y[i + start_index] + 20 // Add tolerance
                ) begin
                    isStandingOnPlatform = 1;
                end
            end
        end
    endfunction

    function [3:0] getStandingPlatformIndex;
        input [9:0] x;
        input [9:0] y;
        integer i;
        integer start_index;
        begin
            getStandingPlatformIndex = 0;
            start_index = 0;

            if (map_num == 1) begin
                start_index = 6;
            end
            
            for (i = 0; i < NUM_PLATFORMS; i = i + 1) begin
                if (((x + CHAR_WIDTH > platform_x_start[i + start_index] && x + CHAR_WIDTH < platform_x_end[i + start_index]) ||
                    (x > platform_x_start[i + start_index] && x < platform_x_end[i + start_index])) &&
                    y + CHAR_HEIGHT <= platform_y[i + start_index] + 20 // add tolerance
                ) begin
                    getStandingPlatformIndex = i + start_index;
                end
            end
        end
    endfunction

// ------------------------------------------------COINS-------------------------------------------------
    // LOADING COIN LOCATIONS
    reg [9:0] coin_x[0:NUM_COINS*2-1];
    reg [9:0] coin_y[0:NUM_COINS*2-1];

    // CHECKING COIN VISIBILITY
    reg coin_collected [0:NUM_COINS*2-1]; // Only 1 bit per coin

    reg coin_collected0, coin_collected1, coin_collected2, coin_collected3; // local coin collected state
    reg coin_collected4, coin_collected5, coin_collected6, coin_collected7;

    // coin initialization (inside an `initial` block)
    initial begin

        // coins for map 1
        coin_x[0] = 400; coin_y[0] = 200 - COIN_SIZE;
        coin_x[1] = 250; coin_y[1] = 300 - COIN_SIZE;
        coin_x[2] = 600; coin_y[2] = 400 - COIN_SIZE;
        coin_x[3] = 378; coin_y[3] = 350 - COIN_SIZE;

        // coins for map 2
        coin_x[4] = 620; coin_y[4] = 400 - COIN_SIZE;
        coin_x[5] = 280; coin_y[5] = 300 - COIN_SIZE;
        coin_x[6] = 430; coin_y[6] = 200 - COIN_SIZE;
        coin_x[7] = 440; coin_y[7] = 340 - COIN_SIZE;

        // All coins are initially visible (not collected)
        coin_collected0 = 0;
        coin_collected1 = 0;
        coin_collected2 = 0;
        coin_collected3 = 0;
        coin_collected4 = 0;
        coin_collected5 = 0;
        coin_collected6 = 0;
        coin_collected7 = 0;
    end

    function [3:0] getTouchedCoinIndex;
        input [9:0] x;
        input [9:0] y;
        input coin0_collected, coin1_collected, coin2_collected, coin3_collected;
        integer i;
        integer start_index;
        begin
            getTouchedCoinIndex = 4'd15; // No coin touched
            start_index = 0;

            // use the right section of the array based on which map we're in
            if (map_num == 1) begin
                start_index = 4;
            end

            for (i = 0; i < NUM_COINS; i = i + 1) begin
                if (!((x + CHAR_WIDTH <= coin_x[i + start_index]) || (x >= coin_x[i + start_index] + COIN_SIZE) ||
                    (y + CHAR_HEIGHT <= coin_y[i + start_index]) || (y >= coin_y[i + start_index] + COIN_SIZE))) begin

                    case (i + start_index)
                        // map 1
                        0: if (!coin0_collected) getTouchedCoinIndex = 4'd0;
                        1: if (!coin1_collected) getTouchedCoinIndex = 4'd1;
                        2: if (!coin2_collected) getTouchedCoinIndex = 4'd2;
                        3: if (!coin3_collected) getTouchedCoinIndex = 4'd3;

                        // map 2
                        4: if (!coin0_collected) getTouchedCoinIndex = 4'd0;
                        5: if (!coin1_collected) getTouchedCoinIndex = 4'd1;
                        6: if (!coin2_collected) getTouchedCoinIndex = 4'd2;
                        7: if (!coin3_collected) getTouchedCoinIndex = 4'd3;
                    endcase
                end
            end

            //TESTING
            // getTouchedCoinIndex = 0;
        end
    endfunction

    // handle coin animation logic
    always @(posedge clk) begin
        coin_anim_counter = coin_anim_counter + 1;
        
        if (coin_anim_counter >= 50'd10000000) begin // adjust for speed
            coin_anim_counter = 0;
            coin_frame = coin_frame + 1;
            if (coin_frame > 2)
                coin_frame = 0;
        end
    end

    // score and mark the coin as collected
    // integer l;
    
    always @(posedge clk) begin
        score <= score_temp;
    end

// ----------------------------------------- CHARACTER MOVEMENT -----------------------------------------
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            posX <= 10'd300;
            posY <= GROUND_Y;
            isJumping <= 0;
            V <= 0;
            score_temp <= 0;

            // reset coin visibility
            coin_collected0 <= 0;
            coin_collected1 <= 0;
            coin_collected2 <= 0;
            coin_collected3 <= 0;
            coin_collected4 <= 0;
            coin_collected5 <= 0;
            coin_collected6 <= 0;
            coin_collected7 <= 0;
        
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

                // limit the movement propagation or else Mario turns into The Flash
                marioSpeed = marioSpeed + 50'd1;
                    if (marioSpeed >= 50'd500000) //500 thousand
                    begin
                        // restrict Mario's movement if about to go off screen or into a platform
                        if (posX > SCREEN_LEFT && !isPlayerInPlatform(posX-10'd1, posY))
                            posX <= posX - 10'd1;

                        // reset counter
                        marioSpeed = 50'd0;

                        // increase counter for animations
                        movement_counter = movement_counter + 50'd1;
                    end

                // set flag for animating sprite based on number of times Mario's position updated
                if (movement_counter >= 50'd15)
                begin 
                    if (!walkAnimation) begin
                        walkAnimation = 1'd1; // jump sprite
                    end
                    else begin
                        walkAnimation = 1'd0; // walk sprite
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
                         if (posX + CHAR_WIDTH < SCREEN_RIGHT && !isPlayerInPlatform(posX+10'd1, posY))
                           posX <= posX + 10'd1;
                        marioSpeed = 50'd0;
                        movement_counter = movement_counter + 50'd1;
                    end

                // animate sprite
                if (movement_counter >= 50'd15)
                begin 
                    if (!walkAnimation) begin
                        walkAnimation = 1'd1;
                    end
                    else begin
                        walkAnimation = 1'd0;
                    end
                    movement_counter = 50'd0;
                end
            end

            // Jumping and Gravity
            jumpWait = jumpWait + 50'd1;

            // Handle jumping state
            if (isJumping) begin
                jumpSpeed = jumpSpeed + 1;

                // Animate Mario in air
                sprite_pixel_color = marioDirection ? jump_left_sprite_color : jump_right_sprite_color;

                // limit how often Mario jumps if jump button is continuously pressed
                if (jumpSpeed >= 50'd1000000) begin
                    jumpSpeed <= 0;

                    // HEADBUTT - if Mario hits the bottom of a platform
                    if (V < 0 && isHeadbuttingPlatform(posX, posY)) begin
                        V <= 0;
                    end 

                    // LANDING - if Mario hits ground or lands on platform
                    else if (V > 0 && (posY + CHAR_HEIGHT >= GROUND_Y || isStandingOnPlatform(posX, posY))) begin
                        // if landing on the ground
                        if (posY + CHAR_HEIGHT >= GROUND_Y) begin
                            posY <= GROUND_Y;
                            isJumping <= 0;
                            V <= 0;
                        end

                        // if landing on a platform
                        else if (isStandingOnPlatform(posX, posY)) begin
                            posY <= platform_y[getStandingPlatformIndex(posX, posY)] - CHAR_HEIGHT;

                            isJumping <= 0;
                            V <= 0;
                        end
                         
                        isJumping <= 0;
                        V <= 0;

                        // if Mario is on the floor, keep him there
                        if (posY + CHAR_HEIGHT >= GROUND_Y) begin
                            posY <= GROUND_Y;
                        end 

                        // if Mario is on a platform, keep him there
                        else if (isStandingOnPlatform(posX, posY)) begin
                            posY <= platform_y[getStandingPlatformIndex(posX, posY)] - CHAR_HEIGHT;
                        
                        end
                    end 

                    // Still in the air — apply gravity
                    else begin
                        V <= V + G;
                        posY <= posY + V;
                    end
                end
            end 

            // Starting a jump if jump button is pressed and Mario is on ground or platform
            else if (btn_jump && (posY + CHAR_HEIGHT >= GROUND_Y || isStandingOnPlatform(posX, posY))) begin
                isJumping <= 1;
                V <= -V_INIT; // Start going up
            end

            // Begin falling if Mario walks off a platform or the ground
            if (!isJumping && 
                !(posY + CHAR_HEIGHT >= GROUND_Y) &&
                !isStandingOnPlatform(posX, posY)) begin

                isJumping <= 1;
                V <= 1; // Start falling slowly
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


            // Check for which coin Mario has touched
            if (map_num == 0) begin
                touchedCoinIndex = getTouchedCoinIndex(posX, posY, coin_collected0, coin_collected1, coin_collected2, coin_collected3);
            end
            else if (map_num == 1) begin
                touchedCoinIndex = getTouchedCoinIndex(posX, posY, coin_collected4, coin_collected5, coin_collected6, coin_collected7);
            end

            // Update coin collected states and score based on touched coin
            case (touchedCoinIndex)
                2'b00: begin
                    if (!coin_collected0 && map_num == 0) begin
                        coin_collected0 <= 1;  // Mark coin 0 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                    else if (!coin_collected4 && map_num == 1) begin
                        coin_collected4 <= 1;  // Mark coin 0 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                end
                2'b01: begin
                    if (!coin_collected1 && map_num == 0) begin
                        coin_collected1 <= 1;  // Mark coin 1 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                    else if (!coin_collected5 && map_num == 1) begin
                        coin_collected5 <= 1;  // Mark coin 0 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                end
                2'b10: begin
                    if (!coin_collected2 && map_num == 0) begin
                        coin_collected2 <= 1;  // Mark coin 2 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                    else if (!coin_collected6 && map_num == 1) begin
                        coin_collected6 <= 1;  // Mark coin 0 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                end
                2'b11: begin
                    if (!coin_collected3 && map_num == 0) begin
                        coin_collected3 <= 1;  // Mark coin 3 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                    else if (!coin_collected7 && map_num == 1) begin
                        coin_collected7 <= 1;  // Mark coin 0 as collected
                        score_temp <= score_temp + 1;    // Increment score
                    end
                end
            endcase
        end
    end

// -------------------------------------------VGA DISPLAY CONTROL--------------------------------------------

    // Pipeline registers
    reg [11:0] rgb_next;

    reg isMarioPixel_d;
    reg inGround_d;
    reg bright_d;

    reg isPlatformPixel;
    reg isPlatformPixel_d;

    reg isCoinPixel = 0;
    reg isCoinPixel_d;

    // logic to get the pixel addresses of all the platforms
    integer j;
    integer start_index;
    always @(posedge clk) begin
        isPlatformPixel = 0;
        platform_sprite_addr = 0;
        j = 0;
        start_index = 0;

        if (map_num == 1) begin
                start_index = 6;
        end

        for (j = 0; j < NUM_PLATFORMS; j = j + 1) begin
            if (hCount >= platform_x_start[j + start_index] && hCount < platform_x_end[j + start_index] &&
                vCount >= platform_y[j + start_index] && vCount < platform_y[j + start_index] + TILE_SIZE) begin
                isPlatformPixel = 1;
                platform_sprite_addr = ((vCount - platform_y[j + start_index]) % TILE_SIZE) * TILE_SIZE + (hCount - platform_x_start[j + start_index]) % TILE_SIZE;
            end
        end
    end


    // handle coin drawing
    // integer c;
    always @(posedge clk) begin
        isCoinPixel = 0;
        coin_sprite_addr = 0;
        coin_pixel_color = TRANSPARENT_COLOR;

        if (!coin_collected0 && map_num == 0 && 
                hCount >= coin_x[0] && hCount < coin_x[0] + COIN_SIZE &&
                vCount >= coin_y[0] && vCount < coin_y[0] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[0]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[0]) % COIN_SIZE;
        end

        else if (!coin_collected1 && map_num == 0 && 
                hCount >= coin_x[1] && hCount < coin_x[1] + COIN_SIZE &&
                vCount >= coin_y[1] && vCount < coin_y[1] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[1]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[1]) % COIN_SIZE;
        end

        else if (!coin_collected2 && map_num == 0 && 
                hCount >= coin_x[2] && hCount < coin_x[2] + COIN_SIZE &&
                vCount >= coin_y[2] && vCount < coin_y[2] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[2]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[2]) % COIN_SIZE;
        end

        else if (!coin_collected3 && map_num == 0 && 
                hCount >= coin_x[3] && hCount < coin_x[3] + COIN_SIZE &&
                vCount >= coin_y[3] && vCount < coin_y[3] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[3]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[3]) % COIN_SIZE;
        end
        if (!coin_collected4 && map_num == 1 && 
                hCount >= coin_x[4] && hCount < coin_x[4] + COIN_SIZE &&
                vCount >= coin_y[4] && vCount < coin_y[4] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[4]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[4]) % COIN_SIZE;
        end

        else if (!coin_collected5 && map_num == 1 && 
                hCount >= coin_x[5] && hCount < coin_x[5] + COIN_SIZE &&
                vCount >= coin_y[5] && vCount < coin_y[5] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[5]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[5]) % COIN_SIZE;
        end

        else if (!coin_collected6 && map_num == 1 && 
                hCount >= coin_x[6] && hCount < coin_x[6] + COIN_SIZE &&
                vCount >= coin_y[6] && vCount < coin_y[6] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[6]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[6]) % COIN_SIZE;
        end

        else if (!coin_collected7 && map_num == 1 && 
                hCount >= coin_x[7] && hCount < coin_x[7] + COIN_SIZE &&
                vCount >= coin_y[7] && vCount < coin_y[7] + COIN_SIZE) begin

                isCoinPixel = 1;
                coin_sprite_addr = ((vCount - coin_y[7]) % COIN_SIZE) * COIN_SIZE +
                                (hCount - coin_x[7]) % COIN_SIZE;
        end

        // Pick frame based on animation
                case (coin_frame)
                    2'd0: coin_pixel_color = dark_coin_pixel;
                    2'd1: coin_pixel_color = mid_coin_pixel;
                    2'd2: coin_pixel_color = light_coin_pixel;
                endcase
    end


    // Delay signals by 1 clock cycle
    always @(posedge clk) begin
        // Delay pixel condition logic
        isMarioPixel_d <= (hCount >= posX && hCount < posX + CHAR_WIDTH &&
                        vCount >= posY && vCount < posY + CHAR_HEIGHT &&
                        sprite_pixel_color != TRANSPARENT_COLOR);

        isPlatformPixel_d <= isPlatformPixel;

        inGround_d <= (vCount >= GROUND_Y + CHAR_HEIGHT) && (vCount <= 516);

        isCoinPixel_d <= isCoinPixel;

        bright_d <= bright;

        // draw everything as we scan through the screen
        // NOTE: how this works is based on which condition the current pixel fulfills
        // pass the correct pixel to the output
        // mem-file-reading is happening every clock as well and the sprite modules are outputting one pixel every clock
        // which we then pass directly to the output if we're currently in the sprite location
        if (!bright_d)
            rgb_next <= BLACK;
        else if (isMarioPixel_d) begin
            rgb_next <= sprite_pixel_color;
        end
        else if (inGround_d)
            rgb_next <= ground_pixel;
        else if (isPlatformPixel_d)
            rgb_next <= platform_pixel;
        else if (isCoinPixel && coin_pixel_color != TRANSPARENT_COLOR)
            rgb_next <= coin_pixel_color;
        else
            rgb_next <= BLUE;

        // send RGB output
        rgb <= rgb_next;

    end

endmodule
