from PIL import Image
import os

def convert_png_to_mem(png_path, mem_path):
    img = Image.open(png_path).convert("RGB")
    width, height = img.size
    pixels = img.load()

    with open(mem_path, "w") as mem_file:
        for y in range(height):
            for x in range(width):
                r, g, b = pixels[x, y]
                r4 = r >> 4
                g4 = g >> 4
                b4 = b >> 4
                rgb12 = (r4 << 8) | (g4 << 4) | b4
                mem_file.write(f"{rgb12:03X}\n")

    print(f"✅ Successfully wrote {width * height} pixels to '{mem_path}'")

if __name__ == "__main__":
    # Using relative path to reach ../graphics/
    png_path = os.path.join("..", "graphics", "16x16_coin", "16x16_coin_yellow.png")
    mem_path = os.path.join("..", "graphics", "16x16_coin", "16x16_coin_yellow.mem")

    if not os.path.exists(png_path):
        print(f"❌ PNG file not found: {png_path}")
    else:
        convert_png_to_mem(png_path, mem_path)
