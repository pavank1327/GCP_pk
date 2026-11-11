# display the file content after writing content

#write into file

# open a file in write mode
with open("test_file.txt", "a") as file:  # append format
    # write content into the file
    file.write("Hello Pavan adding new data,\n")
    file.write("This is a sample text written using Python.\n")
    file.write("File writing successful!")

print("Content has been written to test_file.txt")

with open("test_file.txt", "r") as file:
    # read the entire content
    content = file.read()

# print the content to the console
print("File content:")
print(content)