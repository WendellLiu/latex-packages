.PHONY: install uninstall

TEXMF := $(HOME)/texmf/tex/latex
PACKAGES := $(basename $(notdir $(wildcard *.sty)))

install:
	@for pkg in $(PACKAGES); do \
		mkdir -p $(TEXMF)/$$pkg; \
		ln -sf $(PWD)/$$pkg.sty $(TEXMF)/$$pkg/$$pkg.sty; \
		echo "linked $$pkg.sty → $(TEXMF)/$$pkg/$$pkg.sty"; \
	done
	mktexlsr $(HOME)/texmf

uninstall:
	@for pkg in $(PACKAGES); do \
		rm -f $(TEXMF)/$$pkg/$$pkg.sty; \
		echo "removed $(TEXMF)/$$pkg/$$pkg.sty"; \
	done
	mktexlsr $(HOME)/texmf
