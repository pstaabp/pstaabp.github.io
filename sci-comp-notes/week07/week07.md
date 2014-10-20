Week 7 Notes
=============

These are the notes for week 7 of Math 3001. [Return to all notes](../index.html)

Recap of last week
-----

Recall that last week we covered the basics of Monte Carlo simulations with rolling dice and poker hands. All of the important results I put into the file [cards.jl](cards.jl).  Just to test this, download the file, put it in a directory you can see in Julia and run the following:

```
require("cards.jl")
testHand(1000000,isFullHouse)
```

Parallel Computing
-----

(General Discussion of Parallel Computing)


[Link to count_heads.jl](count_heads.jl)

```
require("count_heads")

a = @spawn count_heads(100000000)
b = @spawn count_heads(100000000)
c = @spawn count_heads(100000000)
d = @spawn count_heads(100000000)

fetch(a)+fetch(b)+fetch(c)+fetch(d)
```



