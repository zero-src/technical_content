from telebot import TeleBot
from telebot import types
import config

#######################################
bot = TeleBot(config.API_TOKEN)
#######################################


# Now, you can use it in handler.
@bot.message_handler(is_admin=True)
def admin_of_group(message):
    bot.send_message(message.chat.id, 'You are admin of this group!')


markup_menu_items = [
    types.KeyboardButton('shuffle in range'),
    types.KeyboardButton('play in range'),
    types.KeyboardButton('shuffle all'),
    types.KeyboardButton('play all')
]


# Displays chat ID
@bot.message_handler(commands=['chat_id'])
def send_welcome(message):
    bot.send_message(message.chat.id, f'chat_id: {message.chat.id}')


# Menu command
@bot.message_handler(commands=['menu'])
def send_welcome(message):
    markup = types.ReplyKeyboardMarkup(row_width=4, resize_keyboard=True)
    markup.add(markup_menu_items[0], markup_menu_items[1],
               markup_menu_items[2], markup_menu_items[3])

    if message.chat.type == "group":
        bot.send_message(message.chat.id, "group chat")

    if message.chat.type == "supergroup":
        bot.send_message(message.chat.id, "supergroup chat")

    if message.chat.type == "channel":
        bot.send_message(message.chat.id, "channel")

    # Bot opens menu with markup
    if message.chat.type == "private":
        bot.send_message(message.chat.id, "Available functions:", reply_markup=markup)


# Shuffle in range
@bot.message_handler(regexp="shuffle in range")
def handle_message(message):
    if message.chat.type == "private":
        bot.send_message(message.chat.id, "shuffle in range")


# Shuffle all
@bot.message_handler(regexp="shuffle all")
def handle_message(message):
    if message.chat.type == "private":
        bot.send_message(message.chat.id, "shuffle all")


# Play in range
@bot.message_handler(regexp="play in range")
def handle_message(message):
    if message.chat.type == "private":
        bot.send_message(message.chat.id, "play in range")


# Play all
@bot.message_handler(regexp="play all")
def handle_message(message):
    if message.chat.type == "private":
        bot.send_message(message.chat.id, "play all")


bot.infinity_polling()
