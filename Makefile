#
# Makefile to compiles the thesis and everything in between (cover, etc.)
#
# by Fernando Bevilacqua <fernando.bevilacqua@his.se>
# 2017-03-23
#
# Adapted from: https://raw.github.com/zma/makefile4latex/master/Makefile

THESIS_MAIN_FILE=example-thesis

pdf:
	xelatex ${THESIS_MAIN_FILE}
	biber ${THESIS_MAIN_FILE}
	xelatex ${THESIS_MAIN_FILE}
	xelatex ${THESIS_MAIN_FILE}

clean:
	rm -f ${THESIS_MAIN_FILE}.ps
	rm -f ${THESIS_MAIN_FILE}.pdf
	rm -f ${THESIS_MAIN_FILE}.log
	rm -f ${THESIS_MAIN_FILE}.aux
	rm -f ${THESIS_MAIN_FILE}.out
	rm -f ${THESIS_MAIN_FILE}.dvi
	rm -f ${THESIS_MAIN_FILE}.bbl
	rm -f ${THESIS_MAIN_FILE}.blg
	rm -f ${THESIS_MAIN_FILE}.bcf
	rm -f ${THESIS_MAIN_FILE}.lof
	rm -f ${THESIS_MAIN_FILE}.lot
	rm -f ${THESIS_MAIN_FILE}.run.xml
	rm -f ${THESIS_MAIN_FILE}.toc
