
bib_files = $(wildcard ~/Library/texmf/bibtex/bib/*.bib)

all: cv.pdf

cv.pdf: cv.aux cv.bbl
	pdflatex cv
	pdflatex cv

publist.tex: $(bib_files)

cv.bbl: cv.aux cv.tex $(bib_files)
	bibtex cv

cv.aux: cv.tex
	pdflatex cv

clean:
	rm -rf cv.aux
	rm -rf cv.bbl
	rm -rf cv.log
	rm -rf cv.blg
	rm -rf cv.toc

show: cv.pdf
	open cv.pdf
