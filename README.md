# My PhD thesis

This is the complete source, including figures, for my PhD thesis, deposited at the [Icahn School of Medicine at Mount Sinai](http://icahn.mssm.edu) on July 5, 2017. The code is forked from [\@scientiffic](https://twitter.com/scientiffic)'s [tufte-latex-mit template](https://github.com/ttseng/tufte-latex-mit), which is itself an amalgamation of components of the [MIT's LaTeX thesis template](http://web.mit.edu/thesis/tex/) and the [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/) template.

## Reading

The typeset PDF is included in the repository and can be [downloaded by itself](https://github.com/powerpak/thesis/raw/master/main.pdf).

## Publications

Four chapters of this thesis were published, after reformatting and revisions, as individual peer-reviewed articles. Citations for those publications are as follows:

Chapter 1: **Pak TR**, Kasarskis A. "How next-generation sequencing and multiscale data analysis will transform infectious disease management."
_Clin Infect Dis._ 2015 Aug 6. pii: civ670.  doi:[10.1093/cid/civ670](https://doi.org/10.1093/cid/civ670).

Chapter 2: **Pak TR**, Altman DR, Attie O, Sebra R, Hamula CL, Lewis M, Deikus G, Newman LC, Fang G, Hand J, Patel G, Wallach F, Schadt EE,
Huprikar S, van Bakel H, Kasarskis A, Bashir A. "Whole-genome sequencing identifies emergence of a quinolone resistance mutation in a
case of Stenotrophomonas maltophilia bacteremia." _Antimicrob Agents Chemother._ 2015 Aug 31. pii: AAC.01723-15. doi:[10.1128/AAC.01723-15](https://doi.org/10.1128/AAC.01723-15).

Chapter 5: **Pak TR**, Chacko KI, O’Donnell T, Huprikar S, van Bakel H, Kasarskis A, Scott ER. "Estimating local costs associated with _Clostridium difficile_ infection using machine learning and electronic medical records." _Infect Control Hosp Epidemiol._ 2017 Dec;38(12):1478-1486. doi:[10.1017/ice.2017.214](https://doi.org/10.1017/ice.2017.214).

Chapter 6: Michlmayr D,\* **Pak TR**,\* Rahman A, Amir ED, Kim E-Y, Kim-Schulze S, Suprun M, Stewart MG, Thomas G, Balmaseda A, Wang L, Zhu J, Suarez-Farinas M, Wolinsky SM, Kasarskis A, Harris E. "Comprehensive innate immune profiling of chikungunya virus infection in pediatric cases." _Mol Syst Biol._ 2018 Aug; 14(8): e7862. doi:[10.15252/msb.20177862](https://doi.org/10.15252/msb.20177862).

## Compiling

I compiled this with [MacTeX 2014](ftp://tug.org/historic/systems/mactex/2014/) using the wrappers for `latexmk` in the LaTeX bundle for TextMate 2.0. The main (and only) file that you should compile is `main.tex`, and to support all features used, you need to use [XeTeX](https://en.wikipedia.org/wiki/XeTeX), not `pdflatex`.

In theory, it should also be compilable with [TeX Live 2014](ftp://tug.org/historic/systems/texlive/2014/) on any UNIX, but I haven't tested that. There are breaking updates in certain packages, particularly `biblatex`, that seem to prevent this from being compiled as-is with newer distributions like 2015 or 2016. With TeX debugging being the pile of worms that it is, I haven't had time to figure out why that is. Fortunately, TUG maintains [an archive](ftp://tug.org/historic/systems) of all old MacTeX and TeX Live distributions, and it is fairly simple (at least with MacTeX) to have multiple distributions installed and [switch between them](http://www.tug.org/mactex/multipletexdistributions.html) as needed. So for now, MacTeX 2014 it shall be.

Besides MacTex or Tex Live 2014, you'll also need the Minion Pro, Bitstream Vera Sans Mono, Palatino, and Cochin fonts, which XeTeX should be able to find if they are installed for your operating system.