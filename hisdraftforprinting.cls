%%
%% Copyright 2016-2017 by Thomas Fischer <thomas.fischer@his.se>
%%
%% This file has been released under the following license:
%% Creative Commons Attribution-Share Alike 4.0 Unported
%% (CC-BY-SA 4.0)
%%
%% hisdraftforprinting.cls is a LaTeX class to paper-efficiently print a dissertation
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hisdraftforprinting}[2016/11/14 University of Skovde Paper-efficiently Printing Dissertation class by Thomas Fischer]

\LoadClass{article}

% Import font definitions
\RequirePackage{hisfont}
% Import user's metadata such as title, name, ISBN, ...
\RequirePackage{hismetadata}
% For time stamp: \thistime
\RequirePackage{scrtime}

\RequirePackage[%
a4paper,% print on A4 paper
landscape% landscape mode to put two pages next to each other
]{geometry}
\RequirePackage{pdfpages}% package to include multi-page PDF files

\RequirePackage{rotating}% package to rotate text

\RequirePackage[absolute]{textpos}% package to position text anywhere on page
\setlength{\TPHorizModule}{1mm}% defines coordinate system for textpos
\setlength{\TPVertModule}{1mm}% defines coordinate system for textpos

\setlength{\parindent}{0pt}% no indention at paragraphs' start
\setlength{\parskip}{0pt}% no vertical separation between paragraphs

\pagestyle{empty}% no page numbers

\newcommand{\dissertationpdf}[2][Not for publication!]{%
\includepdf[%
openright,% put an empty page before the first logical page
nup=2x1,% two horizontally-aligned pages
delta={1cm 0},% separate both pages horizontally  1cm
pages={1-},% from first page all the way to the end
frame=true,% put a frame around each inserted page
trim={22mm 28.5mm 22mm 28.5mm},% cut away the margin around each page
clip=true,% do not show what has been cut away
scale=0.95,% make inserted pages smaller to have some margin on paper
pagecommand={%
\begin{textblock}{10}(150,190)%
\begin{rotate}{90}%
\today, \thistime% insert current date here
\hspace{1cm}%
\@author% insert author as specified above
\hspace{1cm}%
#1% insert comment as specified above
\end{rotate}
\end{textblock}
}%
]{%
#2% PDF file to insert pages from
}
}
