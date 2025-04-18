from PIL import Image

def convert_png_to_mem(png_path, mem_path):
    img = Image.open(png_path).convert("RGB")
    width, height = img.size

    pixels = img.load()

    with open(mem_path, "w") as mem_file:
        for y in range(height):
            for x in range(width):
                r, g, b = pixels[x, y]

                # Convert from 8-bit per channel to 4-bit (0-15)
                r4 = r >> 4
                g4 = g >> 4
                b4 = b >> 4

                # Combine into 12-bit RGB (R4G4B4)
                rgb12 = (r4 << 8) | (g4 << 4) | b4

                # Write as 3-digit hex
                mem_file.write(f"{rgb12:03X}\n")

    print(f"Successfully wrote {width * height} entries to {mem_path}")

# Example usage:
convert_png_to_mem(" C:\Users\amsin\Desktop\mario\graphics\24x24_ground.png", " C:\Users\amsin\Desktop\mario\graphics\24x24_ground.mem")
