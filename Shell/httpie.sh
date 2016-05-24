echo '{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Ezequias Dinella",
    "email": "ezequias@binds.co"
  }
}' |  \
  http POST https://app.binds.co/api/seeds \
  content-type:'application/json; charset=UTF-8'
