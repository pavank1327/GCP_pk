# generate_barcode.py
# This script generates a barcode image using the python-barcode library.

# Install dependencies before running:
# python -m pip install python-barcode pillow

from barcode import Code128
from barcode.writer import ImageWriter

def create_barcode(data: str, filename: str = "barcode_output"):
    """
    Generate a Code128 barcode and save it as an image.

    Args:
        data (str): The text or number to encode in the barcode.
        filename (str): The name of the output file (without extension).
    """
    # Choose barcode type (Code128 is widely supported)
    barcode_class = Code128

    # Create barcode with ImageWriter to output as PNG
    my_barcode = barcode_class(data, writer=ImageWriter())

    # Save barcode image
    my_barcode.save(filename)
    print(f"Barcode saved as {filename}.png")


# Example usage
if __name__ == "__main__":
    create_barcode("check", "check_barcode")
