
bib_files = $(wildcard ~/Library/texmf/bibtex/bib/*.bib)

all: cv.pdf pub_list.pdf statement_of_research.pdf

cv.pdf: cv.aux cv.bbl
	pdflatex cv

cv.bbl: cv.aux $(bib_files)
	bibtex cv

cv.aux: cv.tex
	pdflatex cv

statement_of_research.pdf: statement_of_research.aux
	pdflatex statement_of_research

statement_of_research.aux: statement_of_research.tex
	pdflatex statement_of_research

# Make pub list
pub_list.pdf: pub_list.aux pub_list.bbl
	pdflatex pub_list

pub_list.bbl: pub_list.aux $(bib_files)
	bibtex pub_list

pub_list.aux: pub_list.tex
	pdflatex pub_list

clean:
	rm -rf cv.aux
	rm -rf cv.bbl
	rm -rf cv.log
	rm -rf cv.blg
	rm -rf cv.toc
	rm -rf pub_list.aux
	rm -rf pub_list.bbl
	rm -rf pub_list.log
	rm -rf pub_list.blg
	rm -rf pub_list.toc

show: cv.pdf pub_list.pdf
	open cv.pdf pub_list.pdf
