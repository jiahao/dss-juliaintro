MAIN=main

pdf:
	latexmk -pdf $(MAIN) -auxdir=output -outdir=output

all: pdf
	make -C code/programs

check:
	chktex -n1 -n2 -n8 -n11 -n12 -n13 -n14 -n26 -n34 -n33 -n36 -n40 $(MAIN)
	biber --tool -V bibliography/biblio.bib
	rm -f bibliography/biblio_bibertool.bib

lint:
	biber --tool bibliography/biblio.bib --output-fieldcase=lower --isbn-normalise
	mv bibliography/biblio_bibertool.bib bibliography/biblio.bib

arxiv: pdf
	mkdir -p arxiv
	cp *.pdf output/*.bbl paper.tex *.cls *.bst arxiv
	#Download any new versions of packages here
	#e.g.
	#curl -o arxiv/algorithm2e.sty http://ctan.sharelatex.com/tex-archive/macros/latex/contrib/algorithm2e/tex/algorithm2e.sty
	#Test build
	cd arxiv && latexmk -pdf $(MAIN) -auxdir=arxivtest -outdir=arxivtest && rm -rf arxivtest
	cd arxiv && zip arxiv.zip *

clean:
	rm -rvf *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc $(MAIN).pdf aux output arxiv

travis:
	#Old latexmk doesn't understand auxdir and outdir options
	latexmk -pdf -pdflatex='pdflatex %S %O -interaction=nonstopmode -halt-on-error' $(MAIN)

