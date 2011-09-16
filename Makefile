CV=cv_jan_paesmans

LATEXFLAGS=-interaction=nonstopmode
DVIPSFLAGS=-t a4

DISTFILES=*.aux *.log *~ *.blg *.bbl *.dvi *.toc
CLEANFILES=$(DISTFILES) *.ps *.pdf

all: $(CV).pdf

%.aux: %.tex
	@echo "LATEX $<"
	$(Q)latex $(LATEXFLAGS) $<

%.dvi: %.tex %.aux
	@echo "LATEX $<"
	$(Q)latex $(LATEXFLAGS) $<

%.ps: %.dvi
	@echo "DVIPS $<"
	$(Q)dvips $< -o $@ $(DVIPSFLAGS)

%.pdf: %.tex
	@echo "PDFLATEX $<"
	$(Q)pdflatex $(LATEXFLAGS) $<

clean:
	@echo "CLEAN"
	$(Q)rm -f $(CLEANFILES)

distclean: clean
	@echo "DISTCLEAN"
	$(Q)rm -f $(DISTFILES)
