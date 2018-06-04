%%
%% Copyright 2013-2017 by Thomas Fischer <thomas.fischer@his.se>
%%
%% This file has been released under the following license:
%% Creative Commons Attribution-Share Alike 4.0 Unported
%% (CC-BY-SA 4.0)
%%
%% hisspik.cls is a LaTeX class for 'nailed' announcements
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hisspik}[2017/04/27 University of Skovde Thesis Spikblad class by Thomas Fischer]

\newcommand{\@documenttype}{\MakeUppercase{Academic Work}}
\newcommand{\@by}{by}
\newcommand{\@coatofarmsimagefilename}{CoatOfArms/HiSCoatOfArms-black-english}

\newcounter{@numberoflanguagesinoptions}
\DeclareOption{english}{%
\PassOptionsToPackage{swedish,main=USenglish}{babel}%
\stepcounter{@numberoflanguagesinoptions}
}
\DeclareOption{swedish}{%
\PassOptionsToPackage{USenglish,main=swedish}{babel}%
\renewcommand{\@documenttype}{\MakeUppercase{Akademisk Avhandling}}
\renewcommand{\@by}{av}
\renewcommand{\@coatofarmsimagefilename}{CoatOfArms/HiSCoatOfArms-black-swedish}
\stepcounter{@numberoflanguagesinoptions}
}

\ProcessOptions

\LoadClass{article}

% Import font definitions
\RequirePackage{hisfont}
% Import user's metadata such as title, name, ISBN, ...
\RequirePackage{hismetadata}
% The file 'metadata.tex' contains the user's metadata
% such as title, name, ISBN, ...
\input{metadata}

\RequirePackage[%
   a5paper,%
   margin=2cm,% default margin on all sides ...
   bottom=1.2cm,% ... except on the bottom side ...
   top=0.8cm,% ... and on the top side
   ]{geometry}

\RequirePackage{graphicx}

% Check that either 'english' or 'swedish' is specified as class option,
% but not both at the same time or none at all
\ifthenelse{\equal{\value{@numberoflanguagesinoptions}}{0}}{%
\PackageError{his-thesis}{One language must be specified as option: either 'english' or 'swedish'}{}%
}{%
\ifthenelse{\equal{\value{@numberoflanguagesinoptions}}{1}}{}{%
\PackageError{his-thesis}{Only one language may be specified as option: either 'english' or 'swedish'}{}%
}}

\RequirePackage{babel}

\renewcommand{\maketitle}{{%
\centering%
%
\includegraphics[width=3.72cm]{\@coatofarmsimagefilename}%
\par%
%
\vspace*{1.4cm}% TODO exact size
%
\hspace*{1mm}%
\begin{minipage}[t][2cm][t]{9.25cm}% TODO exact height
\centering%
\fontarial{9.5}{12.35}%
% \addfontfeature{LetterSpace=13.7}% FIXME breaks, wrong value?
\@titleUC%
\end{minipage}%
\par%
%
\vspace*{0.45cm}% TODO exact size
%
\begin{minipage}[t][0.65cm][t]{\linewidth}% TODO exact height
\centering%
\fontgeorgia{9.5}{9.5}%
\@by%
\end{minipage}%
\par%
%
\begin{minipage}[t][1.6cm][t]{\linewidth}% TODO exact height
\centering%
\fontarial{9.5}{13}%
% \addfontfeature{LetterSpace=11.6}% FIXME breaks, wrong value?
\@authorUC%
\end{minipage}%
\par%
%
\hspace*{1mm}%
\begin{minipage}[t][0.8cm][t]{\linewidth}% TODO exact height
\centering%
\fontarial{9.5}{12.35}%
% \addfontfeature{LetterSpace=13.7}% FIXME breaks, wrong value?
\@documenttype%
\end{minipage}%
\par%
%
\begingroup\centering%
\selectlanguage{swedish}%
\fontgeorgia{9.5}{12.16}% 9.5*1.28=12.16
% \addfontfeature{LetterSpace=-3.7}% FIXME Word uses reduced letter space, but not shown in PDF
för \@dissertationtype\ i \@dissertationarea\\%
\ifthenelse{\equal{\@decidedby}{}}{}{som enligt beslut av \@decidedby\\}%
kommer att försvaras offentligt\\%
\@defensedaytimeroom,
Högskolan~i~Skövde%
\par\bigskip%
\fontgeorgia{9.5}{12.16}% 9.5*1.28=12.16
% \addfontfeature{LetterSpace=-3.7}% FIXME Word uses reduced letter space, but not shown in PDF
Avhandling försvaras på \@spokenlanguage%
\par\bigskip%
\fontgeorgia{9.5}{12.16}% 9.5*1.28=12.16
% \addfontfeature{LetterSpace=-3.7}% FIXME Word uses reduced letter space, but not shown in PDF
Opponent: \@opponent%
\par\vfill%
\fontarial{8}{9}%
ISBN \@isbn%
\par\endgroup%
\newpage%
}%
\newgeometry{%
   margin=2cm,% default margin on all sides ...
   bottom=1.2cm,% ... except on the bottom side ...
   top=2.8cm,% ... and on the top side
}%
}

\AtBeginDocument{%
\pagestyle{empty}%
\setlength{\parskip}{0pt}%
\setlength{\parindent}{0pt}%
\fontgeorgia{9.5}{11}%
}



\newenvironment{spik}{%
\maketitle%
\vspace*{4cm plus 2cm minus 2cm}%
\section{\texorpdfstring{\MakeUppercase{Abstract}}{Abstract}}%
}%
{%
}
