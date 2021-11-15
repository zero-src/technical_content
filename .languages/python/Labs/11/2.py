import re

input_string = input('string: ')

if __name__ == '__main__':
    input_string = re.sub(r'(?is)[а-я]', '*', input_string)
    print(input_string)