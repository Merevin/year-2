col1 = []
col2 = []


with open("authors.txt", 'r') as x:
   for line in x:
       first  = line.split()
       col1.append(first)
       
       
print('Hello world')
print(col1)
print(col2)
x.close()
