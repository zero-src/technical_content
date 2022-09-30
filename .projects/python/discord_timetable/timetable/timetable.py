from datetime import datetime, timedelta
import discord
from cfg.config import Settings

cfg = Settings()


class Timetable:

    def __init__(self):
        self.color = cfg.embed_color()
        self.__timetable_cache = {}
        self.__timetable_date = datetime.now()

        # Embed default settings
        self.embed = discord.Embed(
            color=self.color,
            title=self.__timetable_date
        )

    # Getter
    def get_cache(self):
        return self.__timetable_cache

    def get_message(self, guild_id):
        return self.__timetable_cache[str(guild_id) + "message"]

    def get_channel(self, guild_id):
        return self.__timetable_cache[str(guild_id) + "channel"]

    # Setter
    def set_channel_location(self, guild_id, channel):
        self.__timetable_cache[str(guild_id) + "channel"] = channel

    def set_message_location(self, guild_id, message):
        self.__timetable_cache[str(guild_id) + "message"] = message

    def datetime_current(self, *, as_str=True):
        self.__timetable_date = datetime.now()

        if as_str:
            return self.__timetable_date.strftime("%d/%m/%Y, %H:%M")
        else:
            return self.__timetable_date

    def datetime_manip(self, days, /, *, as_str=True):
        self.__timetable_date += timedelta(days=days)

        if as_str:
            return self.__timetable_date.strftime("%d/%m/%Y, %H:%M")
        else:
            return self.__timetable_date
