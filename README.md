# Haskell_LaTeX_slides

It is advisable to compile this project using a command which is
similar to one of the following.

```bash
pdflatex --shell-escape "\def\theme{light}\input{./main.tex}"

or

pdflatex --shell-escape "\def\theme{dark}\input{./main.tex}"
```
Strictly speaking, neither of the two arguments which are supplied to
the pdflatex utility in either of these two examples, are required. If 
this is the case, then why is their usage advised? The answer to this,
will be explained in the next two sections.

### Why the --shell-escape option is advised

By default, LaTeX disables execution of external commands for security
reasons. If it didn't, then a malicious .tex file could potentially
execute arbitrary commands on your computer.

The `--shell-escape` argument instructs the LaTeX compiler to allow the
execution of external programs. This is necessary for this project since
it uses the minted package, and the minted package in turn relies on
the use of an external program called pygmentize. The pygmentize program
analyzes code and produces LaTeX markup with the appropriate colors,
fonts, and formatting.

Having said all of this however, it appears as though the LaTeX code
can be compiled without using this argument after all. It is
still advisable to use this argument though, since not using it might
only work if the LaTeX environment and its required utilities - such as
pygmentize in this case, have only been configured in a particular way.


### Why the "\def\theme{light | dark}\input{./main.tex}" option is advised

The LaTeX code which is provided by this project, can utilise either one
of two different color themes - a light color theme or a dark color
theme. When you invoke the pdflatex utility from the command line, you
can tell it which theme you want it to use. That is what this argument
is for. If you don't specify a color theme using this argument, then the
LaTeX code will default to using the light color theme.
