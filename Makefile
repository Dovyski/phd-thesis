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

all: thesis cover spik

thesis:
	xelatex ${THESIS_FILE}
	biber ${THESIS_FILE}
	xelatex ${THESIS_FILE}
	xelatex ${THESIS_FILE}

cover:
	xelatex ${COVER_FILE}

spik:
	xelatex ${SPIK_FILE}

read: thesis
	open ${THESIS_FILE}.pdf

clean:
	rm -f *.pdf
	rm -f *.log
	rm -f *.aux
	rm -f *.out
	rm -f *.bbl
	rm -f *.blg
	rm -f *.bcf
	rm -f *.lof
	rm -f *.lot
	rm -f *.run.xml
	rm -f *.toc
