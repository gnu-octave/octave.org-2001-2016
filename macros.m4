changequote([,])dnl
dnl
dnl __header__([TITLE], [opt_STYLE])
dnl
define([__header__], [dnl
<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<head>
  <title>$1</title>
  <link rel="stylesheet" type="text/css" href="octave.css" />
</head>
<body>
  <div id="container">
    <div id="logo">
      <p>
        <span id="logo-text">$1</span>
        <img border="0" src="images//logo.png" alt="[GNU Octave Logo]"/>
      </p>
    </div>
])dnl
dnl
dnl __footer__
dnl
define([__footer__], [dnl
    <div id="footer">
      <p>
        Copyright &copy; 1998-2013 John W. Eaton.  Verbatim copying
        and distribution is permitted in any medium, provided this
        notice is preserved.
      </p>
    </div>
  </div>
</body>
</html>
])dnl
dnl
dnl __nav_box_begin__
dnl __nav_box_button__([CURRENT_ID], [ID], [TEXT], [TARGET])
dnl __nav_box_end__
dnl
define([__nav_box_begin__], [<div id="nav-box">
])dnl
define([__nav_box_end__], [</div>
])dnl
define([__nav_button__], [dnl
  <div id="nav-button">
    <div id="nav-item">
      ifelse([$1], [$2], [<div id="currentnav">$3</div>], [<a href="$4">$3</a>])
    </div>
  </div>
])dnl
dnl
dnl The navigation buttons for all but the first page.
dnl
dnl __nav_buttons__
dnl
define([__nav_buttons__], [dnl
__nav_box_begin__
__nav_button__($1, [home], [Home], [index.html])
__nav_button__($1, [about], [About], [about.html])
__nav_button__($1, [download], [Download], [download.html])
__nav_button__($1, [support], [Support], [support.html])
__nav_button__($1, [get-involved], [Get Involved], [get-involved.html])
__donate_button__($1)
__nav_box_end__
])dnl
dnl
dnl __donate_button__
dnl
define([__donate_button__], [dnl
<div id="nav-button">
  <div id="nav-item">
    ifelse([$1], [donate], [<div id="currentnav">Donate</div>], [<a href="donate.html">Donate</a>])
    <div id="donate-blurb">
      Your donations help to fund continuing maintenance tasks,
      development of new features and the organization of Octave
      conferences.
    </div>
    <div id="donate-form">
      <form action='https://crm.fsf.org/civicrm/contribute/transact?reset=1&id=10'
            method="post">
        <div class="donate-field">
          <label>Amount (USD)</label>
          <div></div>
          $<input type="text" name="amount" size="5" value="50.00" tabindex="1" />
        </div>
        <div class="donate-field">
          <input type="radio" class="noborder"
                 name="method" value="othercc"
                 id="cb_method_other"
                 checked="checked"
                 tabindex="3" />
          <label for="cb_method_other">Pay with credit card</label>
        </div>
        <div class="donate-field">
          <div></div>
          <input type="radio" class="noborder"
                 name="method" value="paypal"
                 id="cb_method_paypal"
                 tabindex="4" />
          <label for="cb_method_paypal">Pay with PayPal</label>
        </div>
        <div class="donate-field">
          <input class="context" type="submit"
                 tabindex="99"
                 name="form.button.Continue"
                 value="Continue..." />
        </div>
      </form>
    </div>
    <div id="donate-blurb">
      Following the Continue link will take you to a Free Software Foundation
      page for payment processing.
    </div>
    <div id="bitcoin">
        <img src="images/donate-bitcoin.png"/>
        Bitcoin donations also accepted at <a
        href="bitcoin:1E6HchBMX1EfiJQhSUanuF4VYKk552tEHF">this address</a>.
        <div id="bitcoinaddress">
           1E6HchBMX1EfiJQhSUanuF4VYKk552tEHF
        </div>
    </div>   
  </div>
</div>
])dnl
dnl
dnl
dnl
dnl
dnl __nav_box_begin__
dnl __nav_box_button__([CURRENT_ID], [ID], [TEXT], [TARGET])
dnl __nav_box_end__
dnl
define([__top_buttons_begin__], [<div id="top-buttons"><ul>
])dnl
define([__top_buttons_end__], [</ul></div>
])dnl
define([__top_button__], [<li><a href="$2">$1</a></li>
])dnl
