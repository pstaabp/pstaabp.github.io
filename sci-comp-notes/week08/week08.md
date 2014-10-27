Week 8 Notes
=============

These are the notes for week 8 of Math 3001. [Return to all notes](../index.html)


Maximum and Minimum Problems
-------

Another huge part of Scientific Computing is those of Extrema problems (maxima and minima).  You may recall just problems from Calculus in which you seek the smallest or largest value of a function (on some subdomain or the entire domain of the function).  We'll start with such problems. 

Find the minimum and maximum of \\(f(x)=7x^{3}+80x^{2}-300x-40\\) on the interval [-10,10].  For this, recall that the maximum and minima occur where the derivative is 0 (or undefined).  So we search on the interval [-10,10] for places where the derivative is 0.  Note: this is just Newton's method for the function \\(f'(x)\\).

There are two such places for the derivative to be zero, about 1.55 and -9.18.  Recall that max and mins can also occur on the endpoints.  So we check the function value at all of these points:

```
f(10)=11960
f(-10)=3960
f(1.55)=-286.73819204421756
f(-9.18) = 4040.4494543269093
```
and so the absolute minimum is -286.74 (about x=1.55) and the absolute max is 11960 at x=10.  

###Extrema Problems of function of more than one variable

I want to point out that most functions that people are interested in finding max or mins of are of more than one variable.  There are techniques to solve these and some of these are addressed in Calculus IV or you can look at a text on Vector Calculus.  Because these are beyond the scope of these problems, I won't address them here. 

Other Extrema Problems
------

There are a lot of extrema problems that don't fit nicely as finding the extrema of a smooth function of some number of variables.  We'll spend the rest of this week looking at those.  

###The Traveling Salesperson Problem

A classic example of a minimum problem is that of the [traveling salesperson problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem) or TSP.  The problem goes like this: a salesperson needs to visit N cities on her route.  There is a known distance between all pairs of the cities.  What is the path she should take to minimize the total distance.  

Although such a problem may seem a bit archaic (at least the name is).  There are many problems that fit into this and in fact, when you use a mapping program to find the shortest route somewhere, at some level, there is a TSP in there somewhere.  

Here's how it goes.  The following in a complete graph in that 1) the graph is a set of nodes and edges that connect the nodes.  2) it is complete because any nodes is connected to all other nodes:

![K5 Complete Graph](http://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Complete_graph_K5.svg/200px-Complete_graph_K5.svg.png)

Let's say that the nodes are labelled from A (top) clockwise to E (upper left).  And then the distances between the nodes (also called the weights) are given by the following table:

|Node 1|Node 2|Distance|
|------|------|--------|
|A     |B     |26      | 
|A     |C     |19      |
|A     |D     |39      |
|A     |E     |23      |
|B     |C     |13      |
|B     |D     |21      |
|B     |E     |42      |
|C     |D     |32      |
|C     |E     |25      |
|D     |E     |17      |

Again, the question is: What path through all of the nodes leads to the smallest total distance.  For example, if we choose A->B->C->D->E->A, the the total distance is 26+13+32+17+23=111

###Exhaustive Solution (or Brute Force)

In this case, there aren't that many total paths.  With 5 nodes, there are a total  24 different paths and that's not too difficult to traverse.  Let's look on how to do this in Julia.

First, let's put the distances into an array:
```
distances=
[0 26 19 39 23; 
26 0 13 21 42; 
19 13 0 32 25; 
39 21 32 0 17; 
23 42 25 17 0]
```

where we've assumed that the distance of a node to itself is 0 and the matrix is symmetric because the distance from A to B is the same as from B to A. 

Next, let's define a function that finds the total distance given a array of node numbers: 

```
function totalDistance(nodes::Array{Int,1})
	#(to be generated in class)
end
```

As a test if we pass the totalDistance the array [1 2 3 4 5], we should get the result 111.  

####Permutations

This is a bit of a side conversation about permutations.  In short to permute objects means to exchange their positions.  Although permutations has a bigger scope and you can see [the Wikipedia page](https://en.wikipedia.org/wiki/Permutation) on Permutations for more information, we are going to concentrate here on permuting the entries in a vector.  Here are the following permutations of (1,2,3): (1,2,3),(1,3,2),(2,1,3),(2,3,1),(3,1,2),(3,2,1).  

There are 6 total here and in general, there are n! permutations of a vector of length n.  Julia has some nice built-in functions to create permutations.  For example to create the 6 permutations listed above:

```
for i=1:6
    println(nthperm([1:3],i))
end
```

we use the `nthperm` command which needs a vector and an integer.  


###Exploring all cases of the TSP
In the case above, there are 5!=120 permutations.  An exhaustive search of the TSP is simply passing every permutation of the vector [1 2 3 4 5] to the totalDistance function.  Then you search for the smallest total distance.  In the case above, we can find all distances via:
```
d=map(k->totalDistance(nthperm([1:5],k)),[1:120])
```

where the vector d now has the total distance for each permultation.  The smallest one is given by:
```
findmin(d)
```

which returns (93,7) meaning that the value 93 is the smallest distance and it occurs in the 7th place.  To determine the path, apply the nthperm function again:
```
nthperm([1:5],7)
```

which results the path [1 3 2 4 5]  or A->C->B->D->E . 

Note: there are other shortest paths, but this is just because you start in different places.  For example D->B->E->E->A is also one. 


###We don't need to search everything

As we showed above, any solution will have each node in it.  We can then always take the first node (A or 1) to be in the first location.  This way we can just seach the first 4! permutations (this will always have A first). 

If we repeat our seach using:
```
d=map(k->totalDistance(nthperm([1:5],k)),[1:24])
```

and then find the smallest value:
```
findmin(d)
```

we get the same result.  




###A larger example

Let's try a larger example.  This is for 10 cities, but can be extended easily.  First, let's just generate a matrix with some nice numbers that have the same properties as the distances from above. 

```
distances=rand(5:20,10,10)
```

will generate a 10 by 10 array of integers in the range 5:20.  To make this symmetric we can add the transpose of the array (the flip over the main diagonal).

```
distances=distances+transpose(distances)
```

and then zero out the main diagonal. 
```
for i=1:10
  distances[i,i]=0
end
```

and if you examine the distances array, you can see it has the properties we want. 

Now, let's compute the totalDistance for all paths:
```
d=map(k->totalDistance(nthperm([1:10],k)),[1:factorial(9)])
```

and if you look for the smallest
```
findmin(d)
```

My results are `(174,3149)`, which means that the smallest distance is 174 and occurs for the 3149th permutation.  You can find the permutation by typing

```
nthperm([1:10],3149)
```

which results in `[1 2 3 8 6 5 4 10 7 9]` which would be the path A->B->C->H->F->E->D->J->G->I . 

Note: since the distances are generated randomly, you will get a different path and minimum distance. 


###This isn't realistic for large n. 

The examples we've done so far are for relatively small n.  If you try the method above for values much larger than 10, you'll notice it takes a long time to solve.  Also each increase to adding another node (or city) will increase the time by a increasing factor.  Note this is an example of a problem that is solved in factorial time (or exponential time)


###Simultated Annealing

A different way to think about this is to start with a path and then tweak it.  Let's try looking at the N=5 case. 

If we start with the case `path=[1:5]` then the total distance is 120. 

Next we will swap two elements at random.  Here's a helpful function to do the swap:
```
function swapEls!(A,i,j)
    tmp=A[i];A[i]=A[j];A[j]=tmp;
end
```

and by typing 
```
swapEls(path,rand(1:5),rand(1:5))
```

and then there will be a new path. 




