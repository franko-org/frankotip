{% set user_from = a._FROM_USER._NAME %}
{% set fiat_total_fmt = "%s%.2f" % (fiat_symbol, fiat_total) %}

Hello {{ user_from | replace('_', '\_') }}! Here's your account info.

coin|deposit address|balance
:---|:---|---:
{% for i in info %}
{%   set name_fmt = "%s (%s)" % (ctb._config.cc[i.coin].name, i.coin.upper()) %}
{%   set address_fmt = "%s ^[[ex]](%s%s) ^[[qr]](%s%s)" % (i.address, ctb._config.cc[i.coin].explorer.address, i.address, ctb._config.misc.qr_service_url, i.address) %}
{%   set coin_bal_fmt = "%.6g" % i.balance %}
{%   if i.fiat_balance %}
{%     set fiat_bal_fmt = " ^%s%.2f" % ( i.fiat_symbol, i.fiat_balance ) %}
{%   else %}
{%     set fiat_bal_fmt = "" %}
{%   endif %}
__{{ name_fmt }}__|{{ address_fmt }}|__{{ coin_bal_fmt }}{{ fiat_bal_fmt }}__
{% endfor %}
&nbsp;|&nbsp;|&nbsp;
__TOTAL__| |__{{ fiat_total_fmt }}__

Use addresses above to deposit coins into your account.

{% include 'footer.tpl' %}
