<?php

// ask Binds.co for your own token
$token = '56a351796b80339c09ff1b76';

// preparing request body
$requestBody = array(
  'collector' => $token,
  'from' => array(
    'name' => 'Charlie Parker',
    'email' => 'hello@binds.co'
  )
);

// creating request context
// (see more at http://www.php.net/manual/en/context.http.php)
$context = stream_context_create(array(
  'http' => array(
    'method' => 'POST',
    'header' => "Content-Type: application/json;charset=UTF-8\r\n",
    'content' => json_encode($requestBody)
  )
));

// sending request
$response = file_get_contents('https://app.binds.co/api/seeds', FALSE, $context);

// checking errors
if($response === FALSE){
  die('Error');
}

// response decoding
$responseData = json_decode($response, TRUE);

// showing response data
print_r($responseData);
