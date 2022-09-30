from bs4 import BeautifulSoup as bs
import requests
import json


class Parser:
    def __init__(self):
        self.__timetable_url = cfg.timetable_url()
        self.__auth_url = cfg.auth_url()

    def authorization(self, username: str, password: str):
        session = requests.Session()

        payload = {
            'username': username,
            'password': password
        }

        res = session.post(self.__auth_url, json=payload)

        try:
            request_status = json.loads(res.content)["errors"][0]["text"]
        except IndexError:
            request_status = '**`success`**'

        return session, request_status

    def setup_timetable_embed(self, session, embed):
        page_session = session.get(self.__timetable_url)
        soup = bs(page_session.content, "html.parser")
        embed.title = soup.find("span", class_="navigation-tabs-label").get_text().strip()

        timetable = soup.find_all("div", class_=cfg.site_classes()["timetable"])

        for current_day in timetable:
            try:
                day_title = current_day.find(class_=cfg.site_classes()["day_title"]).get_text().strip()
                all_lessons = current_day.find_all("div", class_=cfg.site_classes()["lesson"])

                if current_day.find(class_=cfg.site_classes()["empty"]):
                    lessons_as_text = current_day.find(class_=cfg.site_classes()["empty"]).get_text().strip() + '\n'
                else:
                    lessons_as_text = ""

                for lesson in all_lessons:
                    lesson_id = lesson.find(class_=cfg.site_classes()["lesson_id"]).get_text().strip()
                    lesson_name = lesson.find(class_=cfg.site_classes()["lesson_name"]).get_text().strip()
                    lesson_time = lesson.find(class_=cfg.site_classes()["lesson_time"]).get_text().strip()
                    lessons_as_text += f'> `{lesson_time}`\n> {lesson_id[:1]}: {lesson_name}\n'

                embed.add_field(
                    name=day_title,
                    value=lessons_as_text,
                    inline=False
                )

            except AttributeError:
                pass
