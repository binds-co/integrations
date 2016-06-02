OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json; charset=UTF-8");
RequestBody body = RequestBody.create(mediaType, "{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Charlie Parker\",\"email\":\"hello@binds.co\"}}");
Request request = new Request.Builder()
  .url("https://app.binds.co/api/seeds")
  .post(body)
  .addHeader("content-type", "application/json; charset=UTF-8")
  .build();

Response response = client.newCall(request).execute();
