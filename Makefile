M4 := m4

MACRO_FILE := macros.m4

HTML_SRC := \
  about.in \
  bugs.in \
  bug-fixes-4-0-1.in \
  commercial-support.in \
  community-news.in \
  donate.in \
  download.in \
  get-involved.in \
  index.in \
  license.in \
  missing.in \
  news.in \
  support-expectations.in \
  support.in

HTML_OUT := $(HTML_SRC:.in=.html)

all: $(HTML_OUT)
.PHONY: all

$(HTML_OUT): $(MACRO_FILE)

clean:
	rm -f $(HTML_OUT)
.PHONY: clean

%.html : %.in
	cat $(MACRO_FILE) $< | $(M4) > $@-t
	mv $@-t $@
