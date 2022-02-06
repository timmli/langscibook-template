SHELL := /bin/bash

LANGSCI_FILES =  myMacros.tex \
	references.bib \
	langsci-paper-template.org \
	latexmkrc \
	$(wildcard packages/*.sty) \
	langscibook/*.sty \
	langscibook/*.cls \
	langscibook/seriesinfo \
	langscibook/unchanged \
  langsci-fonts/fonts/Arimo* \
  langsci-fonts/fonts/Libertinus* \
  langsci-fonts/fonts/DejaVu* \
  langsci-fonts/fonts/XITSMath* \
  fontspec.tex \

test_langsci:
	rm -fr test
	mkdir test
	cp -r --parents $(LANGSCI_FILES) test/
	mv test/langscibook/* test
	rm -fr test/langscibook
	mv test/langsci-fonts/* test
	rm -fr test/langsci-fonts

release_langscibook:
	rm -fr temp
	mkdir temp
	cp -r --parents $(LANGSCI_FILES) temp
	mv temp/langscibook/* temp
	rm -fr temp/langscibook
	mv temp/langsci-fonts/* temp
	rm -fr temp/langsci-fonts
	cd temp; zip -r langscibook-template.zip *; mv langscibook-template.zip ..
	rm -fr temp
