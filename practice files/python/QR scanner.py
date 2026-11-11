# QR scanner
# generate_qr.py
# This script generates a QR Code using the qrcode library.

# Step 1: Install required library before running:
# python -m pip install qrcode[pil]

import qrcode

def create_qr(data: str, filename: str = "qr_output.png"):
    """
    Generate a QR code image from the given data.

    Args:
        data (str): The text or URL to encode in the QR code.
        filename (str): The name of the output image file.
    """
    # Step 2: Create QR Code object
    qr = qrcode.QRCode(
        version=1,  # smallest version (1–40)
        error_correction=qrcode.constants.ERROR_CORRECT_H,  # high error correction
        box_size=10,  # size of each box
        border=4,  # thickness of border
    )

    # Step 3: Add data and make QR
    qr.add_data(data)
    qr.make(fit=True)

    # Step 4: Generate image
    img = qr.make_image(fill_color="black", back_color="white")

    # Step 5: Save the QR code image
    img.save(filename)
    print(f"✅ QR Code generated and saved as {filename}")

# Example usage
if __name__ == "__main__":
    create_qr("https://www.linkedin.com/in/kumar/", "kumar_linkedin_QR.png")