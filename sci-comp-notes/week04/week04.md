Random Numbers
-------------

First let's examine random integers.  Consider random integers in the range 1 to 10, which is uniform.  Let \\((a_1,a_2,a_3, \ldots, \\) be a random sequence.  Typically we mean the following properties need to hold:

1. any number in the range 1 to 10 is equally likely to occur. 
2. Take N random numbers and let \\(s_n\\) be the number of times the number \\(n\\) occurs.  	The fraction \\(s_n/N\\) should go to 1/10 in the limit as \\( n\rightarrow \infty \\).
3. Knowing the sequence \\(s_1, s_2, \ldots, s_k\\) does not allow us to predict \\(s_{k+1}\\) 

If instead we use floating point numbers, there are a few different properties.  Assume that the floating point number is in the range \\( 0 \lt x \lt 1 \\).  Then the  sequence   \\((a_1,a_2,a_3, \ldots, \\) is random if 

1. Let \\(s_{[c,d]}(a_1,a_2,a_3, \ldots) \\) be the total of the numbers that satisfy \\(c \lt a_k \lt d\\).  Then as the number of random numbers approach infinity \\(s_{[c,d]}=d-c\\)

Pseudo Random Number Generator
----------------




Calculating \\(\pi\\) using pseudo random numbers
-----------------

* [Buffon's Needle Experiment (18th C.)](https://en.wikipedia.org/wiki/Buffon%27s_needle)
* Circle in the Square.  

