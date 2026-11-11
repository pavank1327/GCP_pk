#write into file

# open a file in write mode
with open("test_file.txt", "w") as file:  # this overwrite data : to avaoid overwrite need to use append format
    # write content into the file
    file.write("Hello Pavan adding new data,\n")
    file.write("This is a sample text written using Python.\n")
    file.write("File writing successful!")

print("Content has been written to test_file.txt")