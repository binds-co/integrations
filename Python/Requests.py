import requests

url = "https://app.binds.co/api/seeds"

payload = "{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Charlie Parker\",\"email\":\"hello@binds.co\"}}"
headers = {
    'content-type': "application/json; charset=UTF-8"
    }

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)
