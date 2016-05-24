<?php

$token = '56a351796b80339c09ff1b76';
$requestBody = array(
  'collector' => $token,
  'from' => array(
    'name' => 'Ezequias Dinella',
    'email' => 'ezequias@binds.co'
  )
);

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://app.binds.co/api/seeds',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS => json_encode($requestBody),
  CURLOPT_HTTPHEADER => array(
    'content-type: application/json; charset=UTF-8'
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo 'cURL Error #:' . $err;
} else {
  print_r(json_decode($response, TRUE));
}
