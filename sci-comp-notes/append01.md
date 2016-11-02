Appendix 1:: The Google Maps Distance Matrix API
========

[Return to all notes](../index.html)


This appendix explains how to use the [Google Maps Distance Matrix API](https://developers.google.com/maps/documentation/distance-matrix/), a service that allows a user to get the distances between multiple locations.  

Getting an API key
-----

You'll need to get a key to use the distance matrix.  Follow the steps listed [here](https://developers.google.com/maps/documentation/distance-matrix/get-api-key).  Note: you may need to sign up for a google developer account, but you only need the standard account.  We aren't getting that many distances.  

Test the API
-----

Type the following in to a browser to test to see if everything is working:
```
https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=Fitchburg,MA&destinations=Boston,MA&key=YOUR_KEY
```

and make sure that you put your key at the end of the


If everything works, you should get:

```
{
   "destination_addresses" : [ "Boston, MA, USA" ],
   "origin_addresses" : [ "Fitchburg, MA 01420, USA" ],
   "rows" : [
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "52.9 mi",
                  "value" : 85137
               },
               "duration" : {
                  "text" : "1 hour 8 mins",
                  "value" : 4102
               },
               "status" : "OK"
            }
         ]
      }
   ],
   "status" : "OK"
}
```


To put in multiple origins and destingtions, you should just put in all of the places separated by a |. The following shows putting in three such cities:

```
https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=Fitchburg,MA|Boston,MA|New%20York,NY&destinations=Fitchburg,MA|Boston,MA|New%20York,NY&key=YOUR_KEY
```

returns

```
{
   "destination_addresses" : [ "Fitchburg, MA 01420, USA", "Boston, MA, USA", "New York, NY, USA" ],
   "origin_addresses" : [ "Fitchburg, MA 01420, USA", "Boston, MA, USA", "New York, NY, USA" ],
   "rows" : [
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "1 ft",
                  "value" : 0
               },
               "duration" : {
                  "text" : "1 min",
                  "value" : 0
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "52.9 mi",
                  "value" : 85137
               },
               "duration" : {
                  "text" : "1 hour 8 mins",
                  "value" : 4102
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "204 mi",
                  "value" : 328495
               },
               "duration" : {
                  "text" : "3 hours 34 mins",
                  "value" : 12864
               },
               "status" : "OK"
            }
         ]
      },
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "47.1 mi",
                  "value" : 75726
               },
               "duration" : {
                  "text" : "1 hour 6 mins",
                  "value" : 3981
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "1 ft",
                  "value" : 0
               },
               "duration" : {
                  "text" : "1 min",
                  "value" : 0
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "215 mi",
                  "value" : 346648
               },
               "duration" : {
                  "text" : "3 hours 43 mins",
                  "value" : 13379
               },
               "status" : "OK"
            }
         ]
      },
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "203 mi",
                  "value" : 326394
               },
               "duration" : {
                  "text" : "3 hours 29 mins",
                  "value" : 12565
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "215 mi",
                  "value" : 346499
               },
               "duration" : {
                  "text" : "3 hours 39 mins",
                  "value" : 13153
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "1 ft",
                  "value" : 0
               },
               "duration" : {
                  "text" : "1 min",
                  "value" : 0
               },
               "status" : "OK"
            }
         ]
      }
   ],
   "status" : "OK"
}
```


Note: the number listed in value for each leg is given in meters.  

The format of result is a JSON file and we will save the file and load it into Julia to store as a matrix.

### using the JSON package to load the data

From [Chapter 15](ch15.html) we can read and parse the JSON files that come from the Google Distance Matrix API:  For example,

```
f=open("distances.json","r")
info=JSON.parse(f)
close(f)
```

and `f` will now be a dictionary.  
