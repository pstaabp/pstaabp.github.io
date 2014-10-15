Week 5/6 Notes
=============

These are the notes for weeks 5 and 6 of Math 3001. [Return to all notes](../index.html)

Monte Carlo Simulations
-------

One big part of scientific computation is the subject of Monte Carlo simulations in which random numbers are used to model some situation.  We'll spend the next part of this course covering this subject.  


Probability
---------

To fully understand how to use random numbers and how Monte Carlo simulations work, we need some basic probability.  When understanding probability there are two types continuous and discrete, which for what we need will come down to using floating point or integers. 

###Discrete Probability

We'll first discuss discrete probability.  A _discrete probability distribution_ is a finite set (often will be a subset of integers.)  For example, let's use the set

\\[A=\{1,2,3,4,5,6\}\\]

and an event, \\(X\\) is subset of these numbers.  For example, let \\(X=\{1\}\\), then the probability that this event occurs in the ratio of the number of elements in each set or
\\[P(X)=\frac{N(X)}{N(A)}\\]

In this case, \\(P(X)=1/6\\) and that means that the probability that the number 1 comes up is 1/6.  Think about this in the case of rolling a die.  This says that the probability that 1 comes up is 1/6.  

###Continuous Probability

Another type of probability distribution is called a continuous distribution and in this case we'll only consider a type of continuous probability distribution called a uniform distribution. 

Let's consider a set \\(A=\{x \; | \; 0 \leq x \leq 1\}\\) or all real numbers between 0 and 1. Events are still subsets of the set \\(A\\), however the probability that events occur is the fraction of the set.  

For example, if \\(X=\{x \; | \; 1/3 \leq x \leq 1/2\}\\), then \\(P(X)\\) is the fraction
\\[P(X) = \frac{\frac{1}{2}-\frac{1}{3}}{1-0}=\frac{1}{6}\\]

Pseudo Random Number Generator
----------------

[The Wikipedia Pseudo-random Number Generator page](https://en.wikipedia.org/wiki/Pseudorandom_number_generator) gives an overview of the subject and a lot of technical details.  In short, a truly random number on a computer is very difficult to generate and generally not necessary because a pseudorandom number is sufficient.  I also won't try to explain this in general term since you'd need a significant mathematical background. 

A pseudo-random number generator is a function that produces a sequence of numbers that act like random numbers.  Let's examine what this means in terms of the discrete probability with set \\(A=\{1,2,3,4,5,6\}\\).  

If a pseudo-random number generator produces a sequence from this set then the sequence should have the following property:

* If the event \\(X=\{i\}\\) for any \\(i\\) between 1 and 6, then \\(P(X)\approx 1/6\\).  And by approximately, as the sequence gets larger, the approximation becomes closer to 1/6.  

Is this enough?  No, the sequence
\\[\{1,2,3,4,5,6,1,2,3,4,5,6,\ldots\}\\]

satisfies the above property, but I don't think anyone would consider this random.  Another property would be:

* If we know the sequence \\(\{a_1,a_2,a_3,\ldots,a_n\}\\) then we can't predict the next number \\(a_{n+1}\\).  

This is obviously violated in the sequence above.  

A little more technical definition of a sequence of pseudo-random numbers Let \\((a_1,a_2,a_3, \ldots, \\) be a random sequence.  Typically we mean the following properties need to hold:

1. any number in the range 1 to 6 is equally likely to occur. 
2. Take N random numbers and let \\(s_n\\) be the number of times the number \\(n\\) occurs.  	The fraction \\(s_n/N\\) should go to 1/6 in the limit as \\( n\rightarrow \infty \\).
3. Knowing the sequence \\(s_1, s_2, \ldots, s_k\\) does not allow us to predict \\(s_{k+1}\\) 

If instead we use floating point numbers, there are a few different properties.  Assume that the floating point number is in the range \\( 0 \lt x \lt 1 \\).  Then the  sequence   \\((a_1,a_2,a_3, \ldots, \\) is random if 

3. Let \\(s_{[c,d]}(a_1,a_2,a_3, \ldots) \\) be the total of the numbers that satisfy \\(c \lt a_k \lt d\\).  Then as the number of random numbers approach infinity \\(s_{[c,d]}=d-c\\)


Using Julia to simulate the rolling of a die
------

First, the main commands that are built-in to Julia are listed in the [Julia Manual for Random Numbers](http://docs.julialang.org/en/release-0.3/stdlib/base/?highlight=findfirst#random-numbers).  We can generate 100 random numbers between 1 and 6 using

```
S=rand(1:6,100)
```

and notice that if you rerun the command, you'll get a different sequence of random numbers.  We can check that this is doing what we expect by checking the probabilty that we get a 1 (or any other number).

To check the count of the number 1 that appears, try

```
count(a->a==1,S)
```

###Exercise

Convert this to a probability.  Is it close to what you expect? Try changing the number of random numbers used to larger numbers.  Does your answer get closer to what you expect?  


Floating Point random numbers
-------

Let's look a floating point random numbers between 0 and 1.  To generate a sequence (array) of such numbers, type
```
S=rand(100)
```

and we can check the number of values less than 0.1 with the command:
```
count(a->a<0.1,S)
```

and if we want the number of values between 0.4 and 0.7 then type
```
count(a->0.4<a<0.7,S)
```

###Exercise

Change the number of random numbers used to much larger set and return the above commands.  What are the results?  Is this what you expect? 

How to do find the fraction of number that are less that 0.25 and greater than 0.75? 



Calculating \\(\pi\\) using pseudo random numbers
-----------------

* [Buffon's Needle Experiment (18th C.)](https://en.wikipedia.org/wiki/Buffon%27s_needle)
* Circle in the Square.  

	Consider the square \\(\{ (x,y)\; | \; 0\leq x\leq 1, 0 \leq y \leq 1\}\\) and the quarter circle that falls within \\( x^{2}+y^{2} \leq 1\\).  The area within the circle is the fraction of the cirle in the square or \\(\pi/4\\). 

	We can use this to estimate a value of \\(\pi\\).  

	1. Randomly chooses points \\(x\\) and \\(y\\) in the range [0,1].  
	2. Count all points that fall within the circle. 
	3. Find the fraction of the points in the circle.
	4. Since this fraction should be \\(\pi/4\\), multiply by 4 to estimate \\(\pi\\). 


	This can be done in julia using
	1. `S1=rand(100,2)`
	2. `S2=count(a->a<1,mapslices(a->a[1]^2+a[2]^2,S1,[2]))` or
	 `S2=count(a->a<1,mapslices(sumabs2,S1,[2]))`
	3. `fr=S2/100`
	4. `est=4*fr`

		or combine all of these into one command:
		
		```
		4*count(a->a<1,mapslices(sumabs2,rand(100,2),[2]))/100
		```


Other Examples
-------

### Rolling 2 dice

How do we handle the rolling of two dice?  Here's an array with each row having 2 dice.
```
S=rand(1:6,100,2)
```

and then to find the sum of the dice:
```
dicesum = mapslices(sum,S,[2])
```

which sums along the rows.  This is  100 rolls of 2 dice with the sum recorded.  We can then count how many 2's 3's, etc. there are in this array, but Julia actually has that built-in, called `hist`. 

```
theRange, counts = hist(dicesum)
```

and if we want an array of fractions each roll comes up:

```
counts/100
```

A nice way to visualize this is using a histogram.  I found such a way to do this using [a package called Gadfly](http://gadflyjl.org/) which you'll need to add

```
Pkg.add("Gadfly")
```

and maybe update other packages.  Then import the package
```
using Gadfly
```

and finally you can plot it:

```
plot(x=[2:12],y=counts/10000,Geom.bar)
```

to get the following plot:

<img src="hist.png"></img>

###Exercise

Change the code above to use 1000 dice rolls. Estimate the probablity that you roll a 7.  Roll a 10 or greater.   Roll an even number.  (Is it 50%?)


Composite Data Types in Julia
-------

We will start to look at playing cards (poker) probabilities below.  Before that, let's look at a different datatype in Julia that allows us to store more that one variable together.  This is often called a composite type or a struct (from C) and similar to an object however you can't have a function as a member of the type. 

###Card datatype

For our playing card example, a card has a rank (1 to 13 corresponding to Ace, 2, through 10, J, Q, K) and a suit (1 to 4 corresponding to the suits "clubs", "spades", "diamonds" and "hearts"), which we define

```
ranks = ["A","2","3","4","5","6","7","8","9","T","J","Q","K"];
suits = ["C","S","D","H"];
```

We can define this using a Julia type [See the julia manual on composite types](http://docs.julialang.org/en/release-0.3/manual/types/). 

```
type Card
    rank::Int
    suit::Int
    Card(r::Int,s::Int)=new(r,s)
    Card(i::Int) = i%13==0? new(13,int(ceil(i/13))) : new(i%13,int(ceil(i/13)))
end
```

and if we type 
```
Card(3,2)
```

this will create a card of rank 3 and suit 2 (spades).  Since this isn't very easy to read we produce a function that prints the card.

```
function printCard(c::Card)
    return ranks[c.rank]*suits[c.suit];
end
```

And for example typing `printCard(Card(3,2))`  returns "3S" or 3 of spades.  Note: the `*` in julia with string will concantenate.  

You may notice that there is also a way to create a card from a single integer.  For example, `printCard(Card(45))` returns "6H", which would be the 45th card in an ordered deck.  This method will be useful when we get to a deck of cards.  

Since a Hand is also helpful in playing card games, we will define a hand in the following way:
```
type Hand
    cards::Array{Card,1}
end
```

which is just an array of cards.  (Note: there is nothing here that specifies that the Hand has to be 5 cards, but that could be included.)

Next are functions that retun the rank and suit of a card:

```
function cardrank(c::Card)
    return c.rank
end
```

```
function cardsuit(c::Card)
    return c.suit
end
```


Let's create a Hand by typing
```
h=Hand([Card(2,3),Card(12,1),Card(10,1),Card(10,4),Card(5,2)])
```

and then we can print out a hand by defining a printHand function
```
function printHand(h::Hand)
    join(map(printCard,h.cards),",")
end
```

and with the above hand:
```
printHand(h)
```

returns "2D,QC,TC,TH,5S"

###Find Probabilities of Poker Hands

Let's actually look at determining if a hand is a particular poker hand.  Some of them are fairly difficult to test for. Let's first try a full house:

```
function isFullHouse(h::Hand)
	local cranks=sort(map(cardrank,h.cards))
	return cranks[2]==cranks[1] && cranks[5]==cranks[4] && (cranks[3]==cranks[2] || cranks[4]==cranks[3]);
end
```

Now, let's perform a Monte Carlo simulation on a large number of poker hands and test if this gives the result we want:

```
deck=[1:52];
numhands=0;
trials = 100000
for i=1:trials
    shuffle!(deck)
    h = Hand(map(Card,deck[1:5]))
    if(isFullHouse(h))
        numhands+=1
    end
end
numflushes/trials
```

will create 100,000 poker hands and test how many are full house.  



