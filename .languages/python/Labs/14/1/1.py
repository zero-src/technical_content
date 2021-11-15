FILE_NAME = 'file'

inp_file = open(FILE_NAME + '.txt', encoding='utf-8')

lines = inp_file.readlines()
print('--- INSIDE FILE ---\n' + ''.join(lines) + '\n\n--- NEW DATA ---')

inp_file.close()

out_file = open(FILE_NAME + '.txt', 'w', encoding='utf-8')
new_lines = []

for idx, line in enumerate(lines):
    new_lines.append(' '.join([str(idx + 1), str(len(line)), line]))

    out_file.write(new_lines[idx])
    print(new_lines[idx], end='')

out_file.close()