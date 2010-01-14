
all: cv.pdf

cv.pdf: cv.aux cv.bbl
	pdflatex cv
	pdflatex cv

cv.bbl: cv.aux my_papers.bib cv.tex
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
