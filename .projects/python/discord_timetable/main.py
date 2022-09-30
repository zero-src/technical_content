from parser.parser import Parser
from discord.ext.commands import has_permissions
from timetable.timetable import Timetable
from discord.ext import commands, tasks
from cfg.config import Settings
import discord

# Default settings
cfg = Settings()

BOT_TOKEN = cfg.bot_token()

# heap of shit-code
Timetable = Timetable()
intents = discord.Intents.default().all()
client = commands.Bot(intents=intents, command_prefix="::")


# @tasks.loop(minutes=1)
# async def update():
#     for channel in Timetable.get_cache().keys():
#         var = client.get_channel(channel)
#         message = await var.fetch_message(Timetable.get_channel(channel))
#         print(channel)
#         print(message)


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

    # update.start()


@client.tree.command(name="login", description="Receive personal data from e-journal. Login + Password required")
async def sign_in(interaction: discord.Interaction, login: str, password: str):
    parser = Parser()
    _, status = parser.authorization(login, password)

    await interaction.response.send_message(
        f'`login`**:**`password` -> `{login}`**:**`{password}`\n'
        f'`status` {status}',
        ephemeral=True
    )


@client.tree.command(name="channel", description="Setup bot in 'X' channel")
@has_permissions(administrator=True)
async def timetable_channel(interaction: discord.Interaction, channel: discord.TextChannel):
    parser = Parser()
    guild_id = interaction.guild_id

    session = parser.authorization("login", "password")
    parser.setup_timetable_embed(session, Timetable.embed)

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
