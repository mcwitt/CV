% mcwcv.sty
% Custom curriculum vitae style
% Written by Matt Wittmann

\ProvidesClass{mcwcv}
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.min" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
\PassOptionsToClass{\CurrentOption}{article}}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass{article}

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

\newlength{\hintscolwidth}
\newlength{\sepcolwidth}
\newlength{\iconwidth}
\newlength{\photowidth}

\setlength{\hintscolwidth}{5em}
\setlength{\sepcolwidth}{1.5em}
\setlength{\iconwidth}{0.9em}
\setlength{\photowidth}{\hintscolwidth}

\colorlet{color1}{blue!70!green!90}
\colorlet{color2}{black!70}

\newenvironment{contactinfo}{\begin{itemize}\setlength\itemsep{0em}}{\end{itemize}}

\newenvironment{cvjobs}[1][0.3em]
  {\noindent\setlength\extrarowheight{#1}%
   \tabularx{\linewidth}[t]{@{}p{\hintscolwidth}@{\hskip\sepcolwidth}X@{}}}
  {\endtabularx}

\newenvironment{cvskills}[1][0.3em]
  {\noindent\setlength\extrarowheight{#1}%
   \tabularx{\linewidth}[t]{@{}p{\hintscolwidth}@{\hskip\sepcolwidth}>{\raggedright\arraybackslash}X@{}}}
  {\endtabularx}

\newcommand{\icon}[1]{\includegraphics[width=\iconwidth]{#1}}
\newcommand{\contactitem}[2]{\item[\icon{#1}]{\color{color2}\footnotesize #2}}
\newcommand{\hintstyle}[1]{\raggedleft\textcolor{color2}{#1}}

\newcommand{\cvjob}[5]{%
  \hintstyle{#1\ifx&#2&\else--#2\fi} & {#3. \textit{#4}.%
    \ifx&#5&\else{\newline\parbox[t]{\linewidth}{\leavevmode\color{color2}#5}}\fi}\\
}

\newcommand{\cvskill}[2]{\hintstyle{#1}&{#2}\\}
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
    \raisebox{0.6em}{\includegraphics[width=\photowidth]{\photo}}%
  }%
  \hskip\sepcolwidth%
  \parbox[b]{0.4\linewidth}{%
    {\Huge\firstname{} \lastname} \\[1em]
    {\Large\textcolor{color2}{\textit{\title}}}
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

\renewcommand*{\familydefault}{\sfdefault}

\titleformat{\section}  % Customize the \section command 
  {\Large\color{color1}}  % format
  {}    % label
  {0em} % sep                
  {}    % before
  %{\hskip\hintscolwidth \hskip\sepcolwidth}    % before
  [\titlerule]  % after
  
\titleformat{\subsection}
  {\large\color{color1}}
  {}
  {0em}
  {}
  %{\hskip\hintscolwidth \hskip\sepcolwidth}
  {}

\titlespacing*{\section}{0pt}{1em}{0.5em}
\titlespacing*{\subsection}{0pt}{0.5em}{0.25em}

\urlstyle{sf}


