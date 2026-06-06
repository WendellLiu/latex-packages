.PHONY: install uninstall

TEXMF := $(HOME)/Library/texmf/tex/latex
PACKAGES := $(basename $(notdir $(wildcard *.sty)))

install:
	@for pkg in $(PACKAGES); do \
		mkdir -p $(TEXMF)/$$pkg; \
		rm -f $(TEXMF)/$$pkg/$$pkg.sty; \
		ln -s $(CURDIR)/$$pkg.sty $(TEXMF)/$$pkg/$$pkg.sty; \
		echo "linked $$pkg.sty → $(TEXMF)/$$pkg/$$pkg.sty"; \
	done
	mktexlsr $(HOME)/Library/texmf

uninstall:
	@for pkg in $(PACKAGES); do \
		rm -f $(TEXMF)/$$pkg/$$pkg.sty; \
		echo "removed $(TEXMF)/$$pkg/$$pkg.sty"; \
	done
	mktexlsr $(HOME)/Library/texmf
