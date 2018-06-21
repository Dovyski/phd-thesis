%%
%% Copyright 2016-2018 by Thomas Fischer <thomas.fischer@his.se>
%%
%% This file has been released under the following license:
%% Creative Commons Attribution-Share Alike 4.0 Unported
%% (CC-BY-SA 4.0)
%%
%% hiscover.cls is a LaTeX class for dissertation/licentiate report covers
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hiscover}[2018/06/20 University of Skovde Thesis Cover class by Thomas Fischer]

\newcommand{\@coatofarmsimagefilename}{CoatOfArms/HiSCoatOfArms-white-english}
\newcommand{\@localizeddoctoraldissertation}{Doctoral Dissertation}
\newcommand{\@localizedlicentiatethesis}{Licentiate Thesis}
\newcommand{\@localizedresearchproposal}{Research Proposal}
\newcommand{\@localizedthesisproposal}{Thesis Proposal}

\newcounter{@numberoflanguagesinoptions}
\DeclareOption{english}{%
\PassOptionsToPackage{swedish,main=USenglish}{babel}%
\stepcounter{@numberoflanguagesinoptions}
}
\DeclareOption{swedish}{%
\renewcommand{\@coatofarmsimagefilename}{CoatOfArms/HiSCoatOfArms-white-swedish}
\renewcommand{\@localizeddoctoraldissertation}{Doktorsavhandling}
\renewcommand{\@localizedlicentiatethesis}{Licentiatexamen}
\renewcommand{\@localizedresearchproposal}{Forskningsförslag}% TODO correct translation?
\renewcommand{\@localizedthesisproposal}{Avhandlingsförslag}% TODO correct translation?
\PassOptionsToPackage{USenglish,main=swedish}{babel}%
\stepcounter{@numberoflanguagesinoptions}
}

\ProcessOptions

\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackage{pagecolor}
\RequirePackage{graphicx}
\RequirePackage[paperwidth=176mm,paperheight=250mm,margin=20mm,top=45mm,bottom=10mm]{geometry}
\RequirePackage{luatex85}% required for \pdfpageheight and \pdfpagewidth

% Check that either 'english' or 'swedish' is specified as class option,
% but not both at the same time or none at all
\ifthenelse{\equal{\value{@numberoflanguagesinoptions}}{0}}{%
\PackageError{his-thesis}{One language must be specified as option: either 'english' or 'swedish'}{}%
}{%
\ifthenelse{\equal{\value{@numberoflanguagesinoptions}}{1}}{}{%
\PackageError{his-thesis}{Only one language may be specified as option: either 'english' or 'swedish'}{}%
}}

\RequirePackage{babel}

\RequirePackage[absolute]{textpos}
\setlength{\TPHorizModule }{1mm}
\setlength{\TPVertModule }{1mm}

\PassOptionsToPackage{table,svgnames,dvipsnames}{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

% Import font definitions
\RequirePackage{hisfont}
\RequirePackage{histextformatting}
\RequirePackage{hismetadata}

\pagestyle{empty}
\setlength{\parskip}{0pt}
\setlength{\parindent}{0pt}

\definecolor{oxid}{RGB}{234,120,25}

\sodef\bookspinespacing{}{.1em}{8pt}{0pt}% TODO adjust last two parameters ('inner space' and 'outer space')

\newcommand{\cover}[4]{%
\begin{internalcoverpage}%
#1%
\end{internalcoverpage}%
\eject \pdfpagewidth 198mm \pdfpageheight 250mm% Set paper size to 198mm x 250mm
\newpage%
\internalbookspine%
\internallastpage{#2}{#3}{#4}%
}

\newenvironment{internalcoverpage}{%
\begingroup%
\vphantom{A}% problems with completely empty pages ...
\begin{textblock}{176}(0,0)%
\begin{tikzpicture}[inner sep=0pt]%
% background inamge in rubin/purple using the laurel branch
\ifthenelse{\equal{\@publicationtype}{dissertation}}{% if dissertation ...
\node[anchor=south west](backgroundimage) at (0mm,0mm) {\includegraphics[width=176mm,height=250mm,keepaspectratio]{LaurelBranch/laurelbranch-rubin}};%
}{%
\ifthenelse{\equal{\@publicationtype}{licentiate}}{% if licentiate ...
\node[anchor=south west](backgroundimage) at (0mm,0mm) {\includegraphics[width=176mm,height=250mm,keepaspectratio]{LaurelBranch/laurelbranch-grafit}};%
}{%
% no background image for 'thesisproposal' or 'researchproposal'
}% end of if licentiate
}% end of if dissertation
\end{tikzpicture}%
\end{textblock}%

\begin{textblock}{138}(18,21)%
% Coat of Arms on page's top left side
\includegraphics[height=35mm,width=35mm,keepaspectratio]{\@coatofarmsimagefilename}%
\vspace*{3cm plus 5mm minus 5mm}%
\par%
%
% user content comes here
}{%
% after user content:
\par%
\vspace*{5mm}\vfil%
%
\begin{minipage}[t]{\linewidth}%
\RaggedRight%
\color{white}%
\begingroup\fontgeorgia{13}{13}%
\ifthenelse{\equal{\@publicationtype}{dissertation}}{% if dissertation ...
\MakeUppercase{\coverpagesubjectspacing{\@localizeddoctoraldissertation}}%
}{% else (i.e. not dissertation) ...
\ifthenelse{\equal{\@publicationtype}{licentiate}}{% if licentiate ...
\MakeUppercase{\coverpagesubjectspacing{\@localizedlicentiatethesis}}%
}{% else (i.e. not licentiate) ...
\ifthenelse{\equal{\@publicationtype}{researchproposal}}{% if licentiate ...
\MakeUppercase{\coverpagesubjectspacing{\@localizedresearchproposal}}%
}{% else (i.e. not research proposal) ...
\ifthenelse{\equal{\@publicationtype}{thesisproposal}}{% if thesisproposal ...
\MakeUppercase{\coverpagesubjectspacing{\@localizedthesisproposal}}%
}{% else (i.e. not thesis proposal) ...
% tertium non datur
}% end of if thesisproposal
}% end of if researchproposal
}% end of if licentiate
}% end of if dissertation
\par\endgroup%
\vspace*{4mm}%
\begingroup\fontarial{25}{25}\MakeUppercase{\coverpagetitlespacing{\@title}}\par\endgroup%
\vspace*{1mm}%
\begingroup\fontarial{14.5}{14.5}\@subtitle\par\endgroup%
\vspace*{4mm}%
\begingroup\fontarial{14.5}{14.5}\color{oxid}\MakeUppercase{\@author}\par\endgroup%
\vspace*{1mm}%
\begingroup\fontgeorgia{12}{12}\textit{\@subject}\par\endgroup%
\end{minipage}%
\end{textblock}%
\endgroup%
}



\newcommand{\internalbookspine}{
\vphantom{A}% problems with completely empty pages ...
\begin{textblock}{22}(176,20)%
\centering%
\begin{tikzpicture}[inner sep=0pt]%
\node[rotate=-90,color=white,anchor=west](author) {%
\begingroup\color{white}\fontarial{8.5}{8.5}%
\textbf{\color{oxid}\bookspinespacing{\MakeUppercase{\@author}}}%
\par\endgroup
};
\node[rotate=-90,below=3mm of author.east,anchor=west,color=white,align=left](title) {%
\begingroup\color{white}\fontarial{8.5}{8.5}%
\bookspinespacing{\MakeUppercase{\@title}}%
\par\endgroup
};
\node[rotate=-90,below=3mm of title.east,anchor=west,color=white](year) {%
\begingroup\color{white}\fontarial{8.5}{8.5}%
\@year%
\par\endgroup
};
\end{tikzpicture}%
\par%
\end{textblock}%
}



\newcommand{\internallastpage}[3]{%
\begingroup%
\vphantom{A}% problems with completely empty pages ...
\begin{textblock}{88}(50,50)%
\begin{tikzpicture}[inner sep=0mm]%
\color{white}% use white text color due to dark purple background
%
% Photo
\node[minimum width=31.05mm,minimum height=37.25mm](photobg){%
};% end of \node(photobg)
\node[left=0mm of photobg.south west,anchor=south west](photo){%
\includegraphics[height=37.25mm,width=31.05mm,keepaspectratio]{#1}%
};% end of \node(photo)
%
% Name
\node[right=4mm of photobg.south east,anchor=south west,text width=53.75mm](name){%
\begingroup\fontarial{10}{10}\MakeUppercase{\@author}\par\endgroup%
};%
%
% User content (abstract)
\node[below=5mm of photobg.south west,anchor=north west,text width=88mm,text justified](abstract){%
\begingroup\fontsize{12}{13}%
% user content comes here
#2%
% after user content:
\par\endgroup%
};% end of \node(abstract)


\ifthenelse{\equal{#3}{}}{}{% only if collaboration partner is defined ...
% Horizontal white line
\draw[line width=1pt,white]([yshift=-3mm]abstract.south west)--([yshift=-3mm]abstract.south east);

% Collaboration text and logo
\node[below=12mm of abstract.south west,anchor=north west,text width=88mm,align=flush center](collaborationlabel){%
\begingroup\fontarial{7}{7.5}\MakeUppercase{In collaboration with}\par\endgroup%
};% end of \node(collaborationlabel)
\node[below=3mm of collaborationlabel](collaborationlogo){%
\includegraphics[width=27.5mm,height=27.5mm,keepaspectratio]{#3}%
};% end of \node(collaborationlogo)
}% end of "only if collaboration partner is defined ..."
%
% ISBN and Dissertation Number
\node[text width=88mm,align=flush center,below=169mm of photo.north west,anchor=north west](number) {%
\begingroup\fontarial{8.5}{11}%
ISBN \@isbn\\%
Dissertation Series, No.~\@seriesnumber~(\@year)%
\par\endgroup%
};% end of \node(number)
%
\end{tikzpicture}%
\end{textblock}%
\endgroup%
\clearpage
}
