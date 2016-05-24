#!/usr/bin/env bash
curl -X POST -H "Content-Type: application/json; charset=UTF-8" -d '{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Ezequias Dinella",
    "email": "ezequias@binds.co"
  }
}' "https://app.binds.co/api/seeds"
