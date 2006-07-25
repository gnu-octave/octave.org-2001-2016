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
define(`__COPYING__', `<div id="footer"><p>Copyright &copy; 1998-2006
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
 __nav_button__($1, `Octave', `octave.html', `Home')
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
 __nav_button__($1, `Octave Funding', `funding.html', `Funding')
 __nav_button__($1, `Acknowledgments', `acknowledgments.html', `Contributors')
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
<tr><th>Octave version</th>
<th>Version</th>
<th>Release Date</th></tr>
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
<caption>Download links for Octave</caption>
</table>')dnl
dnl
dnl
dnl
define(`__MAILING_LIST_INFO__',
`<p>__HTTP__(`www.cae.wisc.edu/mailman/listinfo/$2', `$1'): <i>$3</i><br/>
ifelse($#, 4, `$4<br/>')
To see the collection of prior posting to the list, visit the
__HTTP__(`www.cae.wisc.edu/pipermail/$2', `$1 archives').<br/>
You can (un)subscribe to the list by following instructions on the
__HTTP__(`www.cae.wisc.edu/mailman/listinfo/$2', `list information page').<br/>
</p>')dnl
dnl
dnl
dnl
define(`__MAIL_THREAD__',
`<a href="https://www.cae.wisc.edu/pipermail/octave-$1/$2-$3/$4.html"
class="mailthread">[Mailing List Thread]</a>')dnl
