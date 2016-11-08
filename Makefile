.PHONY: all clean distclean

all: lover.html lover.pdf

lover.html: lover.rst lover.css
	rst2html --no-section-numbering --stylesheet=lover.css $<  > $@
	sed -i s/Contents/Innhold/ $@

lover.tex: lover.rst
	rst2latex --language=no --documentclass=scrartcl --documentoptions=a4paper,11pt,bigheading --no-section-numbering $< > $@

lover.pdf: lover.tex
	pdflatex $<
	pdflatex $<

clean: lover.tex
	$(RM) *.log *.aux *.out *.toc
	$(RM) $<

distclean: clean
	$(RM) lover.pdf lover.html
