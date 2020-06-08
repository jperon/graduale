#!/bin/bash
DossierMaitre="$(pwd)"
Partitions="ly"

TitreChant="$2"
NomFichiers="$1"

echo $NomFichier $TitreChant

echo '%Apercu:evince Fait/tmp.pdf:
%Cible:tmp:
\documentclass[a6paper,latin,french,fontsize=9pt]{scrbook}

\usepackage{gredoc}
\usepackage{mudoc}
\pagestyle{empty}

\begin{document}

\subsection*{'"$TitreChant"'}

%TODO:\lilypondfile[staffsize=12]{'"$Partitions/$NomFichiers/$NomFichiers"'.ly}
\chanson[numero=1]{'"$Partitions/$NomFichiers/$NomFichiers"'}

\end{document}' > tmp.tex

make tmp
