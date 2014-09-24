Week 3 Notes
=============

These are the notes for week 3 of Math 3001. [Return to all notes](../index.html)


Using functions in a separate file
-----------

As we saw last time, the functions we are using get a little larger.  When this happens, it's a pain to type them out everytime we want to use them.  Instead we will place them in a separate file. 

Open up a text editor (like Notepad on windows or TextEdit on OSX) and enter the following function
```
function newton(f,df,x0)
    local found = false, x=x0,n=0
    while(!found && n<50)
        n+=1
        x=x-f(x)/df(x)
        found = abs(f(x))<1.0e-12
    end
    return x
end
```

save it in a file called `newton.jl` somewhere. 

To use it in a julia session, type
```
require("newton")
```

as long as the file is in the same directory as the julia session. If it isn't found, type out the absolute path. 

Try it out with
```
newton(x->x^2-4,x->2x,1)
```

which will return 2.0.  

Note:  If you make changes to the file you need to reload it with the command 
```
reload("newton")
``` 

(or the full path) 

### Exercise

Save the function in a file.  Type in the `require ` command above and try running newton on the function above or another function. 


Complex Numbers
-----------

Last week we briefly saw complex numbers. A site called purplemath.com has a [nice overview of complex numbers](http://www.purplemath.com/modules/complex.htm).  Here's a few example using Julia to do complex arithmetic. 

Entering the number \\(a+bi\\) is put in with `a+b*im`.  For example `-2+im` or `0.5*1.5im`.

Operations with complex numbers:
```
(-2+im)^2
(-2+im)*(7+4im)
(-2+im)/(7+4im)
```

Other operations/mathematical functions work as well
```
sqrt(-1+0im)
sin(-2+im)
e^(-5.42+32.3im)=exp(-5.42+32.3im)
```

however, these may not make sense (unless you seen some complex analysis).


Complex Solution to the quadratic equation
---------

Recall that we used the quadratic formula to solve \\(ax^{2}+bx+c=0\\)

```
 function qSol(a,b,c)
       d=sqrt(b^2-4*a*c)
       return (-b+d)/(2*a),(-b-d)/(2*a)
 end
```

which works great for quadratic equations with real solutions.  The solution to \\(x^{2}-x-110\\) is 11 and -10.  However, if there is no real solution, like \\(x^{2}+4=0\\), then the function gives:

```
qSol(1,0,4)
ERROR: DomainError
sqrt will only return a complex result if called with a complex argument.
try sqrt(complex(x))
in sqrt at math.jl:131
in anonymous at none:2
```

But if we put in complex coefficients:
```
qSol(1+0im,0im,4+0im)
```

we get
```
(0.0 + 2.0im,0.0 - 2.0im)
```

for the solution.  


Newton's Method with complex numbers
-----

Newton's method works great with complex numbers as well.  In short, we just need to start it with a complex number and it will iterate the same way.  

(Note: the interpretation of using the tangent line to estimate the root isn't quite the same as with real numbers, but it still converges to a root.)


Let's use this to solve \\(x^{2}+5=0\\), which should have the solution \\(x=\pm i\sqrt{5}\\).  First, define
```
f(x)=x^2+5
```

and
```
df(x)=2x
```

and if we do `newton(f,df,1.0)` then the result stays in the real number and we get `-11.659358758975838` but this isn't the solution. 

However, if we type `newton(f,df,1im)`, the the solution 0.0 + 2.236067977499978im.  

###Exercise

The equation \\(x^{3}-1=0\\) has one real root and two complex ones.  Use newton's method to find all of them.  


Running iJulia
-------

iJulia is an interactive way of running julia.  It appears in a browser and has a lot of nice features.  You need to have loaded anaconda (see [Installing Julia](https://github.com/pstaabp/scicomp) for info on this.)

If you have anaconda installed then open julia and type:

```
Pkg.add("IJulia")
Pkg.add("PyPlot")
```

(this may take some time)

If all runs without errors, then try

```
using IJulia
notebook()
```

and (fingers crossed) you will get a tab open in your default browser with a listing of your current directory.  



