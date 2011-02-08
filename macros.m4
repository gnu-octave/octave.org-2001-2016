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
define(`__HTTPS__',
       ``<a href="http://$1">'__DEFAULT_LINK_TEXT__(`https', $*)`</a>'')dnl
define(`__MAILTO__',
       ``<a href="mailto:$1">'__DEFAULT_LINK_TEXT__(`http', $*)`</a>'')dnl
define(`__FTP__',
       ``<a href="ftp://$1">'__DEFAULT_LINK_TEXT__(`ftp', $*)`</a>'')dnl
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
define(`__GNU_FTP__',
       `__FTP__(ftp.gnu.org/gnu/octave/$1, $2)')dnl
define(`__GNU_ALPHA_FTP__',
       `__FTP__(alpha.gnu.org/gnu/octave/$1, $2)')dnl
dnl
dnl
dnl
define(`__HEADER__', `<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<head>
<title>$1</title>
<link rel="stylesheet" type="text/css" href="octave.css" />
</head>
<body>
<div id="title"><h1>$1</h1></div>
__NAVIGATION__(`$1')
<div id="content">')dnl
dnl
dnl
dnl
define(`__COPYING__', `<div id="footer"><p>Copyright &copy; 1998-2010
<a href="mailto:jwe@octave.org">John W. Eaton</a>.  Verbatim
copying and distribution is permitted in any medium, provided this
notice is preserved.</p>

<p>University of Wisconsin<br />
Department of Chemical Engineering<br />
Madison WI 53719</p></div></body></html>')dnl
dnl
dnl
dnl
define(`__nav_button__',
`ifelse(`$1', `$2',
  `<div id="currentnav">$4</div>',
  `__OCTAVE_HTTP__($3, $4)')')dnl
dnl
dnl
dnl
define(`__ext_nav_button__', `__HTTP__($1, $2)')dnl
dnl
dnl
dnl
define(`__NAVIGATION__',
`<div id="nav">
 __nav_button__($1, `Octave', `index.html', `Home')
 __nav_button__($1, `About Octave', `about.html', `About Octave')
 __nav_button__($1, `Octave News Archive', `news.html', `News Archive')
 __nav_button__($1, `Octave Documentation', `docs.html', `Docs')
 __ext_nav_button__(`wiki.octave.org', `Wiki')
 __nav_button__($1, `faq', `FAQ.html', `FAQ') 
 __nav_button__($1, `Octave Help', `help.html', `Help') 
 __nav_button__($1, `Bugs!', `bugs.html', `Bugs') 
 __nav_button__($1, `Octave Copyright Information', `license.html', `License')
 __nav_button__($1, `Downloading Octave', `download.html', `Download')
 __nav_button__($1, `Related Projects', `related.html', `Related Projects')
 __nav_button__($1, `Octave Mailing Lists', `archive.html', `Mailing Lists')
 __nav_button__($1, `Octave Chat', `chat.html', `Chat')
 __nav_button__($1, `Octave Funding', `funding.html', `Funding')
 __nav_button__($1, `Acknowledgments', `acknowledgments.html', `Contributors')
 __nav_button__($1, `Developers Map', `devmap.html', `Developers Map')
 __nav_button__($1, `Octave Projects', `help-wanted.html', `Help Wanted')
</div>
')dnl
dnl
dnl
dnl
define(`__OCTAVE_TRAILER__', `__COPYING__
</div>')dnl
dnl
dnl
dnl
define(`__TITLE_BAR__', `<h2>$1</h2>')dnl
dnl
dnl
dnl
define(`__DOWNLOAD_INFO__',
`<table width="100%" cellpadding="3" border="0" summary="Download Links for Octave">
<tr><th>Octave version label</th>
<th>Version number</th>
<th>Release Date</th></tr>
<tr><td class="download">
__FTP__(`ftp.octave.org/pub/octave', `Stable')</td>
<td class="download">$1
    (__GNU_FTP__(`octave-'$1`.tar.gz',`.tar.gz'))
    (__GNU_FTP__(`octave-'$1`.tar.bz2',`.tar.bz2'))
</td>
<td class="download">$2</td></tr>
ifelse($#, 4, `<tr><td class="download">
__FTP__(`alpha.gnu.org/gnu/octave', `Development')</td>
<td class="download">$3
    (__GNU_ALPHA_FTP__(`octave-'$3`.tar.gz',`.tar.gz'))
    (__GNU_ALPHA_FTP__(`octave-'$3`.tar.bz2',`.tar.bz2'))
</td>
<td class="download">$4</td></tr>')
</table>')dnl
dnl
dnl
dnl
define(`__MAILING_LIST_INFO__',
`<dt>__HTTP__(`www.cae.wisc.edu/mailman/listinfo/$2', `$1'): $3</dt>
<dd>
To see the collection of prior posting to the list, visit the
__HTTP__(`www-old.cae.wisc.edu/pipermail/$2', `$1 archives').<br/>
You can (un)subscribe to the list by following instructions on the
__HTTP__(`www.cae.wisc.edu/mailman/listinfo/$2', `list information page').<br/>
</dd>')dnl
dnl
dnl
dnl
define(`__MAIL_THREAD__',
`<a href="https://www-old.cae.wisc.edu/pipermail/octave-$1/$2-$3/$4.html"
class="mailthread">[Mailing List Thread]</a>')dnl
dnl
dnl
dnl
define(`__GRAPHICS_EXAMPLE__',
`<h4><a href="$1.m">$2</a></h4>
  <div id="plot">
    <object data="$1.svg" width="600" height="480">
      <img src="$1.png">
    </object>
  </div>'
)dnl
