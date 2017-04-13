\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{tufte-book}[2015/06/30 v3.5.3 Tufte-book class]

%%
% Declare we're tufte-book
\newcommand{\@tufte@class}{book}% the base LaTeX class (defaults to the article/handout style)
\newcommand{\@tufte@pkgname}{tufte-book}% the name of the package (defaults to tufte-handout)

%%
% Load the common style elements
\input{tufte-common.def}

%%
% Notable addition: full-width caption. Intended for use with \begin{figure*}[p].
% Do NOT set a \label or a \caption if you use this.
% Simply use \fullwidthlabelcaption{label}{short caption}{long caption}
\def\isundefined#1{TT\fi\ifx#1\undefined}
\newsavebox{\@tufte@fullwidthcaption}
\newcommand{\fullwidthlabelcaption}[3]{%
\begin{lrbox}{\@tufte@fullwidthcaption}%
  \begin{minipage}[\floatalignment]{0.89\linewidth}\hbox{}%
    \ifthenelse{\isundefined{\origcaption}}{\caption}{\origcaption}[#2]{#3}%
    \ifthenelse{\isundefined{\origlabel}}{\label}{\origlabel}{#1}%
  \end{minipage}%
\end{lrbox}%%
\usebox{\@tufte@fullwidthcaption}
}


%%
% Set up any book-specific stuff now
%
% Better styling of TOC and list of figures/tables sections
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}

% Fancy numbered chapter headings, with quotes
\setcounter{secnumdepth}{0}
\ifxetex
  \RequirePackage{fontspec}
  \newfontfamily\chapterNumber[Scale=6]{Cochin}
  \newfontfamily\chapterTitle{Palatino}
\else
  \newfont{\chapterNumber}{pplr9d scaled 7000}
  \newfont{\chapterNumber}{pplr9d}
\fi
\definecolor{darkishgray}{gray}{0.40}
\titleformat{\chapter}
    [display]%shape
    {\relax\begin{singlespace}\begin{fullwidth}}%format applied to label+text
    {{\chapterNumber\textbf{\thechapter}} \vspace{-0.5cm}}%label
    {0pt}%sep
    {\chapterTitle\huge\itshape\vspace*{.9em}\raggedright\color{darkishgray}}%before
    [\normalsize\vspace{1em}\titlerule\end{fullwidth}\end{singlespace}\vspace{-1em}]%after

%%
% Front matter needs to have roman numerals for page numbering, centered, bottom of the page
\renewcommand\frontmatter{%
  \@mainmatterfalse%
  \pagestyle{fancy}
  \pagenumbering{roman}%
  \fancyhf{}%
  \fancyfoot[CO,CE]{\thepage}
}


%%
% For main matter, use arabic numerals, centered, on the bottom of the page
\renewcommand\mainmatter{%
  \@mainmattertrue%
  \pagestyle{fancy}
  \pagenumbering{arabic}%
  \fancyhf{}%
  \fancyfoot[CO,CE]{\thepage}
}

%%
% tufte-latex uses the "plain" style on the first page of chapters to suppress the page number
% but in our case, we still want to display page numbers there too
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[CO,CE]{\thepage}
}

%%
% The back matter contains appendices, indices, glossaries, endnotes,
% biliographies, list of contributors, illustration credits, etc.
\renewcommand\backmatter{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@mainmatterfalse%
}

%%
% Show chapter, section, and subsection titles in the table of contents
\setcounter{tocdepth}{2}

%%
% Simplify sidenote citations to only show author, year, and title.
% 
\renewcommand{\@tufte@normal@cite}[2][0pt]{%
  % Snag the last bibentry in the list for later comparison
  \let\@temp@last@bibkey\@empty%
  \@for\@temp@bibkey:=#2\do{\let\@temp@last@bibkey\@temp@bibkey}%
  \sidenote[][#1]{%
    % Loop through all the bibentries, separating them with semicolons and spaces
    \normalsize\normalfont\@tufte@citation@font%
    \setcounter{@tufte@num@bibkeys}{0}%
    \@for\@temp@bibkeyx:=#2\do{%
      \ifthenelse{\equal{\@temp@last@bibkey}{\@temp@bibkeyx}}%
        {\ifthenelse{\equal{\value{@tufte@num@bibkeys}}{0}}{}{and\ }%
         \@tufte@trim@spaces\@temp@bibkeyx% trim spaces around bibkey
         \citealp{\@temp@bibkeyx}}%\bibentry{\@temp@bibkeyx}}%
        {\@tufte@trim@spaces\@temp@bibkeyx% trim spaces around bibkey
         \citealp{\@temp@bibkeyx};\ }%\bibentry{\@temp@bibkeyx};\ }%
      \stepcounter{@tufte@num@bibkeys}%
    }%
  }%
}

%%
% If there is a `tufte-book-local.sty' file, load it.

\IfFileExists{tufte-book-local.tex}{%
  \@tufte@info@noline{Loading tufte-book-local.tex}%
  \input{tufte-book-local}%
}{}


% Here's Gildea's Boilerplate Stuff.
% Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.
% (This is modified from MIT's thesis template.)

%% Define all the pieces that go on the title page and the abstract.
% \title and \author already exist
% but allow definition of a fancier title (e.g. with formatting, line breaks)
%   specifically for the title page
\def\fancytitle#1{\gdef\@fancytitle{#1}}

\def\prevdegrees#1{\gdef\@prevdegrees{#1}}
\def\@prevdegrees{}

\def\department#1{\gdef\@department{#1}}
\def\program#1{\gdef\@program{#1}}
\def\school#1{\gdef\@school{#1}}

% If you are getting two degrees, use \and between the names.
\def\degree#1{\setbox0\hbox{#1}	 %for side effect of setting \@degreeword
  \gdef\@degree{#1}}

% \and is used inside the \degree argument to separate two degrees
\def\and{\gdef\@degreeword{degrees} \par and \par}
\def\@degreeword{degree}

\def\thesisdate#1{\gdef\@thesisdate{#1}}

% typically just a month and year
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% Usage: \supervisor{name}
\def\supervisor#1{\gdef\@supervisor{#1}}

% Dean's name is printed on the signature page
\def\dean#1#2{\gdef\@deanname{#1}\gdef\@deantitle{#2}}

% Usage: \committeemember{names}
\def\committeemembers#1{\gdef\@committeemembers{#1}}

%% `upcase' documentclass option: \choosecase is defined either as a dummy or
%% a macro to change the (expanded) argument to uppercase.
\newcommand{\choosecase}[1]{#1}

\def\maketitle{\begin{titlepage}
  \begin{center}
  \vfill
  \large
  {
    \ifx \@fancytitle \undefined
      \def\baselinestretch{1.1}\Huge
      \scshape\MakeLowercase{\@title}
    \else
      \@fancytitle
    \fi
    \par
  }
  \vspace{2cm}
  {\reflectbox{\rotatebox[origin=c]{-10}{\Huge\char"E0C9}} \par}
  \vspace{2cm}
  {\LARGE \choosecase{\@author}}
  \par
  \vspace{1cm}
  {\LARGE \oldstylenumbers{\@thesisdate}}
  \par
  \vspace{1cm}
  {
    \large
    \itshape
    A dissertation submitted to the Graduate Faculty \\
    of the \@department, \\
    \@program,
    \par
    in partial fulfillment of the requirements \\
    for the degree of \@degree, \\
    \@school.
  }
  \vfill
  \end{center}
  \end{titlepage}
}

\def\copyrightpage{
  \pagebreak
  \begin{center}
  \hspace{0pt}
  \vfill
  \copyright\ \oldstylenumbers{\@degreeyear}
  \par
  \vspace{1\baselineskip}
  \@author
  \par
  \vspace{1\baselineskip}
  All rights reserved.
  \vfill
  \hspace{0pt}
  \end{center}
  \pagebreak
}

\def\signaturepage{
  \pagebreak
  \hspace{0pt}
  \vfill
  \noindent
  This manuscript has been read and accepted by the Graduate Faculty of the \@department, 
  in satisfaction of the dissertation requirement for the degree of \@degree.
  \vskip 3\baselineskip
  \signature{Dissertation Advisor \textemdash\ \@supervisor}{Date}
  \par
  \vskip 3\baselineskip
  \signature{Dean \textemdash\ \@deanname}{Date}
  \par
  \begin{center}
  \vspace{1\baselineskip}
  \smallcaps{Dissertation committee} \\
  \@committeemembers
  \par
  \vspace{2\baselineskip}
  \smallcaps{\@school} \\
  \oldstylenumbers{\@degreeyear}
  \end{center}
  \vfill
  \hspace{0pt}
}

% abstract
\def\abstractpage{\cleardoublepage
  \begin{abstract}
  % Edit the following to change the line spacing of the abstract.
  %\doublespacing
  \onehalfspacing
  \begin{center}
    {\Large \@title}\par
    \vspace{1\baselineskip}
    \noindent
    by \@author \\
    Advisor: \@supervisor
  \end{center}
}

\def\endabstractpage{
  \end{abstract}
  \newpage
}

% You can use the titlepage environment to do it all yourself if you
% don't want to use \maketitle.  If the titlepage environment, the
% paragraph skip is infinitely stretchable, so if you leave a blank line
% between lines that you want space between, the space will stretch so
% that the title page fills up the entire page.
\def\titlepage{
  \cleardoublepage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup
}
% The \kern0pt pushes any depth into the height.  Thanks to Richard Stone.
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\def\signature#1#2{\par\noindent#1\dotfill\null\\*
  {\raggedleft #2\par}}

\def\abstract{\chapter*{Abstract}\small\def\baselinestretch{1}\@normalsize}
\def\endabstract{\par}

%%
% End of file
\endinput