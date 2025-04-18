import numpy as np
from PIL import Image

# === Config ===
input_mem = 'm_hex.mem'   # your hex .mem file
output_image = 'reconstructed_hex.png'

img_width = 451  # make sure this matches
img_height = 451

# === Load .mem and parse ===
pixels = []

with open(input_mem, 'r') as f:
    for line in f:
        hex_vals = line.strip().split()
        for h in hex_vals:
            if len(h) != 2:
                continue  # skip invalid

            byte = int(h, 16)  # Convert hex to integer

            # Now split into 3-3-2 bits
            r = (byte >> 5) & 0b111  # top 3 bits
            g = (byte >> 2) & 0b111  # next 3 bits
            b = (byte) & 0b11        # bottom 2 bits

            # Scale back to 0–255
            r = int((r / 7) * 255)
            g = int((g / 7) * 255)
            b = int((b / 3) * 255)

            pixels.append([r, g, b])

# === Convert to image ===
pixels_np = np.array(pixels, dtype=np.uint8).reshape((img_height, img_width, 3))
img = Image.fromarray(pixels_np)
img.save(output_image)

print(f"✅ Saved reconstructed image as {output_image}")
