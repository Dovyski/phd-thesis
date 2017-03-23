%%
%% Copyright 2016-2017 by Thomas Fischer <thomas.fischer@his.se>
%%
%% This file has been released under the following license:
%% Creative Commons Attribution-Share Alike 4.0 Unported
%% (CC-BY-SA 4.0)
%%
%% hiscover.cls is a LaTeX class for dissertation/licentiate report covers
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hiscover}[2016/12/22 University of Skovde Thesis Cover class by Thomas Fischer]

\newcommand{\@coatofarmsimagefilename}{CoatOfArms/HiSCoatOfArms-white-english}
\newcommand{\@localizeddoctoraldissertation}{Doctoral Dissertation}
\newcommand{\@localizedlicentiatethesis}{Licentiate Thesis}

\DeclareOption{english}{%
\PassOptionsToPackage{USenglish,swedish,main=USenglish}{babel}%
}
\DeclareOption{swedish}{%
\renewcommand{\@coatofarmsimagefilename}{CoatOfArms/HiSCoatOfArms-white-swedish}
\renewcommand{\@localizeddoctoraldissertation}{Doktorsavhandling}
\newcommand{\@localizedlicentiatethesis}{Licentiatexamen}
\PassOptionsToPackage{USenglish,swedish,main=swedish}{babel}%
}

\ProcessOptions

\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage[a4paper,showcrop=true,margin=20mm,top=45mm,bottom=10mm,layoutsize={166mm,240mm},layoutvoffset={28.5mm},layouthoffset={22mm}]{geometry}
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

% Color definitions
\RequirePackage[table,svgnames,dvipsnames]{xcolor}
\ifthenelse{\equal{\@publicationtype}{licentiate}}{\definecolor{specialpagebackground}{RGB}{68,72,78}}{\definecolor{specialpagebackground}{RGB}{86,34,97}}% update color for special pages' background
\definecolor{oxid}{RGB}{234,120,25}

\sodef\bookspinespacing{}{.1em}{8pt}{0pt}% TODO adjust last two parameters ('inner space' and 'outer space')

\newcommand{\cover}[4]{%
\begin{internalcoverpage}%
#1%
\end{internalcoverpage}%
\newpage%
\internalbookspine%
\newpage%
\internallastpage{#2}{#3}{#4}%
}

\newenvironment{internalcoverpage}{%
\begingroup%
\vphantom{A}% problems with completely empty pages ...
% absolute position, slightly larger/outside normal layout (166mm,240mm) at offset (22mm,28.5mm)
\begin{textblock}{170}(20,26)%
\begin{tikzpicture}[inner sep=0pt]%
% background inamge in rubin/purple using the laurel branch
\node[anchor=south west](backgroundimage) at (1mm,1mm) {%
\ifthenelse{\equal{\@publicationtype}{dissertation}}{% if dissertation ...
\includegraphics[width=170mm,height=244mm,keepaspectratio]{LaurelBranch/laurelbranch-rubin}%
}{%
\ifthenelse{\equal{\@publicationtype}{licentiate}}{% if licentiate ...
\includegraphics[width=170mm,height=244mm,keepaspectratio]{LaurelBranch/laurelbranch-grafit}%
}{%
}% end of inner if
}% end of outer if
};
\end{tikzpicture}%
\end{textblock}%

\begin{textblock}{138}(35,48.5)%
% Coat of Arms on page's top left side
\begin{minipage}[t][5.5cm][t]{\linewidth}%
\includegraphics[height=34.4mm,width=34.1mm,keepaspectratio]{\@coatofarmsimagefilename}%
\end{minipage}%
\par%
%
% user content comes here
}{%
% after user content:
\par%
\vspace*{9mm}\vfil%
%
\begin{minipage}[t]{\linewidth}%
\RaggedRight%
\color{white}%
\begingroup\fontgeorgia{13.5}{13.5}%
\ifthenelse{\equal{\@publicationtype}{dissertation}}{% if dissertation ...
\MakeUppercase{\coverpagesubjectspacing{\@localizeddoctoraldissertation}}%
}{% else (i.e. not dissertation) ...
\ifthenelse{\equal{\@publicationtype}{licentiate}}{% if licentiate ...
\MakeUppercase{\coverpagesubjectspacing{\@localizedlicentiatethesis}}%
}{% else (i.e. not licentiate) ...
????
}% end of inner if
}% end of outer if
\par\endgroup%
\vspace*{4mm}%
\begingroup\fontarial{25}{25}\MakeUppercase{\coverpagetitlespacing{\@title}}\par\endgroup%
\vspace*{1mm}%
\begingroup\fontarial{14.5}{14.5}\@subtitle\par\endgroup%
\vspace*{4mm}%
\begingroup\fontarial{14.5}{14.5}\color{oxid}\MakeUppercase{\@author}\par\endgroup%
\vspace*{1mm}%
\begingroup\fontgeorgia{12}{12}\textit{\subject}\par\endgroup%
\end{minipage}%
\end{textblock}%
\endgroup%
}



\newcommand{\internalbookspine}{
\begingroup%
\newgeometry{%
   margin=2mm,% default margin on all sides ...
   top=45mm,% more space on the top
   bottom=10mm,% less space on the bottom
   layoutsize={12mm,240mm},% the dissertations internal paper size
   layoutvoffset={28mm},% where to place the dissertation's pages on an A4 paper
   layouthoffset={90mm}%
}%
\vphantom{A}% problems with completely empty pages ...
% absolute position, slightly larger/outside normal layout (16mm,244mm) at offset (88mm,26mm)
\begin{textblock}{16}(88,26)%
\begin{tikzpicture}[inner sep=0pt]%
% background inamge in rubin/purple using the laurel branch
\fill[fill=specialpagebackground] (1mm,1mm) rectangle +(16mm,244mm);
\node[rotate=-90,color=white,anchor=west](author) at (9mm,220mm) {%
\begingroup\color{white}\fontarial{10}{10}%
\textbf{\color{oxid}\bookspinespacing{\MakeUppercase{\@author}}}%
\par\endgroup
};
\node[rotate=-90,below=1cm of author.east,anchor=west,color=white,text width=12cm,align=left](title) {%
\begingroup\color{white}\fontarial{10}{10}%
\bookspinespacing{\MakeUppercase{\@title}}%
\par\endgroup
};
\node[rotate=-90,below=1cm of title.east,anchor=west,color=white](year) {%
\begingroup\color{white}\fontarial{10}{10}%
\@year%
\par\endgroup
};
\end{tikzpicture}%
\end{textblock}%
\restoregeometry
\endgroup
}



\newcommand{\internallastpage}[3]{%
\begingroup%
\vphantom{A}% problems with completely empty pages ...
% absolute position, slightly larger/outside normal layout (168mm,240mm) at offset (21mm,28.5mm)
\begin{textblock}{172}(19,26)%
\begin{tikzpicture}[inner sep=0pt]%
% background inamge in rubin/purple using the laurel branch
\fill[fill=specialpagebackground] (1mm,1mm) rectangle +(172mm,244mm);
\end{tikzpicture}%
\end{textblock}%

\begin{textblock}{88}(61,48.5)%
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
\begingroup\fontarial{12}{12}\MakeUppercase{\@author}\par\endgroup%
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
\node[text width=88mm,align=flush center](number) at (28mm,-175mm) {%
\begingroup\fontarial{7.5}{11}%
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
