Appendix A: LaTeX, a typesetting System
=====

LaTeX is a typesetting system or software to create high-quality printed documents.  It dates to the 1970s and predates many word-processing programs like Microsoft Word.  LaTeX is also the goto software for people in STEM fields to produce mathematics and high-quality graphs.  

The system is more like a programming language language in which there is source code which is compiled into a resulting PDF document.  

LaTeX Software
-------

Once you learn LaTeX, it is a fantastic typesetting system.  Another aspect of it is that it is open-source and free.  There are a bunch of different systems that you can install/use on a given computer

### Over the web

* [Overleaf](https://www.overleaf.com) is a way to do LaTeX without installing anything on your computer.  It is great to start off with, but you are limited to having web access and may not have all capabilities.  

### MacOS

* TeXLive for Macs is a place to grab everything you need to run LaTeX on your Mac.  It is a huge download (about 1Gb), so if you decide to do this, get on a good internet connection, get yourself a drink or a meal and sit back and wait.  

  Note: there is a smaller version of this here.  You'll get a minimal install, but may have to install other packages later.  

### Windows

* TeXLive for windows is similar to the Mac site and has everything you need to get started and is equally big.

* MikTeX


Editors
------

Since LaTeX is similar to a programming language, the place you write is an editor.  As mentioned above, when you download the software, most bundles come with the editor.  Here is what to look for:

* *TeXworks*  which comes with TeXLive or you can download separately.

* *TeXShop* which is a Mac-only editor, but has the look-and-feel of a Mac software.

* *Overleaf* is just a webpage with a built-in editor.  

For the most part, these all are similar.  There is a place to type in the LaTeX source; a set of buttons, menu items, and keyboard shortcuts to compile the code; and a console area for information about errors.

Basic Template
--------

The following is a basic template for LaTeX:

```
\documentclass[11pt]{article}

\begin{document}

This is my first latex document.

\end{document}
```

The important aspects of this are:

* the `\documentclass` line tells LaTeX the base font size and the type of document.  The other font sizes are 10pt and 12pt.  Other types of documents are books and letters.  

* a `\begin` / `\end` block is an environment.  This is the document where the stuff that you type appears printed out.

* any commands about the `\begin{document}` is called the preamble.

* anything after the `\end{document}` is just ignored.   

To get the LaTeX into a PDF form:

1.  Take the few lines above, copy them and paste into Overleaf, TeXShop or TeXworks.
2. Find the "Typeset" button (or menu item) and click or select it.
3. Your PDF should show up in a separate window or part of the program.  




Simple math formulas
-------

One main reason for doing LaTeX is the nice mathematical formatting.  There are two modes of mathematics:

1. inline mode.  Mathematical commands are surrounded by dollar signs \$ ... \$.  
2. Display mode.  This is on its own line and centered.  Often the size of symbols or layout is different.  We will also learn later how to add line numbers.


Here are some basic ideas of mathematical symbols:

* standard variables are entered as is. Note that if they are in \$ ... \$ then the font is different.
* greek letters use the standard name preceded with a backslash \\.  \$ \\alpha, \\beta, \\gamma, ... \$ will turn into $\alpha, \beta, \gamma \ldots $
* Superscripts and subscripts are with the \^ and \_ characters.
* Fractions are with the `\frac{top}{bottom}` command.  `\frac{x^2}{2}` becomes $\frac{x^{2}}{2}$
* Derivatives: \$ f'(x) \$ becomes $f'(x)$ and `\frac{df}{dx}` becomes
  $$\frac{df}{dx}$$
* Integrals
* Sums
* Other


Packages
-------

Like other software, additional functionality is located in packages in LaTeX.  To load in a package, you will use the `\usepackage` command in the preamble (above the `\begin{document}` line).  

Here are a few common packages

* amsmath
* amsfonts
* geometry
* graphicx


### `amsmath` package

Type `\usepackage{amsmath}` in the preamble.   This has a lot of helpful mathematical formatting.  The [amsmath documentation](http://mirrors.concertpass.com/tex-archive/macros/latex/required/amsmath/amsmath.pdf) has more information that you probably want.  Here's a few ideas:

* `align` and `align*` environment.  This creates aligned, centered equations (either numbered or not---the `*` is a non-numbered version).





* Inserting a plot
* Sections/subsections
* Mathematics
  * Integrals, derivatives and sums
* Aligned equations
* Matrices
* Bold and italics
