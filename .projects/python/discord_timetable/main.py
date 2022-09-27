from bs4 import BeautifulSoup as bs
import requests
import json
import discord
from discord.ext.commands import has_permissions
from datetime import datetime, timedelta
from discord.ext import commands, tasks
import cfg.config

# Default settings
cfg = cfg.config.Settings()
BOT_TOKEN = cfg.bot_token()


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


class Parser:
    def __init__(self):
        self.__timetable_url = 'https://mtkp.eljur.ru/journal-app/week.0'
        self.__auth_url = 'https://mtkp.eljur.ru/ajaxauthorize'

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
            request_status = 'success'

        return session, request_status


# heap of shit-code
intents = discord.Intents.default().all()
client = commands.Bot(intents=intents, command_prefix="::")

Timetable = Timetable()


@tasks.loop(hours=1)
async def update():
    for channel in Timetable.get_cache().keys():
        var = client.get_channel(channel)
        message = await var.fetch_message(Timetable.get_channel(channel))
        print(message)


@client.event
async def on_ready():
    print('logged as {0.user}'.format(client))
    await client.wait_until_ready()

    for guild in client.guilds:
        try:
            client.tree.copy_global_to(guild=guild)
            await client.tree.sync()
        except discord.errors.Forbidden:
            pass

    update.start()


@client.tree.command(name="log_in", description="Receive personal data from e-journal. Login + Password required")
async def visibility_check(interaction: discord.Interaction, login: str, password: str):
    parser = Parser()
    session, status = parser.authorization(login, password)

    await interaction.response.send_message(
        f'`login`**:**`password` -> `{login}`**:**`{password}`\n'
        f'`status` {status}',
        ephemeral=True
    )


@client.tree.command(name="timetable_channel", description="Setup bot in 'X' channel")
@has_permissions(administrator=True)
async def timetable_channel(interaction: discord.Interaction, channel: discord.TextChannel):
    guild_id = interaction.guild_id
    Timetable.embed.title = Timetable.datetime_current()

    message = await channel.send(embed=Timetable.embed)

    Timetable.set_channel_location(guild_id, channel)
    Timetable.set_message_location(guild_id, message)

    await interaction.response.send_message("falco joined server", ephemeral=True)


@client.tree.command(name="today", description="Timetable for today")
async def cur_day(interaction: discord.Interaction):
    guild_id = interaction.guild_id
    Timetable.embed.title = Timetable.datetime_current()

    await Timetable.get_message(guild_id).edit(embed=Timetable.embed)
    await interaction.response.send_message("today", ephemeral=True)


@client.tree.command(name="next_day", description="Timetable for next day")
async def next_day(interaction: discord.Interaction):
    guild_id = interaction.guild_id
    Timetable.embed.title = Timetable.datetime_manip(1)

    await Timetable.get_message(guild_id).edit(embed=Timetable.embed)
    await interaction.response.send_message("next_day", ephemeral=True)


client.run(BOT_TOKEN)
