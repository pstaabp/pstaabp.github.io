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
distances5=
[0 26 19 39 23; 
26 0 13 21 42; 
19 13 0 32 25; 
39 21 32 0 17; 
23 42 25 17 0]
```

where we've assumed that the distance of a node to itself is 0 and the matrix is symmetric because the distance from A to B is the same as from B to A. 

Next, let's define a function that finds the total distance given a array of node numbers: 

```
function totalDistance(nodes::Array{Int,1},distArray::Array{Int,2})
    sum=0;
    for i=1:length(nodes)-1
        sum+=distArray[nodes[i],nodes[i+1]];
    end
    sum + distArray[nodes[1],nodes[end]]
end
```

As a test if we pass the totalDistance the array [1 2 3 4 5], we should get the result 111.  

```
totalDistance([1:5],distances5)
```


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
d=map(k->totalDistance(nthperm([1:5],k),distances5),[1:120])
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
d=map(k->totalDistance(nthperm([1:5],k),distances5),[1:24])
```

and then find the smallest value:
```
findmin(d)
```

we get the same result.  




###A larger example

Let's try a larger example.  This is for 10 cities, but can be extended easily.  First, let's just generate a matrix with some nice numbers that have the same properties as the distances from above. 

```
distances10=rand(5:20,10,10)
```

will generate a 10 by 10 array of integers in the range 5:20.  To make this symmetric we can add the transpose of the array (the flip over the main diagonal).

```
distances10=distances10+transpose(distances10)
```

and then zero out the main diagonal. 
```
for i=1:10
  distances10[i,i]=0
end
```

and if you examine the distances10 array, you can see it has the properties we want. 

Now, let's compute the totalDistance for all paths:
```
d=map(k->totalDistance(nthperm([1:10],k),distances10),[1:factorial(9)])
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

A different way to think about this is to start with a path and then tweak it.  Before we get to the details, it is helpful to have the following function that performs a swap of two elements in the array.
```
function swapEls!(A,i,j)
    tmp=A[i];A[i]=A[j];A[j]=tmp;
end
```

Let's try looking at the N=5 case. 

If we start with the case `path=[1:5]` then the total distance is 
```
distance=totalDistance(path,distances5)
```

which is 111. 

Next we will swap two elements at random by typing 
```
swapEls!(path,rand(1:5),rand(1:5)); path
```

and then there will be a new path.  We'll check what the value of the distance is.  If it is smaller than distance (currently 111), then we'll store the path and the distance. 



The resulting function that does all of this is:
```
function findTSP(distances::Array{Int,2},iter::Int)
    local N=size(distances,1)  #number of rows in distances array
    local path=[1:N]
    local minpath=path
    local mindist=totalDist(minpath,distances)
    for i=1:iter
        swapEls!(path,rand(1:N),rand(1:N))
        dist=totalDist(path,distances)
        if dist < mindist
            mindist=dist
            minpath=path
        end
    end
    return (minpath,mindist) 
end
```

and then we can apply this to any distance array.  For example
```
findTSP(distances5,100)
```

results in 
```
([1,4,2,5,3],93)
```

which says that the minimum path is from node 1 to 4 to 2 to 5 to 3 with total distance 93. 


Similarly, with the distances10 array (which was created randomly)
```
findTSP(distances10,1000000)
```

results in 
```
([8,2,10,6,4,9,5,7,3,1],169)
```

which is identical to what we found by going through all paths. 

###A Larger Example

If we type
```
distances20=rand(5:20,20,20)
```

then
```
for i=1:20
    distances20[i,i]=0
end
```

then
```
distances20=distances20+transpose(distances20)
```

will generate a 20 by 20 distance array.  If we run:
```
findTSP(distances20,100000000)
```

generates (for me)
```
([17,20,11,13,16,3,18,15,6,10,9,1,7,2,4,19,14,8,5,12],331)
```

Note that since a distance array of this size is very large to find all paths, so we don't know if this is the minimum path.  Running it a few times will help convince you how close it is. For example, running it again results in
```
([19,1,6,9,16,7,3,13,8,17,15,5,14,12,4,11,18,2,10,20],362)
```

so obviously the path with distance 331 is better than this one. 

## Combinations

(discussion of difference between combination and permuation)

```
A=[1 2 3 4 5]
```

The following will produce all combinations of size 2 out of the items in A

```
collect(combinations(A,2))
```


##Return to minimizing a function

###Steepest Descent

We'll next examine Steepest Descent, a way to find the minimum of a function that generalizes well to functions with more than one variable, however, we'll just do functions of one variable

Let's say that we want to find the minimum of 



###Steepest Descent

We'll next examine Steepest Descent, a way to find the minimum of a function that generalizes well to functions with more than one variable, however, we'll just do functions of one variable

Let's say that we want to find the minimum of \\(f(x)=0.2\sin (5x)+\cos(0.5x) \\) on the interval [-10,10].   We'll start at the right point (for no particular reason) \\(x=10\\).  The plot of the function is

![random dots](plot.png)

The direction of descent is the direction that points in the direction of downhill (either left or right).  Looking at the plot it appears to be left (or in the negative direction).  We can get this information from the derivative.  


If
```
x0=10
```

Then let 
```
x1=x0-0.2df(x0)
```
returns 9.711114366835263 and the derivative at this point is 0.3562184409754395

(a few iterations of this will find a local minimum)


Next, how do we get out of the local min.  (Inject some heat.  )


Randomly pick another point nearby.  A new x0 for some parameter gamma

```
x0=x+gamma*(2*rand()-1)
```
and repeat. 




###A function to do this

```
function findMin(a,b,f,df,c,err,itermax)
    local xmin=localMin(0.5*(a+b),f,df,c,err)
    local fmin=f(xmin)
    local found=false
    local iters=0, xNext,fNext
    while !found
        xNext=localMin(xmin-0.5*rand()*(b-a),df,d2f,0.2,1e-8)
        fNext=f(xNext)
        #println(xNext," ",fNext," ",xmin," ",fmin)
        if a<xNext<b && fNext<fmin
            xmin=xNext
            fmin=fNext
            iters=0
        else
            iters+=1
            if(iters>itermax)
                found=true
            end
        end
    end
    return (xmin,fmin)
end
```

and calling it with 
```
findMin(0,10,f,df,0.2,1e-8,500)
```

returns the same result as above.  







