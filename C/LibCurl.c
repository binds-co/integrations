CURL *hnd = curl_easy_init();

curl_easy_setopt(hnd, CURLOPT_CUSTOMREQUEST, "POST");
curl_easy_setopt(hnd, CURLOPT_URL, "https://app.binds.co/api/seeds");

struct curl_slist *headers = NULL;
headers = curl_slist_append(headers, "content-type: application/json; charset=UTF-8");
curl_easy_setopt(hnd, CURLOPT_HTTPHEADER, headers);

curl_easy_setopt(hnd, CURLOPT_POSTFIELDS, "{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Charlie Parker\",\"email\":\"hello@binds.co\"}}");

CURLcode ret = curl_easy_perform(hnd);
