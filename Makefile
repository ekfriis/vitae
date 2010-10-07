
bib_files = $(wildcard ~/Library/texmf/bibtex/bib/*.bib)

all: cv.pdf pub_list.pdf

cv.pdf: cv.aux cv.bbl
	pdflatex cv
	pdflatex cv

cv.bbl: cv.aux cv.tex $(bib_files)
	bibtex cv

cv.aux: cv.tex
	pdflatex cv

# Make pub list
pub_list.pdf: pub_list.aux pub_list.bbl
	pdflatex pub_list
	pdflatex pub_list

pub_list.bbl: pub_list.aux pub_list.tex $(bib_files)
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
