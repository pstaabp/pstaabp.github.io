Scientific Computing and Visualization Course 
=======
(Fitchburg State University, Fall 2014)
--------

This is a repository for much of the material for Math 3001, Scientic Computing, a topics course at Fitchburg State University during Fall 2014. This is an introductory course requiring some basic Calculus and programming knowledge. 

Getting Started
-----------
This course will use the [Julia Language](http://julialang.org), a new language specifically designed for scientific computations.  Follow the steps in the [MIT Install Manual]() to install Julia on your computer. 

Documentation and Code
-----------

Documentation and code will be posted here on a weekly basis in folders.  You can browse the documentation within each folder or, as is recommended, clone this repository via git.  Then you can easily keep up to date.  See [using git and SourceTree](#git) for help with this.


Installing Julia and IJulia
------------

Note: this is based on the [Using Julia at MIT](https://github.com/stevengj/julia-mit/):

1. First, install iPython and related scientific-Python packages (SciPy and Matplotlib). The simplest way to do this on Mac and Windows is by [downloading the Anaconda package](http://continuum.io/downloads) and running its installer. (Do not use Enthought Canopy/EPD.)

	**Important:** on Windows, the Anaconda installer window gives options Add Anaconda to the System Path and also Register Anaconda as default Python version of the system. Be sure to check these boxes.

	If you do not want to install via Anaconda, [IPython has downloads as well.](http://ipython.org/install.html)

2. Second, [download Julia](http://julialang.org/downloads/) version 0.3 (which is in the most current version as of Aug 30, 2014) and run the installer. Then run the Julia application (double-click on it); a window with a julia> prompt will appear. At the prompt, type: 

```
Pkg.add("IJulia")
Pkg.add("PyPlot")
```

If you are having trouble, try the [Using Julia at MIT](https://github.com/stevengj/julia-mit/) site and search for "troubleshooting" on the page.  

3. Updating packages for julia is quite helpful in that there is a lot of development work going with julia since it is relatively new.  In julia, type `Pkg.update()` to update all of the packages.  

Running iJulia
-----------

To start running iJulia in your default browser go to a terminal (or command shell) and type:
```
ipython notebook --profile julia
```

<a name="git"></a>
Using Git, Github and SourceTree
-----------

[Git](https://en.wikipedia.org/wiki/Git_\(software\)) is a system for managing source code (whether this is actual computer code or other content) and is very sophisticated.  However, there are some very nice simple features as well. In this class, you won't need to use git, but I'd recommend it.  Instead of getting into the nitty, gritty of git we will use a GUI version instead called SourceTree.

[Visit Github](https://github.com/) and make yourself an account.  (Unless of course, you already have a github account)

[Download SourceTree](http://www.sourcetreeapp.com) and open the application (you may need to register, but the application is free).  Goto "File", then "New/Clone" (contol/command N) and in "Source Path/URL", type `https://github.com/pstaabp/scicomp.git`.  Select a directory on your computer for "Destination Path" and a bookmark name (e.g. "Scientific Computing").  Hit ok and you should now have a copy of the source code. 

Often during the semester, I will update the documentation/code on github.  To get updates, open SourceTree and you will see a number in the Pull icon in the top row.  Click on this will pull in changes to your local repository.  


