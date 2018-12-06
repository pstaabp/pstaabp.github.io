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
