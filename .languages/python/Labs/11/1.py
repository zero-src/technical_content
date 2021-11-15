import collections

input_string = input('string: ')

if __name__ == '__main__':
    string_data = collections.Counter(input_string)
    print('Answer: o ' + ('>', '<=')[string_data.get('о') <= string_data.get('а')] + ' a')