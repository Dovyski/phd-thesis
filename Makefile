#
# Makefile to compiles the thesis and everything in between (cover, etc.)
#
# by Fernando Bevilacqua <fernando.bevilacqua@his.se>
# 2017-03-23
#
# Adapted from: https://raw.github.com/zma/makefile4latex/master/Makefile

THESIS_FILE=example-thesis
COVER_FILE=example-thesis-cover
SPIK_FILE=example-thesis-spik
LATEX_CMD=xelatex
BIBTEX_CMD=biber

all: thesis cover spik

thesis:
	${LATEX_CMD} ${THESIS_FILE}
	${BIBTEX_CMD} ${THESIS_FILE}
	${LATEX_CMD} ${THESIS_FILE}
	${LATEX_CMD} ${THESIS_FILE}

cover:
	${LATEX_CMD} ${COVER_FILE}

spik:
	${LATEX_CMD} ${SPIK_FILE}

read: thesis
	open ${THESIS_FILE}.pdf

clean:
	-rm -f *.pdf
	-rm -f *.log
	-rm -f *.aux
	-rm -f *.out
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.bcf
	-rm -f *.lof
	-rm -f *.lot
	-rm -f *.run.xml
	-rm -f *.toc
	@echo All clean!
