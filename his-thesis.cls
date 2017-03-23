%%
%% This is file `his-thesis.cls'
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{his-thesis}[2017/01/15]

% Necessary for included LaTeX classes
\newif\if@titlepage%
\@titlepagetrue%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%

% Chapters and parts must start on a right-hand page request one.
\newif\if@openright% FIXME necessary?
\@openrighttrue

\newif\if@mainmatter \@mainmattertrue% FIXME necessary?

\RequirePackage{ifthen}% provides \ifthenelse and \newboolean

\newboolean{@isfinal}
\DeclareOption{final}{\setboolean{@isfinal}{true}}


%% Ten, eleven, and twelve point size options
\newcommand\@ptsize{0}% FIXME necessary?

% For two-sided printing we use the switch \if@twoside.
% In addition we have to set the \if@mparswitch to get
% any margin paragraphs into the outside margin.
\@twosidetrue
\@mparswitchtrue

% Pass language-specific options "english" and "swedish" to Babel
\DeclareOption{english}{%
\PassOptionsToPackage{USenglish,swedish,main=USenglish}{babel}%
}
\DeclareOption{swedish}{%
\PassOptionsToPackage{USenglish,swedish,main=swedish}{babel}%
}

%%
%% End of Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Execute Options
%%

% \ExecuteOptions{a4paper,twoside,topside,openright}
\ProcessOptions
\input{his-thesis10.clo}

%%
%% End of Execute Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Required packages
%%

% For language-specific features such as correct word wrapping
\RequirePackage{babel}
% For improved \RaggedLeft, \RaggedRight, and \Centering commands
\RequirePackage{ragged2e}
\RequirePackage[overload]{textcase}% FIXME necessary?

%% Define page size and margins
\ifthenelse{\boolean{@isfinal}}{%
%% Option 'final' is set, so use special paper size
\RequirePackage[%
paperwidth=166mm,%
paperheight=240mm,%
layoutsize={166mm,240mm},% layout size equals special paper size
layoutvoffset={0mm},% where to place the dissertation's pages on paper
layouthoffset={0mm},%
showcrop=false%
]{geometry}
}{%
%% Option 'final' not set, so use A4 paper with cut marks
\RequirePackage[%
a4paper,% use A4 paper as base to print on
layoutsize={166mm,240mm},% the dissertations internal paper size
layoutvoffset={28.5mm},% where to place the dissertation's pages on an A4 paper
layouthoffset={22mm},%
showcrop=true%
]{geometry}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Color Definitions

\RequirePackage[table,svgnames,dvipsnames]{xcolor}

% Define a red color used for special pages' backgrounds,
% needs to be re-defined in hismetadata.sty for either
% doctoral dissertations or licentiate thesises
\definecolor{specialpagebackground}{RGB}{191,15,0}% red

% An orange shade
\definecolor{oxid}{RGB}{234,120,25}

%% To set and restore page color
\xdef\thepagecolornone{white}% this seeming redundant definition is sometimes necessary
\RequirePackage[nopagecolor={white}]{pagecolor}

%%
%% End of Required packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Line spacing parameters
%%

\setlength\lineskip{0\p@}
\setlength\normallineskip{0\p@}

%%
%% End of Line spacing parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paragraph style parameters
%%

\renewcommand\baselinestretch{}
\setlength\parskip{4.5\p@ \@plus0\p@}
\parindent=\z@

%%
%% End of Paragraph style parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\def\@item[#1]{%
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
 \RaggedRight %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
  \ignorespaces}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Penalties
%%

%% \nopagebreak and \nolinebreak penalties
\@lowpenalty   51		% book default
\@medpenalty  151		% book default
\@highpenalty 301		% book default

% The following penalties are not used in book. Should we use them?
%%% Line breaking penalties
%\pretolerance=100           % Pass 1 of line breaking algorithm
%\tolerance=200              % Pass 2 of line breaking algorithm
%\doublehyphendemerits=5000  % Two consecutive hyphenated lines: 10000
%\finalhyphendemerits=5000   % Second to the last line is hyphenated
%\adjdemerits=10000          % Two adjacent visually incompatible lines
%\linepenalty=10             % Added for each line
%\looseness=0                % Try to make the paragraph \looseness longer
%
%%% Implicit horizontal penalties
%\hyphenpenalty=50   % Line break in hyphenated word
%\exhyphenpenalty=50 % Same as above, pre-text empty
%\binoppenalty=700   % Line break after binary operation
%\relpenalty=500     % Line break at math relation operator
%
%%% Implicit vertical penalties
%\clubpenalty=500            % Club line at bottom of page: 150
%\widowpenalty=500           % Widow line at top of page: 150
%\displaywidowpenalty=150    % Widow in front of display: 50
%\brokenpenalty=100          % Between hyphenated line and following line
%\predisplaypenalty=10000    % Forbid breaking in front of display
%\postdisplaypenalty=0       % Allow break after display
%
%%% Box related counter parameters
%\hbadness=10000 % Report if badness of hbox > \hbadness: 1000
%\vbadness=10000 % Report if badness of vbox > \vbadness: 1000
%\hfuzz=0.1pt    % Report if overfull width of hbox > \hfuzz: 0.1pt
%\vfuzz=0.1pt    % Report if overfull width of vbox > \vfuzz: 0.1pt

%%
%% End of Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\headerfooterfont}{\fontarial{8}{9}}
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\ps@headings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\headerfooterfont\thepage\hfil\itshape\leftmark}%
    \def\@oddhead{\headerfooterfont{\itshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markboth {\MakeUppercase{%
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter% if in main text body (i.e. not ToC, LoC, LoF, ...)
          \@chapapp\ \thechapter. \ %
        \fi
      \fi
      ##1}}{}}%
  \def\sectionmark##1{%
    \markright {\MakeUppercase{%
      \ifnum \c@secnumdepth >\z@
        \thesection. \ %
      \fi
      ##1}}}}
\def\ps@headingsfoot{%
    \let\@oddhead\@empty\let\@evenhead\@empty
    \def\@evenfoot{\headerfooterfont\thepage\hfil}%
    \def\@oddfoot{\headerfooterfont\hfil\thepage}%
    }
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \cleardoublepage
  \@mainmatterfalse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parts
%%

\newcommand{\partlike}[1]{%
  \cleardoublepage
  \thispagestyle{headingsfoot}%
  \null\vfil
  % Define a dark purple color used for page backgrounds
  \newpagecolor{specialpagebackground}%
  \markboth{}{}% no page header
  {\thispagestyle{empty}% no page numbers on just this page
   \vspace{34.74mm}%
   \begingroup\color{white}\raggedleft% \RaggedLeft
   \begingroup\fontarial{16.5}{21.0}#1\par\endgroup%
   \endgroup%
  }%
  \@endpart
}

\newcommand\part{%
  \cleardoublepage
  \thispagestyle{headingsfoot}%
  \null\vfil
  \secdef\@part\@spart}% for part*, use @spart, for non-star part use @part

%% The actual formatting of the title of the part
\def\@part[#1]#2{%
    % Define a dark purple color used for page backgrounds
    \newpagecolor{specialpagebackground}%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart.\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}% no page header
    {\thispagestyle{empty}% no page numbers on just this page
     \vspace{34.74mm}%
     \begingroup\color{white}\raggedleft% \RaggedLeft
     \begingroup\fontarial{13.5}{15.0}\MyUpperCase{\partname\hspace{0.5em}\thepart}\par\endgroup%
     \begingroup\fontarial{16.5}{21.0}\MyUpperCase{#2}\par\endgroup%
     \endgroup%
    }%
    \@endpart}

%% The actual formatting of the title of the part (star form)
\def\@spart#1{%
    % Define a dark purple color used for page backgrounds
    \newpagecolor{specialpagebackground}%
    \markboth{}{}% no page header
    {\thispagestyle{empty}% no page numbers on just this page
     \vspace{34.74mm}%
     \begingroup\color{white}\raggedleft% \RaggedLeft
     \begingroup\fontarial{16.5}{21.0}\MyUpperCase{#1}\par\endgroup%
     \endgroup%
    }%
    \@endpart}

%% The actual formatting of the end of the part (both star and non-star forms)
\def\@endpart{\vfill
	     \newpage
            \null
            \thispagestyle{empty}%
            \restorepagecolor% restore original page color
            \newpage}

%%
%% End of Parts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapters
%%

\newcommand\chapter{\cleardoublepage% chapter shall start on a fresh right page
                    \thispagestyle{headingsfoot}% page numbers on page's bottom (top is default)
                    \global\@topnum\z@% ???
                    \@afterindentfalse% ???
                    \secdef\@chapter\@schapter}% for chapter*, use @schapter, for non-star chapter use @chapter
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne% ???
                       \if@mainmatter% if in main text body (i.e. not ToC, LoC, LoF, ...)
                         \refstepcounter{chapter}% increase chapter counter
                         \typeout{\@chapapp\space\thechapter.}% debug output in console
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}% will appear in ToC
                       \else
                         \addcontentsline{toc}{chapter}{#1}% chapters in frontmatter or backmatter, will appear in ToC
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}% will appear in ToC
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}% add vertical space between chapters in list of figures
                    \addtocontents{lot}{\protect\addvspace{10\p@}}% add vertical space between chapters in list of tables
                    \@makechapterhead{#2}%
                    \@afterheading}
\def\@makechapterhead#1{% non-star chapter
  \vspace*{29\p@}% Add some vertical space between top of page and where text "Chapter N" starts
  % Above vertical spacing is a guess work so that the user-defined chapter's title's placement matches the star'ed version
  {\parindent \z@ \raggedright
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter% if in main text body (i.e. not ToC, LoC, LoF, ...)
        \fontarial{13.5}{15}
        \addfontfeature{LetterSpace=7.5}% LetterSpace: 1pt / 13.5pt * 100 = 7.4
        \MakeUppercase{\@chapapp}\space \thechapter
        \nobreak
        \vskip 1.5\p@
      \fi
    \fi
    \interlinepenalty\@M
    \fontarial{16.5}{18}
    \addfontfeature{LetterSpace=7.5}% LetterSpace: 1.5pt / 16.5pt * 100 = 9.1
    \MakeUppercase{#1}\par\nobreak
    \vskip 14\p@
  }}
\def\@schapter#1{\@makeschapterhead{#1}%
                 \@afterheading}
\def\@makeschapterhead#1{% star chapter
  \vspace*{50\p@}% Add some vertical space between top of page and where text "This Is The Chapter Title" starts
  {\parindent \z@ \raggedright
    \interlinepenalty\@M
    \fontarial{16.5}{18}
    \addfontfeature{LetterSpace=7.5}% LetterSpace: 1.5pt / 16.5pt * 100 = 9.1
    \uppercase{#1}\par\nobreak
    \vskip 14\p@
  }}

%%
%% End of Chapters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sections
%%

%% Parameters of \@startsection
%%  name: e.g., subsection
%%  level: a number, denoting depth of section - e.g., chapter = 0, section = 1, etc.
%%  indent: Indentation of heading from left margin; \z@ is short for zero
%%  beforeskip: Absolute value = skip to leave above the heading.
%%       If negative, then paragraph indent of text following heading is suppressed
%%  afterskip: If positive, then skip to leave below heading,
%%       else negative of skip to leave to right of run-in heading.
%%  style: Commands to set style. Since June 1996 release the last command in this
%%       argument may be a command such as \MakeUppercase or \fbox that takes an
%%       argument. The section heading will be supplied as the argument to this
%%       command. So setting #6 to, say, \bfseries\MakeUppercase would produce bold,
%%       uppercase headings.
%% If * is missing, then increment the counter. If it is present, then there should
%% be no [<altheading>] argument. The command uses the counter secnumdepth. It
%% contains a pointer to the highest section level that is to be numbered.

%% First level heading (swedish: unterrubrik 1)
%% LetterSpace: 1pt / 13.5pt * 100 = 7.4
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-18pt \@plus -4pt \@minus -2pt}%
                                   {2.8pt \@plus 2pt}%
                                   {\fontarial{13.5}{15}\addfontfeature{LetterSpace=7.5}\MakeUppercase}}

%% Second level heading (swedish: unterrubrik 2)
%% LetterSpace: 0.5pt / 10.5pt * 100 = 4.8
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-18pt \@plus -4pt \@minus -2pt}%
                                     {2.8pt \@plus 2pt}%
                                     {\fontarial{10.5}{11}\addfontfeature{LetterSpace=5}\MakeUppercase}}

%% Third level heading (swedish: unterrubrik 3)
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-5pt \@plus -2pt \@minus -.5pt}%
                                     {0.1pt}%
                                     {\fontarial{9.5}{11}}}

%% Fourth level heading: like third-level heading, but inline
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-5pt \@plus -2pt \@minus -.5pt}%
                                    {-1em}%
                                    {\fontarial{9.5}{11}}}

%%
%% End of Sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lists
%%

%% Modified from latex.ltx
\renewenvironment{enumerate}{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\setlength{\rightmargin}{0.33cm}	% Right margin indented 0.33 cm
        \usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
  \fi}{\endlist}

%% Modified from latex.ltx
\renewenvironment{itemize}{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\setlength{\rightmargin}{0.33cm}		% Right margin indented 0.33 cm
      \setlength\labelwidth{0.45em}		% Bullet positioned just to the
      \setlength\labelsep{0.5cm-\labelwidth}	% right of the left margi.
      \def\makelabel##1{\hss\llap{##1}}}%
  \fi}{\endlist}

\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}

\setlength\topsep{0pt}
\setlength\partopsep{\topsep}
\setlength\parsep{\parskip}
\setlength\itemsep{0pt}
\setlength\labelsep{0.75em}
\setlength\labelwidth{0.5cm}
\setlength\leftmargini{0mm}
\addtolength\leftmargini{\labelwidth}
\leftmarginii\leftmargini
\leftmarginiii\leftmargini
\leftmarginiv\leftmargini
\@beginparpenalty -\@lowpenalty
\@endparpenalty -\@lowpenalty
\@itempenalty -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{\theenumii}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

%\setlength  \labelsep  {.5em}
%\setlength  \labelwidth{\leftmargini}
%\addtolength\labelwidth{-\labelsep}
%\@beginparpenalty -\@lowpenalty
%\@endparpenalty   -\@lowpenalty
%\@itempenalty     -\@lowpenalty
%\renewcommand\theenumi{\@arabic\c@enumi}
%\renewcommand\theenumii{\@alph\c@enumii}
%\renewcommand\theenumiii{\@roman\c@enumiii}
%\renewcommand\theenumiv{\@Alph\c@enumiv}
%\newcommand\labelenumi{\theenumi.}
%\newcommand\labelenumii{(\theenumii)}
%\newcommand\labelenumiii{\theenumiii.}
%\newcommand\labelenumiv{\theenumiv.}
%\renewcommand\p@enumii{\theenumi}
%\renewcommand\p@enumiii{\theenumi(\theenumii)}
%\renewcommand\p@enumiv{\p@enumiii\theenumiii}
%\newcommand\labelitemi{\textbullet}
%\newcommand\labelitemii{\normalfont\bfseries \textendash}
%\newcommand\labelitemiii{\textasteriskcentered}
%\newcommand\labelitemiv{\textperiodcentered}

%%
%% End of Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Environments
%%

%% Description environment
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

%% Quote environment
\newenvironment{quote}{%
\par%
\smaller%
\begingroup%
\leftskip4em%
\rightskip\leftskip%
}{%
\par%
\endgroup%
}

%% Appendix environment
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

%%
%% End of Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parameters for existing environments
%%

%% Column separation in array = 5\arraycolsep
\setlength\arraycolsep{5\p@}

%% Column separation in tabular = 2\tabcolsep
\setlength\tabcolsep{6\p@}

%% Width of rules in array and tabular
\setlength\arrayrulewidth{.4\p@}

%% Space between adjacent rules in array and tabular
\setlength\doublerulesep{2\p@}

%% Amount of space put in by \ in tabbing environment
\setlength\tabbingsep{\labelsep}

%% Space between last line of text and footnotes in a minipage
\skip\@mpfootins = \skip\footins

%% Space around text in a \fbox
\setlength\fboxsep{3\p@}

%% Width of rules made by \fbox and \framebox
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}

%% Layout of equation numbers
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}

%%
%% End of Parameters for existing environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figures
%%

%% Figure counter
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}

%% Floating parameters
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}

%% Single and double column figures respectively
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

%%
%% End of Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables
%%

%% Table counter
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}

%% Floating parameters
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}

%% Generate number for caption
\def\fnum@table{\tablename\nobreakspace\thetable}

%% Single and double column tables respectively
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

%%
%% End of Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Captions for floating objects
%%

%% White space above and below caption
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

%% Called with caption number (e.g., "Figure 1.2:") and caption text
\long\def\@makecaption#1#2{%
  \relsize{-1}% slightly smaller font size for figure/table captions
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%		% Measure the width of the caption
  \ifdim \wd\@tempboxa >\hsize		% Does it fit on one line?
    #1: #2\par		% Yes, normal paragraph
  \else		% No, center
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%%
%% End of Captions for floating objects
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import font definitions
\RequirePackage{hisfont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Font changing
%%

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

%%
%% End of Font changing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents, list of figures, and list of tables
%%

%% Name of TOC
% This hack is necessary as making uppercase of 'innehåll' as defined by
% package 'babel' will result in 'INNEHåLL'
\iflanguage{swedish}{%
% if language is Swedish
\addto\captionsswedish{\renewcommand{\contentsname}{INNEH{\AA}LL}%
}
}{%
% if language other than Swedish, let 'babel' do its magic
}


%% Levels of headings included in table of contents
\setcounter{tocdepth}{2}

%% Width of page numbers
\newcommand\@pnumwidth{1.55em}

%% Width of right margin
\newcommand\@tocrmarg{0em}	% Flush right

%% Separation of dots (in mu units)
\newcommand\@dotsep{1.0}

%% Produce table of contents
\newcommand\tableofcontents{%
    \chapter*{\MakeUppercase{\contentsname}% manual make-uppercase necessary, automatic upper-casing inside \chapter* does not work(?)
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%		% Make the actual toc
    }

%% Format part entries in toc
%% Called with \numberline{<\thepart>}{<heading>} and <page>
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%	% Add some vertical space
    \setlength\@tempdima{3em}%		% Width of \numberline{<\thepart>}{<heading>}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth	% No indent, room for page numbers
      \parfillskip -\@pnumwidth		% No overfull messages
      {\leavevmode
      % Large number and heading, and
      % right flushed page number with osf
       \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
%% Called with \numberline{<\thechapter>}{<heading>} and <page>
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%% Format section entries in toc
%% Use definitions in latex.ltx
%% Called with \numberline{<\thesection>}{<heading>} and <page>
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}

%% Produce list of figures
\newcommand\listoffigures{%
    \chapter*{\MakeUppercase{\listfigurename}}% manual make-uppercase necessary, automatic upper-casing inside \chapter* does not work(?)
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%		% Make the actual lof
    }

%% Format figure entries in lof
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

%% Produce list of tables
\newcommand\listoftables{%
    \chapter*{\MakeUppercase{\listtablename}}% manual make-uppercase necessary, automatic upper-casing inside \chapter* does not work(?)
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%		% Make the actual lot
    }

%% Produce entry in lot
\let\l@table\l@figure

%%
%% End of Table of contents, list of figures, and list of tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Footnotes
%%

%% No rule above footnotes
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}

%% Format footnote
%% Called with text of footnote
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

%% Format the footnote markers that are printed in the text
%\def\@makefnmark{\hbox{\temfivespace\@textsuperscript{\normalfont\@thefnmark}}}

%%
%% End of Footnotes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialization
%%

%% Distance between two columns in two column mode
\setlength\columnsep{10\p@}

%% Width of rule between two columns in two column mode
\setlength\columnseprule{0\p@}

%% Use headings as default pag style
\pagestyle{headings}

%% Arabic page numbers
\pagenumbering{arabic}

%%
%% End of Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput

%%
%% End of file `his-thesis.cls'.
