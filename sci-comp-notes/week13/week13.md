Week 13 Notes
=============

These are the notes for week 13 of Math 3001. [Return to all notes](../index.html)

JSON Files
------

The [JSON](http://en.wikipedia.org/wiki/JSON) format is a standard way to store objects.  It stands for JavaScript Object Notation and is a standard format for tranferring data to and from websites.  A JSON format has attribute-value pairs (similar to a hash or dictionary) and the types of data it can store is Number, String, Boolean, Array, Object or null and nesting is allowed.  An example of this is

```
{
	"a_string": "I'm a string",
	"an_array": [1,2,3,4],
	"a_number": 1.234,
	"an_object": {"a": 1, "b": 2, "c": 3},
	"a_boolean": true,
	"a_null_value": null
}
```

or (from the JSON wikipedia site):
```
{
  "firstName": "John",
  "lastName": "Smith",
  "isAlive": true,
  "age": 25,
  "height_cm": 167.6,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021-3100"
  },
  "phoneNumbers": [
    {
      "type": "home",
      "number": "212 555-1234"
    },
    {
      "type": "office",
      "number": "646 555-4567"
    }
  ],
  "children": [],
  "spouse": null
}
```



Note that all of the attributes are strings on the right side of a :.  The values are on the right side. 

There is a [Julia Package for JSON](https://github.com/JuliaLang/JSON.jl) and you can get this by adding the package:
```
Pkg.add("JSON")
```

and via the JSON variable, you have the ability to read and write objects in JSON notation.   As an example, if the object above is stored in [a file](json-example.json), we can load it via the command:
```
person=JSON.parsefile("json-example.json")
```

and you will see the following:
```
Dict{String,Any} with 9 entries:
  "phoneNumbers" => {["number"=>"212 555-1234","type"=>"home"],["number"=>"646 …
  "height_cm"    => 167.6
  "children"     => {}
  "spouse"       => nothing
  "isAlive"      => true
  "lastName"     => "Smith"
  "firstName"    => "John"
  "age"          => 25
  "address"      => ["streetAddress"=>"21 2nd Street","postalCode"=>"10021-3100…
```

Associative Collections(Arrays) or Dictionaries
----

Notice that the result is a `Dict` object.  This is a dictionary and go check out the [julia manual on dictionaries or Associative Collections](http://docs.julialang.org/en/release-0.3/stdlib/base/?highlight=dict#associative-collections).

To get or set a value in a dictionary, you can use the array notation but pass a string.  For example, 
```
person["firstName"]
```

will return `John`.   And if you want to change the value of the "age" attribute, type
```
person["age"]=29
```

This is also an example of a nested object.  For example, the "phoneNumbers" attribute is an array. To see this, type 
```
person["phoneNumbers"]
```

and you will see it is an 1-D array with 2 elements.  To access the first one, you can type
```
person["phoneNumbers"][1]
```

### Exercises

1. How many children does he have?  Access the "children" attribute and find the length of the array.
2. What is the postal code? 
3. Change his height to 190. 
4. Change the street address to "435 Ave. C"


Loading in map data
----

While producing the answers to the shortest route given cities in Massachusetts, I realized that the hardest part of that was getting all of the distances stored as an array.  Seeking for an easier way to do this, I came across the [Google Distance Matrix API](https://developers.google.com/maps/documentation/distancematrix/) which allows one to put in a number of parameters including origin and destination cities and get back the distances between them.  After signing up for the service, you can type in

```
https://maps.googleapis.com/maps/api/distancematrix/json?origins=Boston+MA|Fitchburg+MA&destinations=Springfield+MA|Worcester+MA&units=imperial&key=XXX
```

where the key=XXX must be your key.  The following is returned as a JSON file:
```
{
   "destination_addresses" : [ "Springfield, MA, USA", "Worcester, MA, USA" ],
   "origin_addresses" : [ "Boston, MA, USA", "Fitchburg, MA, USA" ],
   "rows" : [
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "90.0 mi",
                  "value" : 144816
               },
               "duration" : {
                  "text" : "1 hour 28 mins",
                  "value" : 5306
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "43.5 mi",
                  "value" : 69950
               },
               "duration" : {
                  "text" : "52 mins",
                  "value" : 3117
               },
               "status" : "OK"
            }
         ]
      },
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "80.1 mi",
                  "value" : 128904
               },
               "duration" : {
                  "text" : "1 hour 21 mins",
                  "value" : 4860
               },
               "status" : "OK"
            },
            {
               "distance" : {
                  "text" : "27.8 mi",
                  "value" : 44788
               },
               "duration" : {
                  "text" : "32 mins",
                  "value" : 1918
               },
               "status" : "OK"
            }
         ]
      }
   ],
   "status" : "OK"
}
```

and all of the attributes are explain on the distance matrix API website listed above.  The important data is in the "rows" attribute. For each element, there is a "text" and a "value".  Although you could parse the "text", its easier to consider the "value" attribute of each one.  Reading the documenation, you can note that for distance, the "value" is listed in meters, so if you wish to convert to miles, you need to do the conversion, which is multiplying by 0.00062.  


[Here's](distances.json) a link to the file. 




The Chaos Game
------

Consider a triangle (a equilateral one is nice, but not necessary) and label the three corners with the colors Red, Green, Blue. Pick any point inside the triangle (again, not necessary, but nice) as a starting point. Then follow these steps: 
1.  Roll a 3 sided die with the three colors on them (or just pick a color).  
2. Make a new point that is halfway from the old point to the vertex of the triangle with that color.  
3. Goto step 1 and repeat some number of times

What do we get?  




