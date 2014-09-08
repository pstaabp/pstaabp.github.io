Getting Started in Julia
=====================

Open _Julia_ by finding the application and running it.  This will open up a window in which you can type in commands to Julia and get responses.  Once we  learn the basics of Julia, then we'll learn about interactive Julia notebooks.

Command line Julia
-------------

When this open, you will get a prompt denoted by `julia>`. For example, type `4+4` and  you will get the result `8`.  Here's a list of the standard mathematical operations that Julia knows: +,-,*,/,^ (power) as well a large number of functions including: exp (natural exponential);  log (natural log); the trig functions sin, cos, tan, csc, sec, cot; the inverse trig functions asin, acos, atan, acsc, asec, acot, and there is a [listing of all mathematical functions in Julia](http://docs.julialang.org/en/release-0.3/manual/mathematical-operations/#elementary-functions)

Try Entering the following
---------------

* \\(\frac{4-2}{7-3}\\)
* \\(\sin(\frac{\pi}{4})\\)
* \\(\sin(45^{\circ})\\)
* \\(\ln(7)\\)
* \\(e^{7}\\)
* \\(2^{\sqrt{3}}\\)

Loops
--------

* For loops

	```
	for i=1:10
	  println(i)
	end
	```

* while loop:
	```
	i=1;
	while i<10
	  println(i)
	  i+=1
	end
	```

More information is at [Julia's manual on loops](http://docs.julialang.org/en/release-0.3/manual/control-flow/#repeated-evaluation-loops)
