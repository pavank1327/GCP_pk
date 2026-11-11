# open the file in read mode
with open("employees.csv", "r") as file:
    # read the entire content
    content = file.read()

# print the content to the console
print("File content:")
print(content)
