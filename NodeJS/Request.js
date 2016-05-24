var request = require('request');

var token = '56a351796b80339c09ff1b76';
var requestBody = {
  'collector': token,
  'from': {
    'name': 'Ezequias Dinella',
    'email': 'ezequias@binds.co'
  }
};

var options = {
  method: 'POST',
  url: 'https://app.binds.co/api/seeds',
  headers: {'content-type': 'application/json; charset=UTF-8'},
  body: requestBody,
  json: true
};

request(options, function(error, response, body) {
  if (error) {
    throw new Error(error);
  }
  console.log(body);
});
