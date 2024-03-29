---
layout: post
title: Chapter 1:  Introduction to Symbolic Computing and Computer Algebra Systems
---

[Return to all notes](index.html) | [Next Chapter](ch-02.html)

This chapter explains what symbolic computing and computer algebra systems (CAS) are.  It's easier to understand these terms in context.  If we consider a basic calculator, typically numbers are put in and you get numbers out.  The numbers are what are called floating point numbers, but they look like decimals.  For example if you enter 2, then the square root button, you will see

```
1.414213562
```

Alternatively, in a CAS, if you enter the square root of two, you will get
$$ \sqrt{2} $$
The difference is that the decimal number above truncates to 10 or 12 decimal places, whereas the output of the CAS is exactly the square root of two.  You can see that if you square each of these.  Using the calculator by starting with 2, then taking the square root, then squaring, you might get
```
1.9999999989
```
which is close to 2, but not exactly, whereas in the CAS, the answer will be 2.

Additionally, a CAS allows one to enter in mathematical expressions and manipulate them.  For example if you enter
$$(x+2)^{2}$$

and then have the CAS expand it (skipping exactly how to do this until later), the CAS will return:
$$x^{2}+4x+4$$
which is how to expand it via the distributive law (or doing FOIL).  Standard calculators can't handle such an operation.

Another classic example of a CAS is that of precision of numbers.  Later in the course, we will discuss the number of digits in an approximation, say in finding  $\sqrt{2}$ , but recall that the factorial of a positive integer is the product of the number and all subsequence smaller integers until reaching one.  For example 5!=5·4·3·2·1=120.  Matlab will compute factorials easily, note that

$$10! = 3628800$$
$$20! = 2432902008176640000$$

and so on.  Most calculators cannot display more that 12-15 digits, so 20! may not be represented accuracy.  Matlab however can display as many digits as there are. Note that
$$50! = 30414093201713378043612608166064768844377641568960512000000000000$$

$$100!=93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000$$

Again, this is a big difference between a calculator and a CAS.  If you try these on a calculator, you will probably get an error (typically an overflow error).  

Computer Algebra Software
-----

Before we venture too much into the realm of CAS, we need to discuss some specifics of software.  There are a lot of programs that fall into Computer Algebra Systems, and if you are interested in seeing the breadth of such software, visit the [Wikipedia site that lists CAS's](https://en.wikipedia.org/wiki/List_of_computer_algebra_systems).  The major commercial ones are [Mathematica](http://www.wolfram.com/mathematica/) and [Maple](http://www.maplesoft.com/) and a nice open source one is [Sage](http://sagemath.org).

We are going to use Matlab in this course, which can do symbolic computations. 

Types of Objects in a CAS
------

As we saw above with the $\sqrt{2}$ example, a CAS is more complicated than a calculator and a firm understanding of the basics of a CAS is needed.  Before we dive into things, let's look at some basic objects in a CAS.  

* **Integer:**  As with mathematics, an integer in a CAS is whole number with the negative whole numbers.    Examples are 10,0,-25,1234313
* **Floating Point:**  If a number has a decimal point, we will call this a floating-point number, which is a standard way that computers store decimals numbers.  We won't get into details in this course.    Examples of floating-points are 1.0, -17.34, 3.14159, 1.234e+05 (which is shorthand for $1.234 \times 10^5$)
* **Rational:**  A rational number (like mathematically) is the quotient of two integers (the divisor can't be zero).  Examples are $\frac{1}{2}, -\frac{7}{3}$
* **Expression:**  An expression is a combination of variables (like $x$) and numbers with standard mathematical operators.  Examples are $2x$, $\dfrac{x}{x^{2}+1}, \sqrt{7y+2x}, t^{3}-\sqrt[3]{t}$
* **Equation:**  One expression that equals another.  Examples include $x=2, 2x^{3}-8x=0$.
* **Functions:** This is much like a mathematical function in which you have an input (or inputs) and there is an output.  An example is $x^{2}$, which is the square function. Mathematically, we write this $f(x)=x^{2}$.
* **Matrices:** These are like matrices from linear algebra.  An example is
$$\left[ \begin{array}{ccc} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{array}\right] $$
* **Other:** This is not an exhaustive list.  There are things like lists, arrays and plots that can be manipulated.  


Live Editor in Matlab
----

Matlab has a lot of features.  We're going to start using what is called the *Live Editor* which mixes commands, plots and mathematics in a nice-looking manner. 

Once you open up Matlab, there is a toolbar at the top.  Under the *Home* tab, click the *New Live Script* button.


### Entering Expressions in Matlab

When opening a file in *Live Editor* mode, you'll see a gray cell.  This is where we can enter code.  

1. To enter an integer number, just type it in: 123 and hit CTRL-ENTER (on Windows) or CMD-ENTER (on MacOS).  Alternatively, you can click on the gray and white striped bar to the left of the numbers.   You'll see `ans = 123` in an area to the right.  There is a matlab variable (which we'll talk about soon) called `ans` which has the value 123.  

2. To enter $\sqrt{2}$, type `sqrt(2)`.  You'll see `ans = 1.4142`.  Note: this is an approximate value of the square root of 2. 

3. If instead, you want the symbolic version of the square root of 2, type: `sym(sqrt(2))`.  And you'll see $\sqrt{2}$. 

1. To enter the expression: $(x + 2)(x + 5)$,  we first need to tell matlab to create a variable named $x$.  First type `syms x`.  It doesn't return anything, but you'll see in the `Workspace` pane on the lower right corner of the app, there is now `x` which is a `1x1 sym`--we'll explain this later.  

    Now you should type `(x+2)*(x+5)`.  Note if you don't type the `*`, you'll get an error.  In short, in Matlab, any implict multiplication needs to be entered explicitly.  

2. The easiest way to enter the expression: $\displaystyle \frac{x+5}{2-x} + 3$
is to type
   ```
   (x+5)/(2-x)+3    
   ```

   Note: you must use parentheses in the numerator. 

3. The transcendental functions must be written with parentheses around the argument. In other words, $\sin x$ must be typed `sin(x)` in Maple. Many of these functions also appear in the Expression Palette or other palettes.

4. The exponential function seems like we should type in `e^x`, but we'll get the error `Unrecognized function or variable 'e'`.  Basically this means that e isn't defined.  Alternatively, type in `exp(x)`

4. The natural log, $\ln x$ is defined in Matlab as `log(x)`.  

5. The absolute value of x or $|x|$ needs to entered as `abs(x)`.

6. If we just enter `pi`, you'll get a floating-point approximation of $\pi$.  If you want the symbolic version of it, enter `sym(pi)`. 


### Exercise

Put the following into Matlab:

1. $(x-3)^{3}$

2. $\displaystyle \frac{7+3x}{11+x}$

3. $\tan 3x$

4. $\cos^{2}(\frac{1}{x})$

5. $\sqrt{3-\frac{4}{x^{2}+1}}$

6. ${\rm e} ^{\sqrt{x}}$

Commands in Matlab
-----

Generally to get Matlab to do something, we will use a command.  All commands in Matlab have the form `name(param1,param2,...)` where `name` is the name of the command and there are some number of parameters or arguments (the things inside the parentheses) separated by commas.  

There are thousands of commands in Matlab and obviously, we won't be going over all of them.  It is good to be able to understand in general about a Matlab command and the many options available as well as where to get extended help.   We will cover more of this later in the course.  

Generally Matlab does something to a parameter (or argument) and returns an object of a certain type.  

### Examples

* The following expands the expression $(x+1)(x+2)$:
  ```
  expand((x+1)*(x+2))
  ```

  which will be $x^{2}+3x+2$.  

* To find a common denominator of the  expression $\dfrac{1}{2} + \dfrac{x}{x+1} + \dfrac{3}{x+1}$
  ```
  simplifyFraction(1/2 + x/(x+1) + 3/(x+1))
  ```
  which results in  $\dfrac{x^2+11x+12}{2(x+1)(x+2)}$. 

* To factor the polynomial (or at least attempt to) $x^2-x-20$, enter 
   ```
   factor(x^2-x-20)
   ```
   which returns $(x+4)(x-5)$ 


Help Pages in Matlab
------

Maple has a good set of help pages built-in.  It is highly recommended that you use it often.  There are two standard ways to ask for help.

1. There is a `Search Documentation` field in the top right corner of the app.  You can click in there to search

2. In the the main window for entering commands, typing `help(command)` will show a short description of the command.  Note that the command must be in double quotes.  For example
   ```
   help("expand")
   ```

   opens up information about the expand command. 

2. Inside the main window for entering commands, typing `doc(command)` will open the help browser.  Note that the command must be in double quotes.  For example
   ```
   doc("expand")
   ```

   opens up information about the expand command in the help documentation browser.  

4. Of course googling is natural for anyone--although I prefer to use [Duck Duck go](http://duckduckgo.com) for search, just make sure that you put in matlab in your search term.  I finally generally when searching on the web, the Matlab help pages pop up first anyway.  


[Return to all notes](index.html) | [Next Chapter](ch-02.html)
