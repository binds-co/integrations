var client = new RestClient("https://app.binds.co/api/seeds");
var request = new RestRequest(Method.POST);
request.AddHeader("content-type", "application/json; charset=UTF-8");
request.AddParameter("application/json; charset=UTF-8", "{\"collector\":\"56a351796b80339c09ff1b76\",\"from\":{\"name\":\"Charlie Parker\",\"email\":\"hello@binds.co\"}}", ParameterType.RequestBody);
IRestResponse response = client.Execute(request);
