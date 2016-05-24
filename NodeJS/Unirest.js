var unirest = require('unirest');

var token = '56a351796b80339c09ff1b76';
var requestBody = {
  'collector': token,
  'from': {
    'name': 'Ezequias Dinella',
    'email': 'ezequias@binds.co'
  }
};

var req = unirest('POST', 'https://app.binds.co/api/seeds');

req.headers({'content-type': 'application/json; charset=UTF-8'});
req.send(JSON.stringify(requestBody));

req.end(function(res) {
  if (res.error) {
    throw new Error(res.error);
  }
  console.log(res.body);
});
