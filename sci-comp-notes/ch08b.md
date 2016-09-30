Chapter 7: Plotting Data and Functions
========

[Return to all notes](index.html)

Plotting is crucial to understanding functions and visualizing data.  There are many ways to do some plots using various packages.  We will investigate two in this chapter.  

### The Gadfly Package

#### Plotting Functions

You can plot a function with Gadfly with the `plot` command.  For example,
```
plot(x->x^2,-2,2)
```

produces the following plot:

![Plot of \\(y=x^2\\)](../images/ch07/plot1.png)
