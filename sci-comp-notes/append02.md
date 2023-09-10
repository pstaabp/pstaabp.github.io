Appendix 2: MapQuest API
========

[Return to all notes](../index.html)


We are going to use [MapQuest API](https://developer.mapquest.com/) to pull information about traveling between cities.  Before we do anything, we have to sign up for an account which allows us to access the webservice.

Go to the [MapQuest API](https://developer.mapquest.com/) and click the get your Free API key button and signup for the service.  Put "Fitchburg State University" in for the Company.  Once you are signed up, if you go to the [MapQuest keys website](https://developer.mapquest.com/user/me/apps), this should have the key to access the maps.  There is a line that says "Consumer Key" which is a long string, but that's what you will need.

Once you have your key, we're ready to roll.

## Get the directions (and distance) between two points

Let's get the directions and distance from Fitchburg, MA to Boston.  This can be done with the following command:
```
using HTTP, JSON
```

needs to be done first.

```
req= HTTP.request("GET","http://open.mapquestapi.com/directions/v2/optimizedroute?key=XXX&from=Fitchburg,MA&to=Boston,MA")
```

where the `XXX` in the key, needs to be your key above.  When I do this, I get a response that is quite lengthy, however,
```
response = JSON.parse(String(req.body))
```

returns a dictionary with two entries, `response` and `info`.  We can explore a bit deeper here:
```
response["route"]
```

returns
```
Dict{String,Any} with 23 entries:
  "hasCountryCross"      => false
  "legs"                 => Any[Dict{String,Any}("hasCountryCross"=>false,"road…
  "hasUnpaved"           => false
  "time"                 => 3770
  "formattedTime"        => "01:02:50"
  "hasTimedRestriction"  => false
  "locations"            => Any[Dict{String,Any}("latLng"=>Dict{String,Any}("la…
  "distance"             => 47.345
  "boundingBox"          => Dict{String,Any}("ul"=>Dict{String,Any}("lat"=>42.5…
  "hasBridge"            => false
  "hasTollRoad"          => false
  "locationSequence"     => Any[0, 1]
  "computedWaypoints"    => Any[]
  "hasAccessRestriction" => false
  "hasFerry"             => false
  "realTime"             => -1
  "options"              => Dict{String,Any}("doReverseGeocode"=>true,"routeTyp…
  "routeError"           => Dict{String,Any}("errorCode"=>-400,"message"=>"")
  "sessionId"            => "5c08979a-03ad-4ee4-02b4-236b-0af5f91f9cfa"
  "fuelUsed"             => 1.82
  "hasSeasonalClosure"   => false
  "hasTunnel"            => true
  "hasHighway"           => true
```  


and the information that we are looking for is in the distance element which is 47.345 (given in miles).


The MapQuest API also allows to find distances between multiple locations.  Let's say that we want to find the distance matrix of the following cities in Massachusetts: Fitchburg, Lowell, Worcester, Springfield, Greenfield.  We create a Dictionary of the form:
```
towns = Dict("locations"=>["Fitchburg, MA", "Lowell, MA",  "Worcester, MA", "Springfield, MA",  "Greenfield, MA"],
"options"=>Dict("allToAll"=>true))
```

where the second element means that we want the distances between all towns.  

In order to send this information, we need to encode it using JSON.
```
towns_json = JSON.json(towns)
```

and you will get a JSON-stringified version of the dictionary above.  Then we make a POST request to mapquest:
```
resp = HTTP.request("POST","http://www.mapquestapi.com/directions/v2/routematrix?key=XXX",[],ex_json)
```

where again, you need to replace XXX with your mapquest key.  You should get a OK status from the server and then parsing the result:
```
body = JSON.parse(String(resp.body))
```

you will see:
```
"locations" => Any[Dict{String,Any}("latLng"=>Dict{String,Any}("lat"=>42.5808…
  "distance"  => Any[Any[0, 32.395, 26.318, 78.475, 50.174], Any[31.481, 0, 41.…
  "time"      => Any[Any[0, 2306, 1843, 4928, 3833], Any[2211, 0, 2540, 5625, 5…
  "allToAll"  => true
  "info"      => Dict{String,Any}("messages"=>Any[],"statuscode"=>0,"copyright"…
  "manyToOne" => false
```

and the information is stored in the distance element:
```
A=body["distance"]
```
returns
```
5-element Array{Any,1}:
 Any[0, 32.395, 26.318, 78.475, 50.174]
 Any[31.481, 0, 41.33, 93.486, 78.709]
 Any[26.394, 42.312, 0, 52.274, 85.072]
 Any[77.918, 93.836, 51.882, 0, 38.93]
 Any[49.534, 79.207, 85.089, 39.174, 0]
```

and this is an array of arrays, but we need 2D array.  There are a number of ways to do this including:
```
collect(transpose(reshape(collect(Iterators.flatten(A)),(5,5))))
```

which returns
```
5×5 Array{Real,2}:
  0      32.395  26.318  78.475  50.174
 31.481   0      41.33   93.486  78.709
 26.394  42.312   0      52.274  85.072
 77.918  93.836  51.882   0      38.93
 49.534  79.207  85.089  39.174   0   
```
and we can now use this.  
