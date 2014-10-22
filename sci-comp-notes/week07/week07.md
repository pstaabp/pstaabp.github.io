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

You should see something like: `1459` as a result.  This is the total number of full house hands.  The fraction can be found by dividing this by 1000000. 



Parallel Computing
-----

[Parallel computing](https://en.wikipedia.org/wiki/Parallel_computing) is a general term about running computer code on multiple computers or processors or processor cores in order to reduce the total time a program runs.  Julia has some nice built-in methods for handling parallel computing in a relatively easy manner.  

Generally the hard part of parallel computing is to handle the way that data is saved/retrieved or passed between processes.  In the case of Monte carlo simultations, we typically don't need to pass data between processes and thus parallel computing is relatively simple as we will see.  

Before we get started with this, let's determine the number of processors/cores in your computer.  In julia, type `CPU_CORES` and will return an integer which is the number of cores in your computer (2, 4 or 8 are common these days).  We will also return to julia running in a command or terminal window (instead of as iJulia).  This is because we need to tell Julia how processors that we can run on.  There are two ways we can do this.

###Open up a terminal window 

(Terminal on the mac/linux, cmd on windows).  If julia is in the path, just type `julia -p 4`, where 4 is the number of cores.  

###Set a Shortcut on windows (thanks to Daniel Beaulac)

1. Open Julia normally, and type CPU_CORES. This determines the number of cores that your processor has. Make a note of this number, and close Julia.
2. Find the shortcut that you use to open Julia. Right-click on it, and select Properties.
3. Click on the Shortcut tab. Find the box called Target.
4. Click in that box, and at the end of the string, add -p n (with n being the number of cores that you found earlier). If the string is enclosed with quotation marks, add -p n after the quotation marks.
5. Click Apply and OK at the bottom of the Properties window.
6. Open Julia with the shortcut that you just modified. Test to see if the arguments worked by doing the count heads exercise in the Week 7 notes. If the first number in RemoteRef() is different in each case, then the arguments have been applied correctly.

There are other ways as well.  

Running some parallel code in Julia
-------


First, let's run the example in the [Julia Manual on parallel computing](http://docs.julialang.org/en/release-0.3/manual/parallel-computing/).  The [count_heads.jl](count_heads.jl) file contains the following:

```
function count_heads(n)
    c::Int = 0
    for i=1:n
        c += randbool()
    end
    c
end
```

is a coin flipping algorithm and returns the number of heads from out of n coin flips.  Note:  although this is a short function, you will need to save it as a file in order to run this in a parallel manner. 

Let's first just run this code in a standard way. If we type:

```
require("count_heads")
```

then
```
count_heads(100000000)
```

you should get a number close to 500000000.  (half of the 100 billion). Also if you open up Activity Monitor on Mac, Task Manager on windows or something similar on linux, you should see that your CPU isn't maxed out but the julia process is.  This means that julia is running as fast as possible on one core.  



Next, we'll run the same code in a parallel manner. 

1. Open julia with the -p 4  flag in a terminal (or use a shortcut)
2. Make sure that you load the count_heads file via
	```
	require("count_heads")
	```

	or put in the absolute path if needed.  

3. Run the following code:	

```
N=100000000;a = @spawn count_heads(N);b = @spawn count_heads(N);c = @spawn count_heads(N);d = @spawn count_heads(N); fetch(a)+fetch(b)+fetch(c)+fetch(d)
```

all on one line.  If you open up Activity Monitor on Mac, Task Manager on windows or something similar on linux, you should see that your CPU is maxed out. 

The @spawn commands will spawn a new process with that function spawned in it.  It returns a reference to the process (not the value of the function).  To get the value of the function called, we use the fetch command.  

How much does this speed things up?
--------

Let's first stay with `N=1000000000`  (1 billion) and then count the number of heads on 4 billion and time it.

```
tic(); count_heads(4*N);toc()
```

Running on my machine I get 15.27 seconds. 

Next, let's time the parallel code:
```
tic();a = @spawn count_heads(N);b = @spawn count_heads(N);c = @spawn count_heads(N);d = @spawn count_heads(N); fetch(a)+fetch(b)+fetch(c)+fetch(d);toc()
```

I got 5.19 seconds (which is about 3 times faster.)


Parallel Computing the Mandelbrot Set
------







