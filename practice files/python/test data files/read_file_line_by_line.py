# open the file in read mode
with open("employees.csv", "r") as file:
    # read the entire content line by line
	# content = file.read()
	for line in file:
		#print (line);
		print(line.strip()); #used to remove additional spaces while printing line by line

# print the content to the console
print("File content:")
print(content)
