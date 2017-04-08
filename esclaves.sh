DossierMaitre="$(pwd)"
Partitions="ly"

TitreChant="$(zenity --entry --text 'Titre du chant :')"
NomFichiers="$(zenity --entry --text 'Nom des fichiers :')"
echo -n '\\titre{'$TitreChant'}\n\n%TODO:Partition:'"$TitreChant"':\\lilypondfile[staffsize=15]{'$Partitions/$NomFichiers'/'$NomFichiers.ly'}\n\n\\chanson[position=2col,numero=1]{'$Partitions'/'$NomFichiers'/'$NomFichiers'}'

echo '%Apercu:evince Fait/tmp.pdf:
%Cible:tmp:
\\documentclass[a6paper,latin,french,fontsize=9pt]{scrbook}

\\usepackage{gredoc}
\\usepackage{mudoc}
\\pagestyle{empty}

\\begin{document}

\\titre{'"$TitreChant"'}

%TODO:\\lilypondfile[staffsize=12]{'"$Partitions/$NomFichiers/$NomFichiers"'.ly}
\\chanson[position=2col,numero=1]{'"$Partitions/$NomFichiers/$NomFichiers"'}

\\end{document}' > tmp.tex


if [ ! -d $Partitions/$NomFichiers ] ; then
cp -r ly/00-Gabarit $Partitions/$NomFichiers

cd $Partitions/$NomFichiers

mv Chant.ly $NomFichiers.ly

mv Paroles.tex $NomFichiers.tex

echo "Titre: $TitreChant" > infos.txt

echo "Fichier: $NomFichiers" >> infos.txt

gedit $NomFichiers.tex &
fi

cd "$DossierMaitre"
gedit tmp.tex &
