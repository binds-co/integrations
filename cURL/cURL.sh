#! /bin/bash
curl -X POST -H "Content-Type: application/json; charset=UTF-8" -d '{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Charlie Parker",
    "email": "hello@binds.co"
  }
}' "https://app.binds.co/api/seeds"
