
// reading from a mem file
// move the mem file into a "ROM" array (for an n-pixel image, mem file should have n rows)
//      each row should contain the information for a single pixel
//      for our mem file, each pixel will be compressed 8-bit RGB formatted
// and every clock, extract the next element from the array and return it
module mario_jump_right (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 32x32 = 1024 pixels
    reg [11:0] rom [0:1023];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/32x32_mario_jump_right.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule

module mario_jump_left (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 32x32 = 1024 pixels
    reg [11:0] rom [0:1023];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/32x32_mario_jump_left.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule

module mario_walk_left (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 32x32 = 1024 pixels
    reg [11:0] rom [0:1023];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/32x32_mario_walk_left.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule

module mario_walk_right (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 32x32 = 1024 pixels
    reg [11:0] rom [0:1023];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/32x32_mario_walk_right.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule

module mario_idle_right (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 32x32 = 1024 pixels
    reg [11:0] rom [0:1023];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/32x32_mario_idle_right.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule

module mario_idle_left (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 32x32 = 1024 pixels
    reg [11:0] rom [0:1023];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/32x32_mario_idle_left.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule