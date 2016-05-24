var http = require('https');

var token = '56a351796b80339c09ff1b76';
var requestBody = {
  'collector': token,
  'from': {
    'name': 'Ezequias Dinella',
    'email': 'ezequias@binds.co'
  }
};

var options = {
  'method': 'POST',
  'hostname': 'app.binds.co',
  'port': null,
  'path': '/api/seeds',
  'headers': {
    'content-type': 'application/json; charset=UTF-8'
  }
};

var req = http.request(options, function(res) {
  var chunks = [];
  res.on('data', function(chunk) {
    chunks.push(chunk);
  });
  res.on('end', function() {
    var body = Buffer.concat(chunks);
    console.log(body.toString());
  });
});

req.write(JSON.stringify(requestBody));
req.end();
