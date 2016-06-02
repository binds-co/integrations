wget --quiet \
  --method POST \
  --header 'content-type: application/json; charset=UTF-8' \
  --body-data '{"collector":"56a351796b80339c09ff1b76","from":{"name":"Charlie Parker","email":"hello@binds.co"}}' \
  --output-document \
  - https://app.binds.co/api/seeds
