% cv.cls
% Custom CV style
% Written by Matt Wittmann

\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}

%% Article options
\DeclareOption{11pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Custom package options
\DeclareOption{sans}{
  \def\familydefault{\sfdefault}
  \def\light{\color{textgray}}
  \def\standout{}
}
\DeclareOption{serif}{
  \def\familydefault{\rmdefault}
  \def\standout{\bfseries}
  \def\light{}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Default options
\ExecuteOptions{11pt,sans}

\ProcessOptions\relax

\LoadClass[a4paper]{article}

%% Load additional packages
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage[cm]{fullpage}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{nopageno}
\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{xifthen}


%% Definitions
\newlength{\hintscolwidth}
\newlength{\sepcolwidth}
\newlength{\iconwidth}
\newlength{\photowidth}

\setlength{\hintscolwidth}{5em}
\setlength{\sepcolwidth}{1.5em}
\setlength{\iconwidth}{0.9em}
\setlength{\photowidth}{\hintscolwidth}

\colorlet{primary}{blue!70!green!90}
\colorlet{textgray}{black!70}
\newenvironment{contactinfo}{\begin{itemize}\setlength\itemsep{0em}}{\end{itemize}}

\newenvironment{cvjobs}[1][1em]
  {\noindent\setlength\extrarowheight{#1}%
   \tabularx{\linewidth}[t]{@{}p{\hintscolwidth}@{\hskip\sepcolwidth}X@{}}}
  {\endtabularx}

\newenvironment{cvskills}[1][1em]
  {\noindent\setlength\extrarowheight{#1}%
   \tabularx{\linewidth}[t]{@{}p{\hintscolwidth}@{\hskip\sepcolwidth}>{\raggedright\arraybackslash}X@{}}}
  {\endtabularx}

\newcommand{\icon}[1]{\includegraphics[width=\iconwidth]{#1}}
\newcommand{\contactitem}[2]{\item[\light\icon{#1}]{\light\footnotesize#2}}

\newcommand{\cvjob}[5]{%
  \leavevmode\light\raggedleft#1\ifthenelse{\isempty{#2}}{}{--#2} &
  {\leavevmode{\standout#3} $\,\cdot\,$ \textit{#4}}
  \ifthenelse{\isempty{#5}}{}{\newline\parbox[b]{\linewidth}{\leavevmode\light#5}}\\
}

\newcommand{\cvskill}[2]{\raggedleft\leavevmode\light#1&#2\\}
\newcommand{\name}[1]{\def\name{#1}}
\newcommand{\belowname}[1]{\def\belowname{#1}}
\newcommand{\summary}[1]{\def\summary{#1}}
\newcommand{\phone}[1]{\def\phone{#1}}
\newcommand{\email}[1]{\def\email{#1}}
\newcommand{\website}[1]{\def\website{#1}}
\newcommand{\linkedin}[1]{\def\linkedin{#1}}
\newcommand{\github}[1]{\def\github{#1}}
\newcommand{\address}[1]{\def\address{#1}}
\newcommand{\photo}[1]{\def\photo{#1}}
\newcommand\footnoteref[1]{\protected@xdef\@thefnmark{\ref{#1}}\@footnotemark}

\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
\renewcommand\labelitemi{$\circ$}

\setlist{nolistsep}
\setlist[itemize]{leftmargin=*}

\def\@maketitle{
  \noindent
  \ifx\photo\relax
    \parbox[b]{\hintscolwidth}{
      \color{primary}\fbox{\includegraphics[width=\photowidth]{\photo}}
    }%
    \hskip\sepcolwidth
  \fi
  \parbox[b]{0.65\linewidth}{
    {\Huge\name}\hfill
    {\large\light\textit{\belowname}}
  }%
  \hfill
  \parbox[b]{0.25\linewidth}{
    \begin{contactinfo}
      \ifx\address\relax\contactitem{mail}{\address}\fi
      \contactitem{phone}{\phone}
      \contactitem{email}{\url{\email}}
      \ifx\website\relax\contactitem{mouse}{\website}\fi
      \contactitem{lilogo}{\linkedin}
      \contactitem{github}{\github}
    \end{contactinfo}
  }
  \vspace{3em}

  \noindent\large\summary
}

\titleformat{\section}  % Customize the \section command 
  {\sffamily\Large\color{primary}}  % format
  {}    % label
  {0em} % sep                
  {}    % before
  %{\hskip\hintscolwidth \hskip\sepcolwidth}    % before
  [\titlerule]  % after
  
\titleformat{\subsection}
  {\sffamily\large\color{primary}}
  {}
  {0em}
  {}
  %{\hskip\hintscolwidth \hskip\sepcolwidth}
  {}

\titlespacing*{\section}{0pt}{1em}{0.5em}
\titlespacing*{\subsection}{0pt}{1em}{0.5em}

\endinput
