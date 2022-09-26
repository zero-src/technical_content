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

    def channel_location(self, channel):
        self.__timetable_cache["channel"] = channel

    def get_channel(self):
        return self.__timetable_cache["channel"]

    def message_location(self, message):
        self.__timetable_cache["message"] = message

    def get_message(self):
        return self.__timetable_cache["message"]

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


# heap of shit-code
intents = discord.Intents.default().all()
client = commands.Bot(intents=intents, command_prefix="::")

all_active_channels = {}
Timetable = Timetable()


@tasks.loop(hours=1)
async def update():
    # TODO: update func
    for channel in all_active_channels.keys():
        var = client.get_channel(channel)
        message = await var.fetch_message(all_active_channels[channel])
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


@client.tree.command(name="timetable_channel", description="Setup bot in 'X' channel")
@has_permissions(administrator=True)
async def timetable_channel(interaction: discord.Interaction, channel: discord.TextChannel):
    Timetable.embed.title = Timetable.datetime_current()

    message = await channel.send(embed=Timetable.embed)
    all_active_channels[channel.id] = message.id

    Timetable.channel_location(channel)
    Timetable.message_location(message)

    await interaction.response.send_message("falco joined squad", ephemeral=True)


@client.tree.command(name="today", description="Timetable for today")
async def cur_day(interaction: discord.Interaction):
    Timetable.embed.title = Timetable.datetime_current()

    await Timetable.get_message().edit(embed=Timetable.embed)
    await interaction.response.send_message("today", ephemeral=True)


@client.tree.command(name="next_day", description="Timetable for next day")
async def next_day(interaction: discord.Interaction):
    Timetable.embed.title = Timetable.datetime_manip(1)

    await Timetable.get_message().edit(embed=Timetable.embed)
    await interaction.response.send_message("next_day", ephemeral=True)


client.run(BOT_TOKEN)
