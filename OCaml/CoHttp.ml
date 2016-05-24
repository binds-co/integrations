open Cohttp_lwt_unix
open Cohttp
open Lwt

let uri = Uri.of_string "https://app.binds.co/api/seeds" in
let headers = Header.init ()
  |> fun h -> Header.add h "content-type" "application/json; charset=UTF-8"
in
let body = Cohttp_lwt_body.of_string "{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Ezequias Dinella\",\"email\":\"ezequias@binds.co\"}}" in

Client.call ~headers ~body `POST uri
>>= fun (res, body_stream) ->
  (* Do stuff with the result *)
