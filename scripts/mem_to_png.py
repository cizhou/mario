from PIL import Image

def mem_to_image(mem_path, width, height, output_path="reconstructed.png"):
    # Read memory contents
    with open(mem_path, "r") as f:
        mem_lines = [line.strip() for line in f if line.strip()]

    if len(mem_lines) != width * height:
        raise ValueError(f"Expected {width * height} entries, but found {len(mem_lines)} in .mem file.")

    # Create new RGB image
    img = Image.new("RGB", (width, height))
    pixels = img.load()

    for i, val in enumerate(mem_lines):
        try:
            pixel_val = int(val, 16)
        except ValueError:
            raise ValueError(f"Invalid hex value on line {i+1}: '{val}'")

        # Extract R4G4B4 components
        r4 = (pixel_val >> 8) & 0xF
        g4 = (pixel_val >> 4) & 0xF
        b4 = pixel_val & 0xF

        # Scale to 8-bit (by multiplying by 17)
        r8 = r4 * 17
        g8 = g4 * 17
        b8 = b4 * 17

        x = i % width
        y = i // width
        pixels[x, y] = (r8, g8, b8)

    img.save(output_path)
    print(f"✅ Reconstructed image saved as '{output_path}'.")

# Example usage
mem_to_image("mario.mem", width=32, height=32)
