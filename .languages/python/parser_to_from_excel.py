from datetime import date
import statistics
import csv

# Заголовки файлов
header = ['date', 'subject', 'mark']

# Названия предметов
subjects = ['английский', 'испанский', 'экономическая теория', 'статистика']

# Все данные из дневника
exam_data = [
    [date(2021, 10, 10), subjects[0], 7],
    [date(2021, 10, 10), subjects[1], 4],
    [date(2021, 10, 11), subjects[2], 14],
    [date(2021, 10, 12), subjects[0], 15],
    [date(2021, 10, 12), subjects[2], 12],
    [date(2021, 10, 12), subjects[1], 15],
    [date(2021, 10, 14), subjects[0], 19],
    [date(2021, 10, 14), subjects[3], 6],
    [date(2021, 10, 16), subjects[0], 4],
    [date(2021, 10, 16), subjects[2], 5],
    [date(2021, 10, 17), subjects[1], 9],
    [date(2021, 10, 17), subjects[0], 1],
    [date(2021, 10, 17), subjects[3], 5],
    [date(2021, 10, 17), subjects[2], 20],
    [date(2021, 10, 20), subjects[0], 4],
    [date(2021, 10, 20), subjects[2], 10],
    [date(2021, 10, 21), subjects[0], 15],
    [date(2021, 10, 21), subjects[3], 10],
    [date(2021, 10, 22), subjects[1], 20],
    [date(2021, 10, 22), subjects[0], 13],
    [date(2021, 10, 22), subjects[3], 13],
    [date(2021, 10, 24), subjects[0], 2],
    [date(2021, 10, 24), subjects[2], 3],
    [date(2021, 10, 25), subjects[1], 18],
    [date(2021, 10, 25), subjects[0], 8],
    [date(2021, 10, 27), subjects[3], 15],
    [date(2021, 10, 27), subjects[1], 15],
    [date(2021, 10, 27), subjects[0], 4],
    [date(2021, 10, 27), subjects[2], 5],
    [date(2021, 10, 30), subjects[3], 10],
    [date(2021, 10, 30), subjects[0], 6],
]


# Процедура создания файлов
def init_files_s(table):

    # Для каждой строки в нашем листе
    for item in table:

        # Открытие файла с именем предмета на перезапись
        with open(item + '.csv', 'w', encoding='UTF-8', newline='') as file:

            # Запись заголовка в начало файла
            _writer = csv.writer(file)
            _writer.writerow(header)


# Процедура заполнения файлов
def file_filling(file_path):

    # Проходим циклом по exam_data
    for val in exam_data:

        # Если имя предмета в exam_data
        # не совпадает с file_path, то
        # мы пропустим итерацию в цикле
        if val[1] != file_path:
            continue

        # Открытие файла с именем предмета на дозапись
        with open(file_path + '.csv', 'a', encoding='UTF-8', newline='') as file:

            # Записываем строку exam_data в файл
            _writer = csv.writer(file)
            _writer.writerow(val)


# Получение датасета из файла
def get_data_from_subject(file_path):
    table = []
    cnt = 0

    # Открываем выбранный файл на чтение
    with open(file_path + '.csv', 'r') as file:
        csv_reader = csv.reader(file)

        # Пропускаем заголовок
        next(csv_reader)

        # Создаём лист из баллов по предмету
        for v in csv_reader:
            table.append(int(v[2]))
            cnt += 1

    # Возвращаем результатов из подпрограммы
    return sum(table), statistics.median(table), max(table), min(table), cnt


######################################################
# Сама программа
######################################################

# Данные по предметам
sum_dataset_by_subject = []
med_dataset_by_subject = []
avr_dataset_by_subject = []
max_dataset_by_subject = []
min_dataset_by_subject = []

# Целевое значение баллов
kPointWall = 90

# 1: Создаём наши файлы
init_files_s(subjects)

# 1.1: Формирование датасетов по предметам
for name in subjects:
    file_filling(name)

print(f'{"id":2} | {"subject":20} | {"total":2} | {"median":4} | {"avr":2} | {"max":2} | {"min":2} |\n')
for idx in range(0, len(subjects)):

    # 1.2: Сумма баллов каждого датасета
    value, median, max_mark, min_mark, count = get_data_from_subject(subjects[idx])
    sum_dataset_by_subject.append(value)

    # 1.3: Медианное значение
    med_dataset_by_subject.append(median)

    # (1.4 / 2): Среднее арифметическое каждого датасета (предмета)
    avr_dataset_by_subject.append(round(value / count))

    # 1.5: Максимум по каждому предмету
    max_dataset_by_subject.append(max_mark)

    # 1.6: Максимум по каждому предмету
    min_dataset_by_subject.append(min_mark)

    # 1.7: Выводим всё в виде таблицы
    print(f'{idx:2} | {subjects[idx]:20} | '
          f'{sum_dataset_by_subject[idx]:5} | {med_dataset_by_subject[idx]:6} | {avr_dataset_by_subject[idx]:3} | '
          f'{max_dataset_by_subject[idx]:3} | {min_dataset_by_subject[idx]:3} | ')

# 3: нужно ли Малышу Карлсону идти в деканат, и просить,
#    чтобы его вернули обратно на платное?
average_points = int(sum(sum_dataset_by_subject) / len(sum_dataset_by_subject))
print(('Никуда идти не надо', 'По идее надо, но зачем??')[average_points <= kPointWall])

