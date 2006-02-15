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
	octave.in \
	projects.in

HTML_OUT := $(HTML_SRC:.in=.html)

FILES_TO_INSTALL = $(HTML_OUT) $(IMAGES) $(EXTRA_HTML)

SOURCES = $(HTML_SRC) $(IMAGES) $(EXTRA_HTML)

all: $(HTML_OUT)
.PHONY: all

$(HTML_OUT): macros.m4

%.html : %.in
	$(M4) $(MACRO_FILE) -D__FILE_NAME__=$(@F) $< > $@.t
	$(MV) $@.t $@

clean:
	rm -f $(HTML_OUT)
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
