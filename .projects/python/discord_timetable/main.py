import discord
from discord.ext.commands import has_permissions
from datetime import datetime, timedelta
from discord.ext import commands, tasks

BOT_TOKEN = "ODA2NDc2Mzg4NjI1OTQwNTAw.Gm1euU.-953FFWEMMRoUDMyhb6WSgerbebaCvs9K4fkss"

intents = discord.Intents.default().all()
client = commands.Bot(intents=intents, command_prefix="::")

all_active_channels = {}
cache = {}
timetable_message = discord.Embed(color=0xEA80FC)


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
    timetable_message.title = str(datetime.now())

    message = await channel.send(embed=timetable_message)
    all_active_channels[channel.id] = message.id

    cache["channel"] = channel
    cache["message"] = message

    await interaction.response.send_message("falco joined squad", ephemeral=True)


@client.tree.command(name="today", description="Timetable for today")
@has_permissions(administrator=True)
async def cur_day(interaction: discord.Interaction):
    timetable_message.title = str(datetime.now())

    message = await cache["channel"].send(embed=timetable_message)
    all_active_channels[cache["channel"].id] = message.id

    await interaction.response.send_message("updated", ephemeral=True)


@client.tree.command(name="next_day", description="Timetable for next day")
@has_permissions(administrator=True)
async def next_day(interaction: discord.Interaction):
    timetable_message.title = str(datetime.now() + timedelta(days=1))

    message = await cache["channel"].send(embed=timetable_message)
    all_active_channels[cache["channel"].id] = message.id

    await interaction.response.send_message("updated", ephemeral=True)

client.run(BOT_TOKEN)
