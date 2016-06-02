import http.client

conn = http.client.HTTPSConnection("app.binds.co")

payload = "{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Charlie Parker\",\"email\":\"hello@binds.co\"}}"

headers = {
    'content-type': "application/json; charset=UTF-8"
    }

conn.request("POST", "/api/seeds", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
