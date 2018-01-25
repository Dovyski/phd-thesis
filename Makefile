################################################################################
# Makefile to compile "his-thesis" and everything in between (cover, etc.)
#
# Just place this file in the folder where the Latex files of your thesis are,
# then run:
#
#  make thesis
#
# to generate the compiled PDF of your thesis. The compilation will take a while
# depending on the size of the thesis. This command will not compile the extra
# docs that exist in the project, e.g cover and spik. You can compile such
# extra docs independently. To compile the cover file, run:
#
#  make cover
#
# To compile the spik file, run:
#
#  make spik
#
# If you want to compile everything at once (thesis, cover and spik), run:
#
#  make all
#
# You can delete any compiled PDF and all generated Latex intermediate files
# by running:
#
#  make clean
#
# Notice that it will remove *ALL* PDF files in the directory, not only the
# compiled thesis.
# Since you will be compiling and reading you thesis a lot, there is a command
# to compile the PDF and then open it:
#
#  make read
#
# This makefile was created by Fernando Bevilacqua <fernando.bevilacqua@his.se>
# on 2017-03-23.
# Adapted from: https://raw.github.com/zma/makefile4latex/master/Makefile
#
#
# Copyright 2017 Fernando Bevilacqua <fernando.bevilacqua@his.se>
#
# This file has been released under the following license:
# Creative Commons Attribution-Share Alike 4.0 Unported
# (CC-BY-SA 4.0)
################################################################################

# Information about which files will be used as the starting point
# to compile the whole project. By default the file "example-thesis.tex"
# is the main project for the thesis.
THESIS_FILE=example-thesis
COVER_FILE=example-thesis-cover
SPIK_FILE=example-thesis-spik

# Information about the Latex and bibtex compilers to be used.
LATEX_CMD=xelatex
BIBTEX_CMD=biber

# Which command is used to open the PDF for reading
# On windows/Mac, use "open". On Linux, use "xdg-open".
PDF_READING_CMD=open

# Below are the rules used in this makefile.

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
	${PDF_READING_CMD} ${THESIS_FILE}.pdf

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
