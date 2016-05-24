<?php

$client = new http\Client;
$request = new http\Client\Request;

$body = new http\Message\Body;
$body->append('{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Ezequias Dinella",
    "email": "ezequias@binds.co"
  }
}');

$request->setRequestUrl('https://app.binds.co/api/seeds');
$request->setRequestMethod('POST');
$request->setBody($body);

$request->setHeaders(array(
  'content-type' => 'application/json; charset=UTF-8'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();
