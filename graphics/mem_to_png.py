import numpy as np
from PIL import Image

# === Config ===
input_mem = 'big_mario.mem'
output_image = 'reconstructed.png'

# Image size must match original!
img_width = 451  # ← CHANGE THIS to your original image width
img_height = 451  # ← And this to the height

# === Load .mem and parse ===
pixels = []

with open(input_mem, 'r') as f:
    for line in f:
        bits = line.strip().split()
        for b in bits:
            if len(b) != 8:
                continue  # skip invalid lines
            r = int(b[0:3], 2)
            g = int(b[3:6], 2)
            b = int(b[6:8], 2)

            # Scale back to 0–255 range
            r = int((r / 7) * 255)
            g = int((g / 7) * 255)
            b = int((b / 3) * 255)

            pixels.append([r, g, b])

# Convert to image
pixels_np = np.array(pixels, dtype=np.uint8).reshape((img_height, img_width, 3))
img = Image.fromarray(pixels_np)
img.save(output_image)

print(f"✅ Saved reconstructed image as {output_image}")
