DESTDIR = /usr/local/www/octave.org

INSTALL_DATA = install -m 644

MV := mv

M4 := m4

MACRO_FILE := macros.m4

EXTRA_HTML := FAQ.html NEWS-1.html NEWS-2.html giftform.html projects.html

IMG_TMP := octave-logo.jpg \
	octave-small-logo.jpg \
	sombrero.jpg \
	lorenz.jpg

IMAGES := $(addprefix images/, $(IMG_TMP))

GRAPHICS_M := example1.m example2.m
GRAPHICS_EPS := $(GRAPHICS_M:.m=.eps)
GRAPHICS_PNG := $(GRAPHICS_M:.m=.png)
GRAPHICS_SVG := $(GRAPHICS_M:.m=.svg)

HTML_SRC := about.in \
	acknowledgments.in \
	archive.in \
	bugs.in \
	docs.in \
	devmap.in \
	download.in \
	funding.in \
	graphics.in \
	gsoc-2008.in \
	help.in \
	help-wanted.in \
	index.in \
	license.in \
	news.in \
	projects.in \
	related.in

HTML_OUT := $(HTML_SRC:.in=.html)

FILES_TO_INSTALL = \
	$(HTML_OUT) \
	$(IMAGES) \
	$(EXTRA_HTML) \
	$(GRAPHICS_M) \
	$(GRAPHICS_PNG) \
	$(GRAPHICS_SVG)

SOURCES = $(HTML_SRC) $(IMAGES) $(EXTRA_HTML)

all: $(HTML_OUT)
.PHONY: all

graphics.html: $(GRAPHICS_M) $(GRAPHICS_PNG) $(GRAPHICS_SVG)

$(HTML_OUT): macros.m4

$(HTML_OUT) : %.html : %.in
	$(M4) $(MACRO_FILE) -D__FILE_NAME__=$(@F) $< > $@.t
	$(MV) $@.t $@

$(GRAPHICS_EPS) : %.eps : %.m
	octave --quiet --eval "make_figure ('$*', 'eps')"

$(GRAPHICS_PNG) : %.png : %.eps
	convert $< $@

$(GRAPHICS_SVG) : %.svg : %.m
	octave --quiet --eval "make_figure ('$*', 'svg')"

clean:
	rm -f $(HTML_OUT) $(GRAPHICS_EPS) $(GRAPHICS_PNG) $(GRAPHICS_SVG)
.PHONY: clean

define do-install
if [ ! -f $(DESTDIR)/$f -o $f -nt $(DESTDIR)/$f ] ; then \
  echo installing $f in $(DESTDIR) ; \
  $(INSTALL_DATA) $f $(DESTDIR)/$f ; \
fi

endef

install: all
	@$(foreach f, $(FILES_TO_INSTALL), $(do-install))
.PHONY: install

dist: 
	tar cf dist.tar $(SOURCES) Makefile macros.m4
	gzip --best dist.tar
.PHONY: dist
