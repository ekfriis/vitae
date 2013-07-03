
bib_files = $(wildcard ~/Library/texmf/bibtex/bib/*.bib)

all: friis_cv.pdf pub_list.pdf statement_of_research.pdf

# Get everything ready to send
package: friis_cv.pdf pub_list.pdf statement_of_research.pdf
	mkdir -p package
	cp friis_cv.pdf package/friis_cv.pdf
	cp pub_list.pdf package/friis_pub_list.pdf
	cp statement_of_research.pdf package/friis_statement_of_research.pdf

friis_cv.pdf: friis_cv.tex
	latexmk friis_cv.tex 

statement_of_research.pdf: statement_of_research.tex
	latexmk statement_of_research.tex

# Make pub list
pub_list.pdf: statement_of_research.tex
	latexmk pub_list

clean:
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.log
	rm -rf *.blg
	rm -rf *.toc
	rm -rf *.pdf
	rm -rf *.fls
	rm -rf *.out
	rm -rf *.fdb_latexmk

show: friis_cv.pdf pub_list.pdf
	open friis_cv.pdf pub_list.pdf
