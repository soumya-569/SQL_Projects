import requests
import json
import smtplib
from email.message import EmailMessage
import datetime
# def extract_from_api():
#     url = "https://api.weatherstack.com/current"
#     parameter = {
#         "access_key" : "8af72e3da5d87cfe5e61469029ca9b85",
#         "query" : "Contai"
#     }
    
#     response = requests.get(url,params=parameter)

#     print(response.status_code)
#     print(response.headers)

#     data = response.json()

#     with open('weather_data.json','w') as f:
#         json.dump(data,f,indent=2)

# extract_from_api()

with open('weather_data.json','r') as read:
    weather = json.load(read)


def send_weather_email(weather_data):
    location = weather_data['location']['name']
    temp = weather_data['current']['temperature']
    condition = weather_data['current']['weather_descriptions'][0]
    sunrise = weather_data['current']['astro']['sunrise']
    sunset = weather_data['current']['astro']['sunset']
    body = f"Today: {datetime.datetime.today()} \nWeather in {location} :\nTemperature is {temp} and weather condition is {condition} \nSunrise at {sunrise} and sunset at {sunset}"


    sender_email = 'soumya.p569official@gmail.com'
    receiver_email = 'asit0913@gmail.com'
    password = 'ulyt ldag auyx waqz'

    msg = EmailMessage()
    msg['Subject'] = f"Daily Weather Report - {location}"
    msg['From'] = sender_email
    msg['To'] = receiver_email
    msg.set_content(body)

    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
        smtp.login(sender_email,password)
        smtp.send_message(msg)
        print("Email sent successfully")

weather_data = weather
send_weather_email(weather_data)

