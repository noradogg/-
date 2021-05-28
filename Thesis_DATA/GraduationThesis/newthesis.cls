% --------------------------------------------------
% newthesis class
% Thesis template
%
% Copyright 2018 Shoma Matsui, Osaka City Univesity.
% --------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newthesis}[2018/10/01 v1.01 newthesis document class]

\newif\if@eng \@engfalse
\newif\if@jpn \@jpntrue
\DeclareOption{eng}{%
  \@engtrue
  \@jpnfalse
}

\newif\if@indentfirst \@indentfirstfalse
\DeclareOption{indentfirst}{%
  \@indentfirsttrue
}

\newcommand{\@spacing}{0}
\DeclareOption{singlespace}{%
  \renewcommand{\@spacing}{0}
}
\DeclareOption{onehalfspace}{%
  \renewcommand{\@spacing}{1}
}
\DeclareOption{doublespace}{%
  \renewcommand{\@spacing}{2}
}

\newif\if@hyperref \@hyperreffalse
\DeclareOption{hyperref}{%
  \@hyperreftrue
}

\newif\if@colorlink \@colorlinkfalse
\DeclareOption{colorlink}{%
  \@colorlinktrue
  \@hyperreftrue
}

\newif\if@times \@timestrue
\DeclareOption{lmodern}{%
  \@timesfalse
}

\ProcessOptions\relax

\if@eng
  \LoadClass[a4paper, 12pt]{report}
  \renewcommand{\figurename}{Fig.}
  \renewcommand{\tablename}{Table.}
  \if@indentfirst
    \RequirePackage{indentfirst}
  \fi
  \RequirePackage[
    top=50mm,
    bottom=40mm,
    textheight=166mm,
    textwidth=155mm,
    includeheadfoot,
    nohead,
  ]{geometry}
\else
  \LoadClass[a4paper, 12pt, uplatex, dvipdfmx, ja=standard]{bxjsreport}
  \geometry{%
    top=41mm,
    bottom=33mm,
    textheight=166mm,
    textwidth=130mm,
    nohead,
  }
\fi

\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{silence}
\WarningFilter{caption}{Unsupported document class}
\WarningFilter{biblatex}{File 'english-ieee.lbx'}
\WarningFilter{hyperref}{Token not allowed}
\RequirePackage{xkeyval, xparse}

\RequirePackage{lmodern}
\if@times
  \RequirePackage{newtxtext}
\fi
\RequirePackage{zi4}
\RequirePackage{setspace}
\RequirePackage{afterpage}
\RequirePackage{amsmath, amssymb}
\let\proof\relax
\let\endproof\relax
\RequirePackage{amsthm}
\RequirePackage{xcolor}
\interdisplaylinepenalty=2500
\RequirePackage[%
  style=ieee,
  doi=false,
  url=false,
  isbn=false,
  dashed=false,
  citestyle=numeric,
]{biblatex}

\ifnum\@spacing=0
  \singlespacing
\fi
\ifnum\@spacing=1
  \onehalfspacing
\fi
\ifnum\@spacing=2
  \doublespacing
\fi

\pagestyle{plain}
\setcounter{tocdepth}{2}

\if@eng
  \providecommand{\@abstractname}{Abstract}
  \providecommand{\@referencename}{References}
  \providecommand{\@acknowledgmentname}{Acknowledgments}
\else
  \providecommand{\@abstractname}{概~要}
  \providecommand{\@referencename}{参考文献}
  \providecommand{\@acknowledgmentname}{謝辞}
\fi

\newcommand{\thesisbib}{%
  \clearpage
  \pagenumbering{gobble}
  \begin{onehalfspace}
    \printbibliography[heading=bibintoc, title={\@referencename}]
  \end{onehalfspace}
}

\gdef\@affiliation{}
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\gdef\@keywords{}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\gdef\@subtitle{}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}

\if@hyperref
  \RequirePackage[%
    bookmarks=true,
    bookmarksnumbered=true,
    bookmarkstype=toc,
    bookmarksopen=true,
    linktocpage=false,
    hyperfootnotes=true,
    pdfpagelabels=true,
    pdfdisplaydoctitle=true,
  ]{hyperref}
  \if@jpn
    \RequirePackage{pxjahyper}
  \fi
  \if@colorlink
    \hypersetup{%
      colorlinks=true,
      citecolor=red,
      linkbordercolor=red,
      linkcolor=blue,
      urlcolor=blue,
      filecolor=teal,
    }
  \fi
\fi
\newcommand{\hyperrefsetpdfmetadata}{%
  \if@hyperref
    \hypersetup{%
      pdftitle={\@title},
      pdfsubject={\@subtitle},
      pdfauthor={\@author, \@affiliation},
      pdfkeywords={\@keywords},
      pdfcreator={LaTeX with newthesis package},
    }
  \fi
}

\renewcommand{\maketitle}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{singlespace}
      \centering
      \null
      \vbox to 8cm{%
        \vfil
        {\LARGE \@title}%
        \vfil
      }\par
      \vspace{3cm}
      {\Large \@date}\par
      \vspace{6.5mm}
      \if@jpn
      \vbox to 2cm{%
        \vfil%
          {\Large \@affiliation}%
        \vfil%
      }\par
      \fi
      \if@eng
      \vbox to 3cm{%
        \vfil%
          {\Large \@affiliation}%
        \vfil%
      }\par
      \fi
      \vspace{4mm}
      {\Large \@author}
    \end{singlespace}
  \end{titlepage}
}

\renewenvironment{abstract}{%
  \setcounter{page}{2}%
  \pagenumbering{gobble}%
  \null\vfil%
  \@beginparpenalty\@lowpenalty%
  \begin{center}
    {\bfseries \@abstractname}
    \@endparpenalty\@M
  \end{center}

  \begin{onehalfspace}
}{%
  \end{onehalfspace}
  \vfil
  \clearpage
  \pagenumbering{arabic}
}

\define@boolkey{Thesis}{nofigure}[true]{}
\define@boolkey{Thesis}{notable}[true]{}
\NewDocumentCommand{\thesisindex}{O{}}{%
  \setkeys{Thesis}{#1}
  \pagenumbering{roman}
  \begin{onehalfspace}
    \tableofcontents
    \ifKV@Thesis@nofigure\else\listoffigures\fi
    \ifKV@Thesis@notable\else\listoftables\fi
  \end{onehalfspace}
  \clearpage
  \pagenumbering{arabic}
}

\newenvironment{acknowledgment}{%
  \clearpage
  \pagenumbering{gobble}
  \chapter*{\@acknowledgmentname}\addcontentsline{toc}{chapter}{\@acknowledgmentname}
}{%
  \clearpage
}
