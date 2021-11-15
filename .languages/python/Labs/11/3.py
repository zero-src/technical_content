input_string = input('string: ')

if __name__ == '__main__':
    new_string = ' '.join(input_string.split()[0:2])
    print(new_string)