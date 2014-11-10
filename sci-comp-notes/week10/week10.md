Week 10 Notes
=============

These are the notes for week 10 of Math 3001. [Return to all notes](../index.html)

Data Analysis
---------

The next section of the course discusses Data Analysis and trying to solve problems that involve data. 

###Basic Data Analysis

Let's look at some data that we've generated before.  Consider rolling a die 10 times

```
rolls=rand(1:6,10);
```

and then finding the counts of each roll 
```
theRange,counts=hist(rolls,0.5:6.5)
```

and then plotting the histogram using Gadfly  (you need to load the package)
```
plot(x=[1:6],y=counts/10,Geom.bar)
```

###Some basic stats

Recall that the mean of a data set is the sum divided by the size of the data set. 
```
sum(rolls)/length(rolls)
```

or using the mean command
```
mean(rolls)
```

The median (or middle value) can be found:
```
median(rolls)
```

The standard deviation of a data set is 
\\[\sigma = \sqrt{\frac{\sum (x_i-\bar{x})^{2}} {N}}\\]

where \\(\bar{x}\\) is the mean of the data, and \\(N\\) is the size (length) of the dataset. 

This can be written in Julia as follows:
```
sqrt(sum((rolls-mean(rolls)).^2)/(length(rolls)-1))
```

Alternatively, the standard deviation can be written
\\[\sigma = \sqrt{\frac{\sum x_i^{2} - n (\bar{x})^{2}}{n-1}}\\]

and this can be done in Julia via:
```
sqrt((sum(rolls.^2)-length(rolls)*mean(rolls)^2)/(length(rolls)-1))
```

but of course, there is the built-in command
```
std(rolls)
```


###Exercises

1. Create of vector of the sums of the rolls of 3 dice (you did this in homework).  Use 1,000 rolls. 
2. Create a histogram
3. Find the mean, median and standard deviation (using all three formulations) of the roll sums.  (Does your answer make sense?)








###Getting data from a file

Download the file [Gaz_ua_national.txt](Gaz_ua_national.txt) and save it somewhere that you can access it from Julia. 

###Load in the data

The data is a CSV file with tab delimeters and information about the data is [on the census website](http://www.census.gov/geo/maps-data/data/gazetteer2010.html)  To load it in type:
```
data,header=readdlm("Gaz_ua_national.txt",'\t',String,header=true)
```

