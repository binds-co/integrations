report z_test_http_post.

start-of-selection.
  perform start.

* ---
form start.

  data: lv_status type i,
        lv_error_occurred type flag,
        lv_error_msg type string,
        lv_response_body type string.

  perform send_json using
    'https://app.binds.co/api/seeds'
    '{"collector":"56a351796b80339c09ff1b76","from":{"name":"Charlie Parker","email":"hello@binds.co"}}'
    changing lv_status lv_response_body
             lv_error_occurred
             lv_error_msg.

* Show result
  format color col_heading.
  write: / 'Response status:', lv_status.
  if lv_error_occurred = 'X'.
    format color col_negative.
    write: / 'Error occurred:', lv_error_msg.
  endif.
  format color col_normal.
  write: / 'Response:', lv_response_body.

endform.                    "start

form send_json using iv_url type string
                     iv_json_data type string
        changing cv_status type i
                 cv_response_body type string
                 cv_error_occurred type flag
                 cv_error_msg type string.


  data: lo_client type ref to if_http_client.

  clear: cv_error_msg,
         cv_status,
         cv_error_occurred,
         cv_error_msg.

  if iv_url is initial.
* No URL passed
    message e349(sbds) into cv_error_msg.
    cv_error_occurred = 'X'.
    return.
  endif.

  call method cl_http_client=>create_by_url
    exporting
      url                = iv_url
    importing
      client             = lo_client
    exceptions
      argument_not_found = 1
      plugin_not_active  = 2
      internal_error     = 3
      others             = 4.
  if sy-subrc ne 0.
    message id sy-msgid type sy-msgty number sy-msgno
      with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
     into cv_error_msg.
    cv_error_occurred = 'X'.
    return.
  endif.

  lo_client->request->set_cdata( iv_json_data ).
  lo_client->request->set_content_type( 'application/json' ).
  lo_client->request->set_method( 'POST' ).
  call method lo_client->send
    exceptions
      http_communication_failure = 1
      http_invalid_state         = 2
      http_processing_failed     = 3
      others                     = 4.
  if sy-subrc ne 0.
    lo_client->get_last_error( importing message = cv_error_msg ).
    cv_error_occurred = 'X'.
    return.
  endif.

  lo_client->receive( exceptions others = 1 ).
  if sy-subrc ne 0.
    lo_client->get_last_error( importing message = cv_error_msg ).
    cv_error_occurred = 'X'.
    return.
  endif.

  cv_response_body = lo_client->response->get_cdata( ).
  lo_client->response->get_status( importing code = cv_status ).

endform.
