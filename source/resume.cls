%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vignesh Iyer                                 %
% MS CSE ASU                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/03/18 v0.1 Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

% set document margins
\usepackage[left=0.5 in,top=0.4in,right=0.5in,bottom=0.2in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\usepackage{ragged2e}
\usepackage{blindtext}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
\usepackage[scaled]{helvet} % Load the Helvetica font
\renewcommand\familydefault{\sfdefault} % Set the default font family to sans-serif
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

\def \separator {\textbf{\Large\textbullet}}

\newcommand\printNameTitle[1]{%
    \begingroup
    \hfill{\Huge\bfseries #1}\hfill
    \break
    \vspace{-0.5em}
    \hrule
    \endgroup
}

\newcommand{\printContactInformation}{%
    \vspace{-0.3em} % remove vertical space above
    \begin{center}
        \ifcommandkey{phone}{%
            \commandkey{phone}%
            \ifcommandkey{email}{ \separator\ }%
            {\ifcommandkey{linkedin}{ \separator\ }%
                {\ifcommandkey{github}{ \separator\ }%
                    {}}}%
        }{}%
        \ifcommandkey{email}{%
            \email{\commandkey{email}}%
            \ifcommandkey{location}{ \separator\ }%
            {\ifcommandkey{github}{ \separator\ }%
                {\ifcommandkey{linkedin}{ \separator\ }%
                    {}}}%
        }{}%
        \ifcommandkey{location}{%
            \commandkey{location}%
            \ifcommandkey{github}{ \separator\ }{}%
        }{}%
        \ifcommandkey{github}{%
            \profilelink{\commandkey{github}}%
            \ifcommandkey{linkedin}{ \separator\ }{}%
        }{}%
        \ifcommandkey{linkedin}{%
            \profilelink{\commandkey{linkedin}}%

        }{}%
    \end{center}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}

\newkeycommand{\introduction}[fullname,email,phone,linkedin,github,location,]{
    \printNameTitle{\commandkey{fullname}}
    \printContactInformation
}

\newcommand{\Objective}[1]{
    \textbf{\MakeUppercase{career objective}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
    #1
}

\newenvironment{summary}{
    \textbf{\MakeUppercase{Summary}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
    \begin{list}{}{ % List for each individual item in the section
            \setlength{\leftmargin}{0em} % Margin within the section
        }
        \item[]
            }{
    \end{list}
}

\newkeycommand{\summaryItem}[bulletin]{
    {\commandkey{bulletin}}
}

\newcommand{\skills}{
    \textbf{\MakeUppercase{Technical skills}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\skillItem}[category, skills]{
    { \textit{\textbf{\commandkey{category}}}: }{\commandkey{skills}}
}

\newenvironment{workSection}[1]{
    \textbf{\MakeUppercase{#1}}
    \vspace{0.4em} % todo vspace
    \hrule
    \vspace{-0.3em}
    \begin{list}{}{ % List for each individual item in the section
            \setlength{\leftmargin}{0em} % Margin within the section
        }
        \item[]
            }{
    \end{list}
}


\newkeycommand{\experienceItem}[company, position, location, duration]{
    {\commandkey{company}\hfill{\commandkey{location}}\\
            \textit{\textbf{\commandkey{position}}}\hfill
            \textit{\textbf{\commandkey{duration}}}}\\
    \vspace{-11pt}
}

\newkeycommand{\experienceItemOneLine}[org,title,location,time,summary]{
    {\commandkey{org}}: {\textit{\textbf{\commandkey{title}}}}%
    % \ifcommandkey{summary}{: {\commandkey{summary}}}{}%
    \hfill%
    % \ifcommandkey{location}{\commandkey{location} | }{}%
    \ifcommandkey{time}{\textit{\textbf{\commandkey{time}}}}{}%
}


\newkeycommand{\customItem}[title, duration, keyHighlight]{
    \textbf{\commandkey{title}} \hfill {\commandkey{duration}} \\
    \ifcommandkey{keyHighlight}{\commandkey{keyHighlight}}{}
}

\newcommand{\education}{
    \textbf{\MakeUppercase{Education}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\educationItem}[university,college,program,location,graduation,coursework]{
{\textit{\textbf{\commandkey{program}}}} | {\commandkey{university}}\hfill
{\ifcommandkey{location}{\commandkey{location}}{}} |
{\ifcommandkey{graduation}{\textit{\textbf{\commandkey{graduation}}}}{}} \\
%\ifcommandkey{college}{\commandkey{college}}{} %\\
%\ifcommandkey{coursework}{Relevant coursework: \commandkey{coursework}}{}
}