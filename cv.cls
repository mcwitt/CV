% cv.cls
% Custom CV style
% Written by Matt Wittmann

\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}

%% Article options
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Custom package options
\DeclareOption{sans}{
  \def\familydefault{\sfdefault}
  \def\urlstylearg{sf}
  \def\light{\color{textgray}}
  \def\heavy{}
}
\DeclareOption{serif}{
  \def\familydefault{\rmdefault}
  \def\urlstylearg{rm}
  \def\heavy{\bf}
  \def\light{}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Default options
\ExecuteOptions{10pt,sans}

\ProcessOptions\relax

\LoadClass[a4paper]{article}

%% Load additional packages
\RequirePackage{array}
\RequirePackage[
    style=numeric-comp,
    %sorting=ydnt,
    sorting=none,
    doi=false,
    url=false
  ]{biblatex}
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

\newenvironment{cvjobs}[1][0.5em]
  {\noindent\setlength\extrarowheight{#1}%
   \tabularx{\linewidth}[t]{@{}p{\hintscolwidth}@{\hskip\sepcolwidth}X@{}}}
  {\endtabularx}

\newenvironment{cvskills}[1][0.5em]
  {\noindent\setlength\extrarowheight{#1}%
   \tabularx{\linewidth}[t]{@{}p{\hintscolwidth}@{\hskip\sepcolwidth}>{\raggedright\arraybackslash}X@{}}}
  {\endtabularx}

\newcommand{\icon}[1]{\includegraphics[width=\iconwidth]{#1}}
\newcommand{\contactitem}[2]{\item[\light\icon{#1}]{\light\footnotesize#2}}

\newcommand{\cvjob}[5]{%
  \leavevmode\light\raggedleft#1\ifthenelse{\isempty{#2}}{}{--#2} & {\leavevmode\heavy#3. \textit{#4}.}%
  \ifthenelse{\isempty{#5}}{}{\newline\parbox[t]{\linewidth}{\leavevmode\light#5}}\\
}

\newcommand{\cvskill}[2]{\raggedleft\leavevmode\light#1&#2\\}
\newcommand{\name}[2]{\def\firstname{#1}\def\lastname{#2}}
\renewcommand{\title}[1]{\def\title{#1}}
\newcommand{\phone}[1]{\def\phone{#1}}
\newcommand{\email}[1]{\def\email{#1}}
\newcommand{\website}[1]{\def\website{#1}}
\newcommand{\linkedin}[1]{\def\linkedin{#1}}
\newcommand{\researchgate}[1]{\def\researchgate{#1}}
\newcommand{\address}[1]{\def\address{#1}}
\newcommand{\photo}[1]{\def\photo{#1}}

\setlist{nolistsep}

\def\@maketitle{%
  \noindent
  \parbox[b]{\hintscolwidth}{%
    \raisebox{0.6em}{\color{primary}\fbox{\includegraphics[width=\photowidth]{\photo}}}%
  }%
  \hskip\sepcolwidth%
  \parbox[b]{0.4\linewidth}{%
    {\Huge\heavy\firstname{} \lastname}\\[1em]
    {\Large\light\textit{\title}}
    \vspace{1em}
  }%
  \hfill%
  \parbox[b]{0.2\linewidth}{%
    \begin{contactinfo}
      \contactitem{mail}{\address}
      \contactitem{phone}{\phone}
      \contactitem{email}{\url{\email}}
    \end{contactinfo}
  }%
  \parbox[b]{0.3\linewidth}{%
    \begin{contactinfo}
      \contactitem{mouse}{\url{\website}}
      \contactitem{lilogo}{\linkedin}
      \contactitem{rglogo}{\researchgate}
    \end{contactinfo}
  }%
}

\titleformat{\section}  % Customize the \section command 
  {\Large\heavy\color{primary}}  % format
  {}    % label
  {0em} % sep                
  {}    % before
  %{\hskip\hintscolwidth \hskip\sepcolwidth}    % before
  [\titlerule]  % after
  
\titleformat{\subsection}
  {\large\heavy\color{primary}}
  {}
  {0em}
  {}
  %{\hskip\hintscolwidth \hskip\sepcolwidth}
  {}

\titlespacing*{\section}{0pt}{1em}{0.5em}
\titlespacing*{\subsection}{0pt}{0.5em}{0.25em}

\urlstyle{\urlstylearg}

\endinput
