<%
' for Example : URL= http://www.judaismshop.com/pages/a.bat"
'				Or
'				URL= http://www.judaismshop.com/judaism/pages/a.bat"
'				Or
'				URL= http://w.judaismshop.com/judaism/pages/a.bat"
if thisName="a.bat" then redirectTo="http://www.judaismshop.com/?sp=5"

'HEBREW SITE
If thisName="main" Then redirectTo="http://www.judaismshop.com/"
If thisName="history.html" Then redirectTo="http://www.judaismshop.com/?sp=14"
If thisName="history.html" Then redirectTo="http://www.judaismshop.com/?sp=14"
If thisName="faq.html" Then redirectTo="http://www.judaismshop.com/?sp=23"
If thisName="what_new.html" Then redirectTo="http://www.judaismshop.com/?sp=22"
If thisName="what_new_16.html" Then redirectTo="http://www.judaismshop.com/?sp=22"
If thisName="featurs.html" Then redirectTo="http://www.judaismshop.com/?sp=21"
If thisName="featurs_16.html" Then redirectTo="http://www.judaismshop.com/?sp=21"
If thisName="support.html" Then redirectTo="http://www.judaismshop.com/?sp=17"
If thisName="support_16.html" Then redirectTo="http://www.judaismshop.com/?sp=bar-ilan-responsa-support"
If thisName="form_kesher.html" Then redirectTo="https://secure13.livessl.com/bubbles/judaism/pages/forms/form_kesher.html" 'fff form
If thisName="history_2.html" Then redirectTo="http://www.judaismshop.com/?sp=15"
If thisName="history.html" Then redirectTo="http://www.judaismshop.com/?sp=14"
If thisName="order_trom.html" Then redirectTo="http://www.judaismshop.com/?sp=24"

'what in
If thisName="what_in_2.1.html" Then redirectTo="http://www.judaismshop.com/?sp='what-in-bar-ilan-responsa"
If thisName="what_in.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_2.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_3.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_4.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_5.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_6.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_7.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
If thisName="what_in_8.html" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"
 
  

'Vitrual tour change it when end to work on it
If thisName="v_t_1.html" Then redirectTo="http://www.judaismshop.com/?sp=bar-ilan-responsa-virtual-tour-1"
If thisName="v_t_2.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_2.html"
If thisName="v_t_3.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_3.html"
If thisName="v_t_4.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_4.html"
If thisName="v_t_5.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_5.html"
If thisName="v_t_6.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_6.html"
If thisName="v_t_7.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_7.html"
If thisName="v_t_8.html" Then redirectTo="http://www.bua.co.il/pages/tour/v_t_8.html"


If thisName="likud.html" Then redirectTo="http://www.judaismshop.com/"


'If thisName=".html" Then redirectTo="http://www.judaismshop.com/?sp="


'MAAMARIM
If thisName="articles.asp?t=read&id=8" Then redirectTo="http://www.judaismshop.com/?sp=28" ' pea
If thisName="articles.asp?t=read&id=12" Then redirectTo="http://www.judaismshop.com/?sp=29" ' masehat sofrim
If thisName="articles.asp?t=read&id=29" Then redirectTo="http://www.judaismshop.com/?sp=30" ' sale
If thisName="articles.asp?t=read&id=25" Then redirectTo="http://www.judaismshop.com/?sp=32"'otzrot israel
If thisName="articles.asp?t=read&id=9" Then redirectTo="http://www.judaismshop.com/?sp=31"' otzot hashut
If thisName="articles.asp" Then redirectTo="http://www.judaismshop.com/?sp=19"

'ENGLISH
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="faq.html") Then redirectTo="http://www.judaismshop.com/?sp=47"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="what-new.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=46"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="contents.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=45"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="features.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=44"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="suppurt.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=43"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="vitual-tour") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=50"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="history.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=42"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="otzrot-yisrael.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=49"
If httphost="judaismshop.com/pages/bar-ilan-responsa" And (thisName="special-sale.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/"


'new
If thisName="what-in" Then redirectTo="http://www.judaismshop.com/?sp=what-in-bar-ilan-responsa"


'www.judaismshop.com/judaism/pages/forms/
'If httphost="judaismshop.com/judaism/pages/forms" And (thisName="ishur.asp?a=lead&id=25786") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=42"
'If httphost="www.judaismshop.com/judaism/pages/forms/" And (thisName="ishur.asp?a=lead&id=25817") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=42"
'If thisName="contents.html" Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=45"
'If thisName="contents.html" Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/?sp=45"
If thisName="bar-ilan-responsa.html" Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/"
If httphost="judaismshop.com" And (thisname="index.html" Or thisname="main.html") Then redirectTo="http://www.judaismshop.com/"
If httphost="judaismshop.com/bar-ilan-responsa" And (thisname="index.html" Or thisname="main.html") Then redirectTo="http://www.judaismshop.com/Bar-Ilan-Responsa/"
'httphost="judaismshop.com/pages/bar-ilan-responsa" And (
'response.addheader "y",httphost &"," &  thisname
%>