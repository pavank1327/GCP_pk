# generate_otp.py
# This script generates a secure 6-digit OTP with an expiry time.

import secrets
import time

def generate_otp_with_expiry(expiry_seconds=60):
    """
    Generate a 6-digit OTP that expires after a given number of seconds.
    
    Args:
        expiry_seconds (int): Time in seconds before the OTP expires.
    
    Returns:
        tuple: (otp, expiry_time)
    """
    # Generate a random 6-digit OTP using the secrets module
    otp = ''.join(str(secrets.randbelow(10)) for _ in range(6))
    
    # Calculate expiry time
    expiry_time = time.time() + expiry_seconds
    
    return otp, expiry_time


# Example usage
if __name__ == "__main__":
    otp, expires = generate_otp_with_expiry()
    print(f"Your OTP is {otp}. It expires at {time.ctime(expires)}")
