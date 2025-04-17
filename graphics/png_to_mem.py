import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

# === Configuration ===
input_path = 'test_mario.png'
output_path = './m_hex.mem'  # renamed for clarity
write_output_file = True

# === Load image ===
img = Image.open(input_path).convert('RGB')
img_np = np.array(img).astype(np.float32) / 255.0  # normalize to 0–1

# === Quantize to 3-3-2 bits ===
R_q = np.floor(img_np[:, :, 0] * 7).astype(np.uint8)  # 3 bits
G_q = np.floor(img_np[:, :, 1] * 7).astype(np.uint8)  # 3 bits
B_q = np.floor(img_np[:, :, 2] * 3).astype(np.uint8)  # 2 bits

# === Visualization ===
# Convert back to 0–1 for viewing
R_v = R_q / 7.0
G_v = G_q / 7.0
B_v = B_q / 3.0
quantized_img = np.stack([R_v, G_v, B_v], axis=2)

# Show original and quantized side by side
preview = np.concatenate([img_np, quantized_img], axis=1)
plt.imshow(preview)
plt.axis('off')
plt.title("Original (left) vs 8-bit 3-3-2 Quantized (right)")
plt.show()

# === Write .mem file (HEX) ===
if write_output_file:
    print(f"Writing hex .mem file to: {output_path}")
    with open(output_path, 'w') as f:
        for row in range(img_np.shape[0]):
            hex_line = []
            for col in range(img_np.shape[1]):
                r = R_q[row, col]
                g = G_q[row, col]
                b = B_q[row, col]
                pixel_val = (r << 5) | (g << 2) | b  # Combine bits into 1 byte
                hex_val = f'{pixel_val:02X}'  # 2-digit uppercase hex
                hex_line.append(hex_val)
            f.write(' '.join(hex_line) + '\n')
    print("✅ Done writing hex .mem.")
