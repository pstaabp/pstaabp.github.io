Appendix 1: Requesting Webpages in Julia
=======

[Return to all notes](../index.html)

There are many webservices that exist to make requests of other webservers.  One example that we will see later is that of requesting distance information between locations using the Open Street Map services.

To request a webpage in Julia, we will use the `HTTP` package, so add it to your system if you need to.  For some basic http requests, we will use the webserver at [http://httpbin.org](http://httpbin.org)

To get started, do
```
using HTTP
r = HTTP.request("GET", "http://httpbin.org/get")
```

and a request is sent to the webserver and the response is:
```
HTTP.Messages.Response:
"""
HTTP/1.1 200 OK
Connection: keep-alive
Server: gunicorn/19.9.0
Date: Sun, 02 Dec 2018 14:53:29 GMT
Content-Type: application/json
Content-Length: 158
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
Via: 1.1 vegur

{
  "args": {},
  "headers": {
    "Connection": "close",
    "Host": "httpbin.org"
  },
  "origin": "XXX.XXX.XXX.XXX",
  "url": "http://httpbin.org/get"
}
"""
```

although you will get the IP address and the Date that you sent it from.  

The fields that you get from the request is:
* `status`: returns the status code from the server.
* `body`: the response body as an array of `UInt8`.  If you wrap this is in a `String` then you get the string version of the response.
*

for the above example,  
* `r.status` returns 200
* `String(r.body)` returns:
  ```
  "{\n  \"args\": {}, \n  \"headers\": {\n    \"Connection\": \"close\", \n    \"Host\": \"httpbin.org\"\n  }, \n  \"origin\": \"XXX.XXX.XXX.XXX\", \n  \"url\": \"http://httpbin.org/get\"\n}\n"
  ```

  which is a JSON object.   We will parse this below.
* `r.version` returns `v"1.1.0"` which means that this was a HTTP1.1 response
* `r.headers` returns:
  ```
  8-element Array{Pair{SubString{String},SubString{String}},1}:
                       "Connection" => "keep-alive"                   
                           "Server" => "gunicorn/19.9.0"              
                             "Date" => "Sun, 02 Dec 2018 14:53:29 GMT"
                     "Content-Type" => "application/json"             
                   "Content-Length" => "158"                          
      "Access-Control-Allow-Origin" => "*"                            
  "Access-Control-Allow-Credentials" => "true"                         
                               "Via" => "1.1 vegur"
  ```

  as an example.  This is similar to a dictionary if you need to access the elements.
* `r.request` returns
  ```
  HTTP.Messages.Request:
  """
  GET /get HTTP/1.1
  Host: httpbin.org
  Content-Length: 0

  """
  ```

### Parsing the response body

The above example, showed that the response body can return a JSON object.  This is a common response for webservices.  Alternatively, we can return HTML or XML as other common responses.  

If we have a response, we typically parse it use the `JSON` package, so add this to your local system if you haven't and then do `using JSON`.  

Accessing the `body` field of the web response more than once is not allow (I can't find documentation on this or why this is true. ), so you may need to rerun the request and the store the result for processing.
```
r = HTTP.request("GET", "http://httpbin.org/get")
body = string(r.body)
```

which should return the same result.  Now, to parse the result as a JSON string:
```
body_obj = JSON.parse(body)
```

you get
```
Dict{String,Any} with 4 entries:
  "headers" => Dict{String,Any}("Connection"=>"close","Host"=>"httpbin.org")
  "args"    => Dict{String,Any}()
  "url"     => "http://httpbin.org/get"
  "origin"  => "XXX.XXX.XXX.XXX"
```

And in [Chapter 19](ch19.html), we saw how to access the elements of a dictionary as
```
body_obj["url"]
```
which returns `http://httpbin.org/get`

### MBTA alert example

The [Massachusetts Bay Transit Authority (MBTA)](http://mbta.com) run public transit throughout the Boston Area.  They post all transit alerts as a webservice and we can access it with Julia via:

```
req = HTTP.request("GET","https://api-v3.mbta.com/alerts")
```

Then to parse correctly,
```
body = String(req.body)
alerts_dict = JSON.parse(body)
```

all of the alerts are stored in an array in the data
```
alerts = alerts_dict["data"]
```

and for example, to drill down into a the first alert:
```
alerts[1]["attributes"]
```

and when this was run, the following was returned:
```
Dict{String,Any} with 15 entries:
  "active_period"   => Any[Dict{String,Any}("start"=>"2018-12-02T04:30:00-05:00…
  "created_at"      => "2018-11-28T16:45:52-05:00"
  "service_effect"  => "Lowell Line notice"
  "short_header"    => "On weekends, through Dec, Lowell service will be replac…
  "cause"           => "UNKNOWN_CAUSE"
  "updated_at"      => "2018-11-28T16:45:52-05:00"
  "description"     => "Inbound passengers will board a free bus shuttle that w…
  "severity"        => 7
  "url"             => nothing
  "banner"          => nothing
  "informed_entity" => Any[Dict{String,Any}("activities"=>Any["BOARD", "EXIT", …
  "timeframe"       => nothing
  "header"          => "On weekends, through December, Lowell Line service in b…
  "effect"          => "SERVICE_CHANGE"
  "lifecycle"       => "NEW"
```

and for example, a phone app could take advantage of this information and post (in a more elegant fashion all of the relevant information).

If interested, [here](https://api-v3.mbta.com/docs/swagger/index.html) is more information on the API.  

### use `HTTP.jl` to make a simple webserver.

This also has the ability to run a webservice or webserver.  Consider the following:
```
HTTP.listen("127.0.0.1", 8081) do http
  HTTP.setheader(http, "Content-Type" => "text/html")
  write(http, "<h1>Hello!  :) </h1>")
end
```

and if you go to a web browser and type in
```
localhost:8081
```

You should get a webpage that says **Hello! :)**
