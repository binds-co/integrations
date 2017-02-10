<?php

$token = '56a351796b80339c09ff1b76';
$requestBody = array(
  'collector' => $token,
  'from' => array(
    'name' => 'Charlie Parker',
    'email' => 'hello@binds.co'
  )
);

$curl = curl_init();
$headers = array('content-type: application/json; charset=UTF-8');
curl_setopt($curl, CURLOPT_URL, 'https://app.binds.co/api/seeds');
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_ENCODING, '');
curl_setopt($curl, CURLOPT_MAXREDIRS, 10);
curl_setopt($curl, CURLOPT_TIMEOUT, 30);
curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($requestBody));
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo 'cURL Error #:' . $err;
} else {
  print_r(json_decode($response, TRUE));
}
