FICHIER = "00-Document"
LATEX_CMD = lualatex -interaction=batchmode -shell-restricted -synctex=1
EXPORTS = export TEXINPUTS="lib:" ; export shell_escape_commands=bibtex,bibtex8,kpsewhich,makeindex,mpost,repstopdf,gregorio,lilypond

document:
	($(EXPORTS) ; $(LATEX_CMD) $(FICHIER))

schola:
	($(EXPORTS) ; $(LATEX_CMD) '\def\dest{schola}\input{$(FICHIER)}' ; $(LATEX_CMD) '\def\dest{schola}\input{$(FICHIER)}')
	cp Fait/$(FICHIER).pdf .

debug:
	($(EXPORTS) ; lualatex -shell-restricted -synctex=1 $(FICHIER))

final:
	($(EXPORTS) ; $(LATEX_CMD) $(FICHIER) ; $(LATEX_CMD) $(FICHIER))
