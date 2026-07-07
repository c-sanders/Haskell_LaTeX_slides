# Haskell_LaTeX_slides

The LaTeX code in this project should be built using a command which is
similar to one of the following.

```bash
pdflatex --shell-escape "\def\theme{light}\input{./main.tex}"

or

pdflatex --shell-escape "\def\theme{dark}\input{./main.tex}"
```

Both of the arguments to the pdflatex command are required on the
command line. Why each of them are required, will be explained in the
next two section.

### Why the --shell-escape option is required

By default, LaTeX disables execution of external commands for security
reasons. If it didn't, then a malicious .tex file could potentially
execute arbitrary commands on your computer.

The `--shell-escape` argument instructs the LaTeX compiler to allow the
execution of external programs. This is necessary for this project since
it uses the minted package, and the minted package in turn relies on
the use of an external program called pygmentize. The pygmentize program
analyzes code and produces LaTeX markup with the appropriate colors,
fonts, and formatting.


### Why the "\def\theme{light | dark}\input{./main.tex}" option is required

The LaTeX code which is provided by this project, can utilise either one
of two different color themes; a light theme or a dark theme. When you
invoke the pdflatex command from the command line, you must tell it
which theme you want to use. That is what this argument is for.
