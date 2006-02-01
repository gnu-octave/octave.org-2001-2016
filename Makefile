ifeq ($(shell hostname), bevo.che.wisc.edu)
  SHELL = /usr/local/gnu/bin/bash
else
  ifeq ($(shell hostname), bahaha.che.wisc.edu)
    SHELL = /usr/local/gnu/bin/bash
  endif
endif

destdir = /usr/local/www/octave.org

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

HTML_SRC := acknowledgments.in \
	archive.in \
	bugs.in \
	docs.in \
	download.in \
	funding.in \
	help.in \
	help-wanted.in \
	history.in \
	license.in \
	news.in \
	octave.in

IMG_HTML := $(HTML_SRC:.in=.html)

TXT_HTML := $(addprefix text/, $(HTML_SRC:.in=.html))

FILES_TO_INSTALL = $(IMG_HTML) $(TXT_HTML) $(IMAGES) $(EXTRA_HTML)

SOURCES = $(HTML_SRC) $(IMAGES) $(EXTRA_HTML)

all: text $(IMG_HTML) $(TXT_HTML)
.PHONY: all

$(TXT_HTML) $(IMG_HTML): macros.m4

text:
	if [ -d text ]; then true; else mkdir text; fi

%.html : %.in
	$(M4) $(MACRO_FILE) -D__FILE_NAME__=$(@F) $< > $@.t
	$(MV) $@.t $@

text/%.html : %.in
	$(M4) -D__TEXT_MODE__=1 -D__FILE_NAME__=$(@F) $(MACRO_FILE) $< > $@.t
	$(MV) $@.t $@

clean:
	rm -f $(TXT_HTML) $(IMG_HTML)
	rmdir text
.PHONY: clean

define do-install
if [ ! -f $(destdir)/$f -o $f -nt $(destdir)/$f ] ; then \
  echo installing $f in $(destdir) ; \
  $(INSTALL_DATA) $f $(destdir)/$f ; \
fi

endef

install: all
	@$(foreach f, $(FILES_TO_INSTALL), $(do-install))
.PHONY: install

dist: 
	tar cf dist.tar $(SOURCES) Makefile macros.m4
	gzip --best dist.tar
.PHONY: dist
