# My PhD thesis

This is the complete source, including figures, for my PhD thesis, deposited at the [Icahn School of Medicine at Mount Sinai](http://icahn.mssm.edu) on July 5, 2017. The code is forked from [\@scientiffic](https://twitter.com/scientiffic)'s [tufte-latex-mit template](https://github.com/ttseng/tufte-latex-mit), which is itself an amalgamation of components of the [MIT's LaTeX thesis template](http://web.mit.edu/thesis/tex/) and the [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/) template.  

## Compiling

I compiled this with [MacTeX 2014](ftp://tug.org/historic/systems/mactex/2014/) using the wrappers for `latexmk` in the LaTeX bundle for TextMate 2.0. The main (and only) file that you should compile is `main.tex`, and to support all features used, you need to use [XeTeX](https://en.wikipedia.org/wiki/XeTeX), not `pdflatex`.

In theory, it should also be compilable with [TeX Live 2014](ftp://tug.org/historic/systems/texlive/2014/) on any UNIX, but I haven't tested that. There are breaking updates in certain packages, particularly `biblatex`, that seem to prevent this from being compiled as-is with newer distributions like 2015 or 2016. With TeX debugging being the pile of worms that it is, I haven't had time to figure out why that is. Fortunately, TUG maintains [an archive](ftp://tug.org/historic/systems) of all old MacTeX and TeX Live distributions, and it is fairly simple (at least with MacTeX) to have multiple distributions installed and [switch between them](http://www.tug.org/mactex/multipletexdistributions.html) as needed. So for now, MacTeX 2014 it shall be.

Besides MacTex or Tex Live 2014, you'll also need the Minion Pro, Bitstream Vera Sans Mono, Palatino, and Cochin fonts, which XeTeX should be able to find if they are installed for your operating system.