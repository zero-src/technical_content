FILE_NAME1 = 'file1'
FILE_NAME2 = 'file2'
FILE_EXTENSION = '.txt'

a, b = map(float, input('Get [a, b]: ').split())

inp_file = open(FILE_NAME1 + FILE_EXTENSION, encoding='utf-8')

file_numbers = inp_file.read().split()
print('--- INSIDE FILE ---\n' + '\n'.join(file_numbers) + '\n\n--- NEW DATA ---')
inp_file.close()

out_file = open(FILE_NAME2 + FILE_EXTENSION, 'w', encoding='utf-8')
for num in file_numbers:
    if a < abs(float(num)) < b:
        out_file.write(num + '\n')
        print(num)

out_file.close()