import Foundation

let headers = [
  "content-type": "application/json; charset=UTF-8"
]

let postData = NSData(data: "{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Charlie Parker",
    "email": "hello@binds.co"
  }
}".dataUsingEncoding(NSUTF8StringEncoding)!)

var request = NSMutableURLRequest(URL: NSURL(string: "https://app.binds.co/api/seeds")!,
                                        cachePolicy: .UseProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.HTTPMethod = "POST"
request.allHTTPHeaderFields = headers
request.HTTPBody = postData

let session = NSURLSession.sharedSession()
let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
  if (error != nil) {
    println(error)
  } else {
    let httpResponse = response as? NSHTTPURLResponse
    println(httpResponse)
  }
})

dataTask.resume()
