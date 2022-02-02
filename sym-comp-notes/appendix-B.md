---
title: 'Appendix B: LaTeX, a typesetting System'
mathjax: true
---

[Previous Chapter](appendix-A.html) | [Return to all notes](index.html) | [Next chapter](appendix-C.html)

LaTeX is a typesetting system or software to create high-quality printed documents.  It dates to the 1970s and predates many word-processing programs like Microsoft Word.  LaTeX is also the goto software for people in STEM fields to produce mathematics and high-quality graphs.

The system is more like a programming language language in which there is source code which is compiled into a resulting PDF document.

## LaTeX Software

Once you learn LaTeX, it is a fantastic typesetting system.  Another aspect of it is that it is open-source and free.  There are a bunch of different systems that you can install/use on a given computer

### Over the web

* [Overleaf](https://www.overleaf.com) is a way to do LaTeX without installing anything on your computer.  It is great to start off with, but you are limited to having web access and may not have all capabilities.

### MacOS

* [TeXLive for Macs](https://tug.org/mactex/) is a place to grab everything you need to run LaTeX on your Mac.  It is a huge download (about 1Gb), so if you decide to do this, get on a good internet connection, get yourself a drink or a meal and sit back and wait.

  Note: there is a smaller version of this [here](https://tug.org/mactex/morepackages.html).  You'll get a minimal install, but may have to install other packages later.

### Windows

* [TeXLive for Windows](https://tug.org/texlive/windows.html) is similar to the Mac site and has everything you need to get started and is equally big. A direct link to run a program to download and install it is located [here](https://www.tug.org/texlive/acquire-netinstall.html).

* [MikTeX](https://miktex.org) is an alternative LaTeX system with a more user-friendly installer.  Click on the Download button above to get started.  Note: MikTeX does not provide an editor you will need to do that below.


Editors
------

Since LaTeX is similar to a programming language, the place you write is an editor.  As mentioned above, when you download the software, most bundles come with the editor.  Here is what to look for:

* *TeXworks*  which comes with TeXLive or you can [download separately](https://www.tug.org/texworks/).

* *TeXShop* which is a Mac-only editor, but has the look-and-feel of a Mac software.

* *Overleaf* is just a webpage with a built-in editor which is located at [https://www.overleaf.com](https://www.overleaf.com).

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
2. Find the "Typeset" button (or menu item) and click or select it.  Note: Overleaf does not have a typeset button, but automatically will do so.  If there are errors, often a button that says "Recompile from scratch" is helpful to try.
3. Your PDF should show up in a separate window or part of the program.




Simple math formulas
-------

One main reason for doing LaTeX is the nice mathematical formatting.  There are two modes of mathematics:

1. inline mode.  Mathematical commands are surrounded by dollar signs \$ ... \$.
2. Display mode.  This is on its own line and centered.  Often the size of symbols or layout is different.  The basic way to add math in display mode is with `\[` ... `\]`. We will also learn later how to add line numbers.


Here are some basic ideas of mathematical symbols:

* standard variables are entered as is. Note that if they are in \$ ... \$ then the font is different.
* greek letters use the standard name preceded with a backslash \\.  \$ \\alpha, \\beta, \\gamma, ... \$ will turn into $\alpha, \beta, \gamma \ldots $
* Superscripts and subscripts are with the \^ and \_ characters. If there is a single character, then just type it, like `x^2` generates $x^{2}$, but for multiple characters, you'll need \{ \}.  For example, `x^{10}` generates $x^{10}$.
* Fractions are with the `\frac{top}{bottom}` command.  `\frac{x^2}{2}` becomes $\frac{x^{2}}{2}$
* Derivatives: \$ f'(x) \$ becomes $f'(x)$ and `\frac{df}{dx}` becomes
  $$\frac{df}{dx}$$
* Integrals: `\int x^2 dx` generates
  $$\int x^{2} dx $$
  and for definite integrals, `\int_1^2 x^2 dx` generates
  $$\int_{1}^{2} x^{2} dx$$
* Sums and products work like integrals.  `\sum_{n=1}^{\infty} \frac{1}{n}` generates
  $$\sum_{n=1}^{\infty} \frac{1}{n}$$

  and `\prod_{i=1}^{10} (x-i)` generates
  $$ \prod_{i=1}^{10} (x-i)$$

* Other:  There is a lot of mathematics that is skipped here.  Here are some websites with more information:
  * Some interesting other examples are available [here](https://en.wikibooks.org/wiki/LaTeX/Mathematics), however note that many of them require other packages.
  * A huge list of mathematics symbols are available [here](https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols).

Other Standard Formatting
-----

* paragraphs

  To get a new paragraph, simply put in a blank line (two returns).  For example
  ```
  This is the first sentence in a paragraph.  And this is another one to make this paragraph longer.  This is the last sentence of my paragraph.

  This is the first sentence of the next paragraph.
  ```

  Will generate the two paragraphs. Notice that my default paragraphs are not separated by any space and are indented.  This behavior can be changed in the geometry package listed below.
* Sections and subsections

  Often for a paper, you will have sections and subsections of a paper.  To generate a new section, type `\section{Section Name}` and you will see a numbered section with a larger bold font.  To get a subsection, type `\subsection{Subsection name}`.  If you don't want the sections numbered, use `\section*{}` or `\subsection*{}`.  For example

  ```
  \section{Section One}
  \subsection{Subsection name}
  ```


* bold, italics

  To get bold use `\textbf{}` and put the bold words in the braces.  For example, `\textbf{this is in bold}` will show __this is in bold__.  To get italics, use `\emph{}` short for empahsis.  `\emph{this is in italics}` wil show _this is in italics_.

* bulleted lists

  To get a bulleted list use the `itemize` environment and each bulleted item should start with `\item`. For example:

  ```
  \begin{itemize}
  \item Item 1
  \item Item 2
  \item Item 3
  \end{itemze}
  ```

  will generate

  * Item 1
  * Item 2
  * Item 3

* enumerated lists

  To get an enuerated (numbered) list, use the `enumerate` environment.  For example:

  ```
  \begin{enumerate}
  \item Item 1
  \item Item 2
  \item Item 3
  \end{enumerate}
  ```

  will generate

  1. Item 1
  2. Item 2
  3. Item 3


  There are various types of bullets and enumeration types.   [This](https://en.wikibooks.org/wiki/LaTeX/List_Structures) page gives some additional ideas on lists.






Packages
-------

Like other software, additional functionality is located in packages in LaTeX.  To load in a package, you will use the `\usepackage` command in the preamble (above the `\begin{document}` line).

Here are a few common packages

* amsmath
* amsfonts
* geometry
* graphicx

### `geometry` package

Type `\usepackage{geometry}` in the preamble.  This gives a lot of flexibility on the spacing of margins and paragraphs, etc.

Typically, I will use this package with the following (make sure it is after you have loaded the package):
```
\usepackage[letterpaper,total={7in,9.5in}]{geometry}
```

which sets some margins by defining the area to be printed on (the `total` option above).  The documentation is [here](http://mirrors.ctan.org/macros/latex/contrib/geometry/geometry.pdf)

### `amsmath` package

Type `\usepackage{amsmath}` in the preamble.   This has a lot of helpful mathematical formatting.  The [amsmath documentation](http://mirrors.ctan.org/macros/latex/required/amsmath/amsmath.pdf) has more information that you probably want.  Here's a few ideas:

* `align` and `align*` environment.  This creates aligned, centered equations (either numbered or not---the `*` is a non-numbered version).

  The following:
  ```
  \begin{align*}
  2x_1 + 3x_2 & =  6, \\
  3x_1 + 4x_2 & =  8.
  \end{align*}
  ```

  will generate
  $$
  \begin{array}{rl}2x_1 + 3x_2 =& 6, \\
  3x_1+4x_2 = & 8.
  \end{array}$$

  where the two lines line up via the ampersands (&)

* `bmatrix`, `vmatrix` and `pmatrix` environments generate matrices with different delimiters. This must be in math mode and typically in display math.  I often put them in an `align` or `align*` environment. Each row of a matrix is ended with a `\\` and each column is separated by an `&`.

  For example,

  ```
  \begin{align*}
  \begin{bmatrix}
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9
  \end{bmatrix}
  \end{align*}
  ```

  will generate

  $$\left[\begin{array}{ccc}
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9
  \end{array}\right]$$



  ```
  \begin{align*}
  \begin{vmatrix}
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9
  \end{vmatrix}
  \end{align*}
  ```

  will generate

  $$\left|\begin{array}{ccc}
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9
  \end{array}\right|$$


  ```
  \begin{align*}
  \begin{pmatrix}
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9
  \end{pmatrix}
  \end{align*}
  ```

  will generate

  $$\left(\begin{array}{ccc}
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9
  \end{array}\right)$$

  and there are other delimiters available.


### `graphicx` package

Type `\usepackage{graphicx}` in the preamble. This package can load in external graphics (image files and other PDFs).  Additional documentation can be found [here](https://en.wikibooks.org/wiki/LaTeX/Importing_Graphics).

If you have an image that is called `my_image.png`, then to load it type
```
\includegraphics[width=2in]{my_image.png}
```

and you can change the width to another value or use the `height` option instead.  Note: make sure that the image is in the same directory that your latex source is.


## Other Help

There is a huge number of websites available for latex.  Some of the more helpful ones are:

* [A short introduction to LaTeX](latex/latex_tut.pdf)
* [A Not-so-short introduction to LaTeX](latex/ lshort.pdf)
* [Wikibooks site on LaTeX](https://en.wikibooks.org/wiki/LaTeX)
* [A discussion board with helpful Q&A](https://tex.stackexchange.com) although sometimes you get into way into the LaTeX weeds here.


Getting LaTeX from Matlab
-----

First, as we have shown, you can add latex to Matlab live scripts by putting the code in math mode (inside matching $$).

Also, another nice feature is any output from the symbolic part of Matlab can be right clicked (control-click or double-tapped on Macs) and select _Copy as LaTeX_

[Previous Chapter](appendix-A.html) | [Return to all notes](index.html) | [Next chapter](appendix-C.html)
