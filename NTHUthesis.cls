\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NTHUthesis}[August, 2022 v1.1 Typesetting theses for members of National Tsing Hua University, Hsinchu, Taiwan]

\LoadClass[a4paper,12pt]{report}

% Required packages
\RequirePackage[top=1in,bottom=1in]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{CJKutf8}
\RequirePackage{tocbibind}
\RequirePackage{hyperref}
\RequirePackage[encoding=UTF8]{zhnumber}

% Options
\DeclareOption{zhmode}{\gdef\zhmode{1}}
\DeclareOption{master}{\gdef\@degreeZH{碩}}
\DeclareOption{doctor}{\gdef\@degreeZH{博}}
\DeclareOption{nowatermark}{\gdef\nowatermark{1}}
\ProcessOptions\relax

% Watermark of NTHU
\ifdefined \nowatermark \else
    \RequirePackage{tikz}
    \RequirePackage{draftwatermark}
    \DraftwatermarkOptions{text=\tikz{\node[opacity=0.5]{\includegraphics[width=.5\paperwidth]{nthu-logo.pdf}};},angle=0}
\fi

% Default spacing
\setstretch{1.8}

% Declared variables
\newcommand{\titleZH}[1]{\gdef\@titleZH{#1}}
\newcommand{\titleEN}[1]{\gdef\@titleEN{#1}}
\newcommand{\instituteZH}[1]{\gdef\@instituteZH{#1}}
\newcommand{\studentID}[1]{\gdef\@studentID{#1}}
\newcommand{\studentZH}[1]{\gdef\@studentZH{#1}}
\newcommand{\studentEN}[1]{\gdef\@studentEN{#1}}
\newcommand{\advisorZH}[1]{\gdef\@advisorZH{#1}}
\newcommand{\advisorEN}[1]{\gdef\@advisorEN{#1}}
\newcommand{\yearZH}[1]{\gdef\@yearZH{#1}}
\newcommand{\monthZH}[1]{\gdef\@monthZH{#1}}

% Customized commands
\newcommand{\makecover}{
\begin{titlepage}
    \begin{center}
    \begin{spacing}{2.5}
        \Huge
        國~~立~~清~~華~~大~~學\\
        \@degreeZH~~士~~論~~文
    \end{spacing}
    \begin{spacing}{1.5}
    \LARGE
    \@titleZH\\
    \@titleEN
    \vfill
    \Large
    \begin{tabular}{l}
        系別：\@instituteZH\\
        學號：\@studentID\\
        研\hspace{0.3cm}究\hspace{0.3cm}生：\@studentZH~(\@studentEN)\\
        指導教授：\@advisorZH~(\@advisorEN)
    \end{tabular}\\
    \vspace{1.5\baselineskip}
    中~~華~~民~~國~~\zhdigits{\@yearZH}~~年~~\zhnumber{\@monthZH}~~月
    \end{spacing}
    \end{center}
\end{titlepage}
}

\newcommand{\maketoc}{
    \tableofcontents
    \clearpage
    \listoffigures
    \listoftables
    \clearpage
}

\newcommand{\makeenv}[3]{
    \newenvironment{#1}{
        \phantomsection
        \section*{\centerline{#2}}
        \addcontentsline{toc}{chapter}{#3}
    }{
        \clearpage
    }
}

% Customized environments
\ifdefined \zhmode
    \makeenv{abstractZH}{摘要}{中文摘要~(Chinese Abstract)}
    \makeenv{acknowledgementsZH}{誌謝}{中文誌謝~(Chinese Acknowledgements)}
    \makeenv{abstractEN}{Abstract}{英文摘要~(English Abstract)}
    \makeenv{acknowledgementsEN}{Acknowledgements}{英文誌謝~(English Acknowledgements)}
\else
    \makeenv{abstractZH}{摘要}{Abstract (Chinese)}
    \makeenv{acknowledgementsZH}{誌謝}{Acknowledgements (Chinese)}
    \makeenv{abstractEN}{Abstract}{Abstract}
    \makeenv{acknowledgementsEN}{Acknowledgements}{Acknowledgements}
\fi

% Customization for Chinese characters
\AtBeginDocument{\begin{CJK*}{UTF8}{bkai}}
\AtEndDocument{\end{CJK*}}
\ifdefined \zhmode
    \setlength{\parindent}{24pt}
    \RequirePackage{refcount}
    \RequirePackage{titlesec}
    \titleformat{\chapter}{\centering\Large\bfseries}{第\zhdigits{\thechapter}章}{12pt}{}
    \renewcommand{\contentsname}{目次~(Contents)}
    \renewcommand{\figurename}{圖}
    \renewcommand{\tablename}{表}
    \renewcommand{\listfigurename}{圖目錄~(List of Figures)}
    \renewcommand{\listtablename}{表目錄~(List of Tables)}
    \renewcommand{\bibname}{參考文獻~(Bibliography)}
    \newcommand{\chref}[1]{\hyperref[#1]{\zhnumber{\getrefnumber{#1}}}}
\fi
