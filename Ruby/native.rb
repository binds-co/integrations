require 'uri'
require 'net/http'

url = URI("https://app.binds.co/api/seeds")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json; charset=UTF-8'
request.body = "{\"collector\": \"56a351796b80339c09ff1b76\", \"from\": {\"name\": \"Charlie Parker\", \"email\": \"hello@binds.co\"}}"

response = http.request(request)
puts response.read_body
