BASENAME=PARC-C-Style-Guide

help:
	@echo "make pdf     - Make a PDF file."
	@echo "make clean   - Remove intermediate files."
	@echo "make clobber - Remove all build and intermediate files."

pdf: ${BASENAME}.toc
	pdflatex ${BASENAME}.tex

${BASENAME}.toc:
	pdflatex ${BASENAME}.tex

clean:
	rm -f ${BASENAME}.aux ${BASENAME}.log ${BASENAME}.toc

clobber: clean
	rm -f ${BASENAME}.pdf
