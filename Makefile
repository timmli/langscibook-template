SHELL := /bin/bash

LANGSCI_FILES =  myMacros.tex \
	references.bib \
	langsci-paper-template.org \
	latexmkrc \
	$(wildcard packages/*.sty) 

release_jlm:
	rm -fr temp
	mkdir temp
	cp -r --parents $(LANGSCI_FILES) temp
	cp -r langscibook/langsci temp/
	cd temp; zip -r langsci-template.zip *; mv langsci-template.zip ..
	rm -fr temp
