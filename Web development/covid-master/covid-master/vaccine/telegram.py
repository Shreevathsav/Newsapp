import requests
text = "Vaccine Availability status now"
link = "https://api.telegram.org/bot1730762309:AAGZZWEoSxYEOiXcjxYVLpBzMii25W8Lefg/sendMessage?chat_id=-1001318977961&text={}".format(text)
requests.get(link)