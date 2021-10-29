import requests
import csv

SITE_TO_PARSE = 'https://api.covid19api.com/summary'
PARSE_CATEGORY = 'Global'


def get_data_from_site(link, category):
    response = requests.get(link)

    # Отвечает ли наш сайт на запрос
    if response.status_code != 200:
        return

    # Получаем тело запроса
    json_response = response.json()

    return json_response[category]


# Процедура создания файла
def init_file_s(category):
    # Открытие файла с именем категории на перезапись
    with open(category + '.csv', 'w', encoding='UTF-8', newline='') as file:
        # Запись заголовка в начало файла
        _writer = csv.writer(file)


# Процедура заполнения файлов
def file_filling(category, data):
    # Открытие файла с именем категории на дозапись
    with open(category + '.csv', 'a', encoding='UTF-8', newline='') as file:
        _writer = csv.writer(file)

        # Записываем строки data в файл
        for k in data.items():
            _writer.writerow(k)


if __name__ == '__main__':
    # Получаем данные с сайта
    parsed_data_from_site = get_data_from_site(SITE_TO_PARSE, PARSE_CATEGORY)

    # Создаём файл с нашей категорией
    init_file_s(PARSE_CATEGORY)

    # Заполняем файл полученными данными
    file_filling(PARSE_CATEGORY, parsed_data_from_site)

