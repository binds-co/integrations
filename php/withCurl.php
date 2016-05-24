<?php

// ask Binds.co for your own token
$token = '56a351796b80339c09ff1b76';

// preparing request body
$requestBody = array(
  'collector' => $token,
  'from' => array(
    'name' => 'Ezequias Dinella',
    'email' => 'ezequias@binds.co'
  )
);

// preparing cURL
$ch = curl_init('https://app.binds.co/api/seeds');
curl_setopt_array($ch, array(
  CURLOPT_POST => TRUE,
  CURLOPT_RETURNTRANSFER => TRUE,
  CURLOPT_HTTPHEADER => array('Content-Type: application/json;charset=UTF-8'),
  CURLOPT_POSTFIELDS => json_encode($requestBody)
));

// sending request
$response = curl_exec($ch);

// checking any errors
if($response === FALSE){
  die(curl_error($ch));
}

// response decoding
$responseData = json_decode($response, TRUE);

// showing response data
print_r($responseData);
