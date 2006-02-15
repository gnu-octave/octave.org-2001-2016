define(`__IMAGE_DIR__', `images/')dnl
dnl
dnl
dnl
define(`__LINK__', `link="$1"')dnl
define(`__VLINK__', `vlink="$1"')dnl
define(`__ALINK__', `alink="$1"')dnl
define(`__TEXT__', `text="$1"')dnl
dnl
define(`__FACE__', `face="$1"')dnl
dnl
dnl
define(`__RULE__', `<hr />')dnl
dnl
dnl
define(`__DEFAULT_LINK_TEXT__', `ifelse($#, 2, `$1://$2', `$3')')dnl
define(`__HTTP__',
       ``<a href="http://$1">'__DEFAULT_LINK_TEXT__(`http', $*)`</a>'')dnl
define(`__MAILTO__',
       ``<a href="mailto:$1">'__DEFAULT_LINK_TEXT__(`http', $*)`</a>'')dnl
define(`__FTP__',
       ``<a href="ftp://$1">'__DEFAULT_LINK_TEXT__(`http', $*)`</a>'')dnl
dnl
define(`__OCTAVE_IMAGE__',
       ``<img src="'__IMAGE_DIR__`$1" alt="[$2]"'ifelse($#, 3, ` $3')` />'')dnl
dnl
define(`__OCTAVE_HTTP__', `<a href="$1">$2</a>')dnl
dnl
dnl
dnl
define(`__OCTAVE_FTP__',
       `__FTP__(ftp.octave.org/pub/octave/$1, $2)')dnl
dnl
dnl
dnl
define(`__HEADER__', `<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>$1</title>
<link rel="stylesheet" type="text/css" href="octave.css" />
</head>
<body>
')dnl
dnl
dnl
dnl
define(`__BIG_HEADER__', `__HEADER__($1)
  <table width="100%" class="title"><tr><td>
  __OCTAVE_IMAGE__(`octave-logo.jpg', `Octave')</td>
  <td style="text-align: right">__OCTAVE_IMAGE__(`lorenz.jpg', `Lorenz Attractor')</td></tr>
  </table>')dnl
dnl
dnl
dnl
define(`__SMALL_HEADER__', `__HEADER__($1)
<p>__OCTAVE_IMAGE__(`octave-small-logo.jpg', `Octave')</p>')dnl
dnl
dnl
dnl
define(`__COPYING__', `<p class="footer">Copyright &copy; 1998-2006
<a href="mailto:jwe@octave.org">John W. Eaton</a>.  Verbatim
copying and distribution is permitted in any medium, provided this
notice is preserved.</p>

<p class="footer">University of Wisconsin<br />
Department of Chemical Engineering<br />
Madison WI 53719</p></body></html>')dnl
dnl
dnl
dnl
define(`__nav_button__',
`ifelse(`$1', `$2',
  `$4',
  `__OCTAVE_HTTP__($3, $4)')')dnl
dnl
dnl
dnl
define(`__ext_nav_button__', `__HTTP__($1, $2)')dnl
dnl
dnl
dnl
define(`__NAVIGATION__',
`<div class="nav">
 [ __nav_button__($1, `home', `octave.html', `Home')
 | __nav_button__($1, `history', `history.html', `History')
 | __nav_button__($1, `news', `news.html', `News')
 | __nav_button__($1, `docs', `docs.html', `Docs')
 | __ext_nav_button__(`wiki.octave.org', `Wiki')
 | __nav_button__($1, `faq', `FAQ.html', `FAQ') 
 | __nav_button__($1, `help', `help.html', `Help') 
 | __nav_button__($1, `bugs', `bugs.html', `Bugs') 
 ]<br />
 [ __nav_button__($1, `license', `license.html', `License')
 | __nav_button__($1, `download', `download.html', `Download')
 | __nav_button__($1, `related', `related.html', `Related Projects')
 | __nav_button__($1, `archive', `archive.html', `Mailing List Archive')
 | __nav_button__($1, `funding', `funding.html', `Funding')
 | __nav_button__($1, `help-wanted', `help-wanted.html', `Help Wanted') ]
</div>
')dnl
dnl
dnl
dnl
define(`__OCTAVE_TRAILER__', `__NAVIGATION__(`$1')
__COPYING__')dnl
dnl
dnl
dnl
define(`__TITLE_BAR__',
`<table width="100%" cellpadding="3" border="0">
<tr>
<td align="left" class="header">
$1
</td>
</tr>
</table>')dnl
dnl
dnl
dnl
define(`__DOWNLOAD_INFO__',
`<table width="100%" cellpadding="3" border="0">
<tr><td><b>Octave version</b></td>
<td><b>Version</b></td>
<td><b>Release Date</b></td></tr>
<tr><td class="download">
__FTP__(`ftp.octave.org/pub/octave', `Stable') (also currently ancient and obsolete)</td>
<td class="download">$1
    (__OCTAVE_FTP__(`obsolete/octave-'$1`.tar.gz',`.tar.gz'))
    (__OCTAVE_FTP__(`obsolete/octave-'$1`.tar.bz2',`.tar.bz2'))
</td>
<td class="download">$2</td></tr>
<tr><td class="download">
__FTP__(`ftp.octave.org/pub/octave', `Testing') (you probably want this)</td>
<td class="download">$3
    (__OCTAVE_FTP__(`octave-'$3`.tar.gz',`.tar.gz'))
    (__OCTAVE_FTP__(`octave-'$3`.tar.bz2',`.tar.bz2'))
</td>
<td class="download">$4</td></tr>
<tr><td class="download">
__FTP__(`ftp.octave.org/pub/octave/bleeding-edge', `Development')  (latest features, but expect a few rough spots)</td>
<td class="download">$5
    (__OCTAVE_FTP__(`bleeding-edge/octave-'$5`.tar.gz',`.tar.gz'))
    (__OCTAVE_FTP__(`bleeding-edge/octave-'$5`.tar.bz2',`.tar.bz2'))
</td>
<td class="download">$6</td></tr>
</table>')dnl
