module CharacterController (
    input wire clk,
    input wire rst,
    input wire start_game,
    input wire move_left,
    input wire move_right,
    input wire jump,
    input wire [10:0] GroundY,
    input wire game_over,
    output reg [2:0] state,
    output reg signed [10:0] posX,
    output reg signed [10:0] posY
);

    // FSM States
    typedef enum logic [2:0] {
        STATE_INITIAL = 3'd0,
        STATE_IDLE    = 3'd1,
        STATE_LEFT    = 3'd2,
        STATE_RIGHT   = 3'd3,
        STATE_END     = 3'd4
    } game_state_t;

    game_state_t current_state, next_state;

    // Position and Jump Logic
    reg signed [6:0] V;          // Vertical velocity
    reg isJumping;
    parameter signed GRAVITY = 1;
    parameter signed V_INIT = 7'd17;
    parameter signed MOVE_SPEED = 1;
    parameter signed START_X = 11'd50;

    // FSM: State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= STATE_INITIAL;
        else
            current_state <= next_state;
    end

    // FSM: Transition logic
    always @(*) begin
        next_state = current_state;

        case (current_state)
            STATE_INITIAL:
                if (start_game)
                    next_state = STATE_IDLE;

            STATE_IDLE: 
            begin
                if (game_over)
                    next_state = STATE_END;
                else if (move_left)
                    next_state = STATE_LEFT;
                else if (move_right)
                    next_state = STATE_RIGHT;
            end

            STATE_LEFT: 
            begin
                if (game_over)
                    next_state = STATE_END;
                else if (!move_left)
                    next_state = STATE_IDLE;
            end

            STATE_RIGHT: 
            begin
                if (game_over)
                    next_state = STATE_END;
                else if (!move_right)
                    next_state = STATE_IDLE;
            end

            STATE_END: next_state = STATE_END;
        endcase
    end

    // Movement and Jumping
    always @(posedge clk or posedge rst) begin
        if (rst) 
        begin
            posX <= START_X;
            posY <= GroundY;
            isJumping <= 0;
            V <= 0;
        end 
        else 
        begin
            // Horizontal movement
            case (current_state)
                STATE_LEFT:  posX <= posX - MOVE_SPEED;
                STATE_RIGHT: posX <= posX + MOVE_SPEED;
                default:     posX <= posX;
            endcase

            // Jump logic (separate from FSM)
            if (isJumping) 
            begin
                V <= V + GRAVITY;
                posY <= posY + V;

                if (posY >= GroundY) begin
                    posY <= GroundY;
                    V <= 0;
                    isJumping <= 0;
                end
            end else if (jump && posY >= GroundY) begin
                isJumping <= 1;
                V <= -V_INIT;
                posY <= posY - V_INIT;
            end else begin
                posY <= posY; // Stay on ground
            end
        end
    end

    // Output state for visualization
    always @(*) begin
        state = current_state;
    end

endmodule
