<?php

$request = new HttpRequest();
$request->setUrl('https://app.binds.co/api/seeds');
$request->setMethod(HTTP_METH_POST);

$request->setHeaders(array(
  'content-type' => 'application/json; charset=UTF-8'
));

$request->setBody('{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Charlie Parker",
    "email": "hello@binds.co"
  }
}');

try {
  $response = $request->send();
  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
