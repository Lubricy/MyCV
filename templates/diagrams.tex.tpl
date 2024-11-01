\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50} % spellchecker:disable-line
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\smartdiagramset{
bubble center node font = \footnotesize,
bubble node font = \footnotesize,
% specifies the minimum size of the bubble center node
bubble center node size = 3cm,
%  specifies the minimum size of the bubbles
bubble node size = 0.4cm,
% specifies which is the distance among the bubble center node and the other bubbles
distance center/other bubbles = 0.4cm,
% sets the distance from the text to the border of the bubble center node
distance text center bubble = 0.4cm,
% set center bubble color
bubble center node color = pblue,
% define the list of colors usable in the diagram
set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
% sets the opacity at which the bubbles are shown
bubble fill opacity = 0.4,
% sets the opacity at which the bubble text is shown
bubble text opacity = 0.7,
}
\begin{center}
\smartdiagram[bubble diagram]{
\textbf{Python},
\textbf{Bash},
\textbf{HTML/CSS},
\textbf{Angular},
\textbf{NodeJS},
\textbf{C/C++},
\textbf{\LaTeX},
\textbf{Haskell},
\textbf{Tensorflow}
}
\end{center}
