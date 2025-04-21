
// reading from a mem file
// move the mem file into a "ROM" array (for an n-pixel image, mem file should have n rows)
//      each row should contain the information for a single pixel
//      for our mem file, each pixel will be compressed 8-bit RGB formatted
// and every clock, extract the next element from the array and return it

module ground_tile (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 24x24 = 576 pixels
    reg [11:0] rom [0:576];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/graphics/tiles/24x24_ground.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule


module platform_tile (
    input wire clk,
    input wire [9:0] addr,        // 10-bit address: 2^10 = 1024
    output reg [11:0] pixel_data   // 8-bit RGB (3-3-2)
);

    // 24x24 = 576 pixels
    reg [11:0] rom [0:576];        // 1024 total pixels

    initial begin
        $readmemh("C:/Mario/graphics/tiles/24x24_platform.mem", rom);
    end

    always @(posedge clk) begin
        pixel_data <= rom[addr];
    end

endmodule