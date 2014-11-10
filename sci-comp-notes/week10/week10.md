Week 10 Notes
=============

These are the notes for week 10 of Math 3001. [Return to all notes](../index.html)

Data Analysis
---------

The next section of the course discusses Data Analysis and trying to solve problems that involve data. 


###Getting data from a file

Download the file [Gaz_ua_national.txt](Gaz_ua_national.txt) and save it somewhere that you can access it from Julia. 

###Load in the data

The data is a CSV file with tab delimeters and information about the data is [on the census website](http://www.census.gov/geo/maps-data/data/gazetteer2010.html)  To load it in type:
```
data,header=readdlm("Gaz_ua_national.txt",'\t',String,header=true)
```

