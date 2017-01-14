
<%
dim myMail,strTpl


strTpl="<!DOCTYPE HTML PUBLIC""-//IETF//DTD HTML//EN""><html dir=rtl><head></head><body dir=rtl><table border=1 cellpadding=5 align=center>#thetable#</body></html>" 


dim i,l,tt

for each i in request.form
	tt=tt & request.form(i) 
	l=l & "<tr><td>" & i & "</td><td>" & request.form(i) & "</td></tr>"
next

if len(tt) <9 then response.End

If Len(request.Form("טלפון"))=0 Then
	isBuy=True
Else
	isBuy=False
End If
psik="yErlsofd" 'NOT delete it
 l=l &  "<tr><td>נשלח ב:</td><td>" & now & "</td></tr>"
' l=l &  "<tr><td>נשלח ב:</td><td>" & dateadd("h",-1,now) & "</td></tr>" ' בגלל שעון קיץ, השרת לא מכוון, יתכן שצריך לשנות בחורף - this is wrong 

If request("girsa")="16p" Then 
				price=2510				
			ElseIf request("girsa")="16" Then
				price=2160				
				ElseIf request("girsa")="16-16plus upgrade"  Then '16 version
				price=350
				ElseIf request("girsa")="15plus-16plus upgrade" Or request("girsa")="15-16 upgrade" Then '15 version
				price=370	
				ElseIf request("girsa")="14plus-16plus upgrade" Or request("girsa")="14-16 upgrade" Then '14 version
				price=470	
				ElseIf request("girsa")="13plus-16plus upgrade" Or request("girsa")="13-16 upgrade" Then  '13 version
				price=570
				ElseIf request("girsa")="12plus-16plus upgrade" Or request("girsa")="12-16 upgrade" Then   '12 version
				price=670	
				ElseIf request("girsa")="11plus-16plus upgrade" Or request("girsa")="11-16 upgrade" Then	'11 version
				price=670	
				ElseIf request("girsa")="10plus-16plus upgrade" Or request("girsa")="10 or less to 16" Then	'10or less version
				price=670	
				ElseIf request("girsa")="15 - 16plus" Then
				price=370+350	
				ElseIf request("girsa")="14 - 16plus" Then
				price=470+350	
				ElseIf request("girsa")="13 - 16plus" Then
				price=570+350
				ElseIf request("girsa")="12 - 16plus" Then
				price=670+350	
				ElseIf request("girsa")="11 - 16plus" Then
				price=670+350	
				ElseIf request("girsa")="10 or less to 16 plus" Then
				price=670+350		
End If

If Len(request.Form("DiscountPrice"))>0 Then 
price=request("DiscountPrice")
End If

If request("girsa")="16p" Then
	emla=price*0.3-70
ElseIf request("girsa")="16" Then
	emla=price*0.3
Else
	emla=price/10
End If

If(isBuy) Then l=l&"<tr><td>מחיר</td><td>" & price & "</td></tr>"

If(isBuy=false) Then 
emla=0

'write it to file lids.csv
	with CreateObject("scripting.filesystemobject")
	if request.servervariables("https")="on" then
		x= server.mappath("lids.csv")
	else
		x= server.mappath("judaism/pages/forms/lids.csv")
	end if
	'response.write x
	with .opentextfile( x,8,true)
		line=request("שם מלא") & psik&"'" &request("טלפון")&psik &request("אימייל")&psik& Now &psik&"TTTT"&psik
		' בגלל שעון קיץ, השרת לא מכוון, יתכן שצריך לשנות בחורף - this is wrong 
		line=Replace(line,",",";")'replace the psikim from the user with ';'
		line=Replace(line,psik,",") 'replace virtual psik with real psik to csv file.
			.writeline line
			.close	
		End with
	End with
	response.write "<br>פנייתכם התקבלה - נציגנו יצור אתכם קשר בהקדם:"
	response.write "<br>מספר פניה:"

End If

Randomize timer
Set conn=CreateObject("ADODB.connection")
str="DRIVER={MySQL ODBC 3.51 Driver}; harSet=utf8;stmt=set names hebrew;SERVER=localhost; DATABASE=data; UID=bubbles;PASSWORD=14248405; OPTION=3"
conn.open str,""
If Len(request.Form("טלפון"))=0 then
	conn.execute "insert into gbSecureMail set domain='judaism',Subject='הזמנה מהאתר',Body='" & Replace(strTpl,"'","\'") & "'"
End If
c=CInt(conn.execute("select last_insert_id()").fields(0).value)

If(isBuy) Then
If Len(application("judaism_id_hazmana"))=0 Then  application("judaism_id_hazmana")=Int(rnd*1000)+1


	with CreateObject("scripting.filesystemobject")
		
		with .opentextfile( server.mappath("data.csv"),8,true)
		
			a=request("name") & psik
			a=a & Replace(request("address"),",",";") & psik'address
			a=a &"'"& request("phone") & psik'phone
			a=a &"'"& request("cell") & psik'cell
			a=a & request("howPay")&psik 'דרך תשלום                     ***************
			a=a & request("tashlumim") & psik 'מספר תשלומים
			a=a & "*" & request("visa") &request("visa1")& psik'number of credit card
			a=a &  "*" &request("valid") & psik'valid of credit card
			a=a &  "*" &request("zehut") & psik'תעודת זהות
			a=a & request("girsa") & psik'girsa
			a=a & price & psik'price						***************
			a=a &request("transport") & psik'transport		***************
			a=a &request("siduri")& psik ' מספר סידורי
			a=a & Now & psik'date
			a=a & c & psik 'מספר הזמנה
			a=a & emla & psik  ' העמלה
			a=a &request("whoGiveDisk")&psik 'מי מספק את הדיסק          ***************
			a=a &request("comeFrom")&psik 'where custumer come from - ****************
			a=a&request("e_mail") & psik
			a=a & request ("notes") & psik ' הערות
			a=Replace(a,",",";")'replace the psikim from the user with ;
			b=Replace(a,psik,"</td><td>")
			a=Replace(a,psik,",") 'replace virtual psik with real psik to csv file.
			a=Replace(a,vbNewLine," ; ")
			.writeline a
			.close	
		End with
	End with
'ElseIf request("source")="othertofes" Then
	'כאן הפרמטרים של הטופס האחר
'ElseIf request("source")="othertofes" Then
End If

l=l&"<br><table border=1><tr><td>"&b & "</td></tr></table>"



'בזמן ניסוי להשאיר את הפקודה הבאה
'היא מבטלת את שליחת האימיילים
'response.End
message=strTpl
mesLine=l
strTpl=replace(strTpl,"#thetable#",l)

'set myMail = Server.CreateObject( "JMail.Speedmailer" )
'myMail.SendMail "itzik@klules.org.il","aminadavg@gmail.com","הזמנה באתר",strTpl,"smtpin.livedns.co.il" '"alt1.gmail-smtp-in.l.google.com"
'set myMail=nothing



	conn.execute "update gbSecureMail set Body='" & Replace(strTpl,"'","\'") & "' where id=" & c 

conn.close
Set conn=nothing

response.write "מספר הזמנה "
response.write c+25533 
response.write " פרטי פנייתך"

mesLine=replace(strTpl,request("visa1"),right(request("visa1"),4)&"****-****-****-")
message=replace(message,"#thetable#",mesLine)
response.write message
strTplM="<!DOCTYPE HTML PUBLIC""-//IETF//DTD HTML//EN""><html dir=rtl><head></head><body dir=rtl>" & c & ". Secure Email: <a href=""https://secure13.livessl.com/bubbles/judaism/pages/hazmana.asp?id=" & c & """>Click To Read</a><br><br><Br><hr><a href=""https://secure13.livessl.com/bubbles/judaism/pages/hazmana.asp?id=-1"">Read All Hazmanot</a><hr><a href=""https://secure13.livessl.com/bubbles/judaism/pages/hazmana.asp?id=0"">Excel File</a></body></html>" 

   Dim MyCDONTSMail2
    Dim HTML
    Set MyCDONTSMail2 = CreateObject("CDONTS.NewMail")
    MyCDONTSMail2.From= "shut.project@gmail.com"
	 MyCDONTSMail2.Subject="BUY of shut project " &" version-" & request("girsa")&" from " & request("name")
	If (isBuy) Then
		
		MyCDONTSMail2.to= "yonibajak@yahoo.com,hasidm1@bezeqint.net" 'send to yoni & moshe.
		If request("name")="נסיון" then
			MyCDONTSMail2.to= "yonibajak@yahoo.com" 'send only to yoni, when check.
		End if
	Else
		'MyCDONTSMail2.Subject="פרוייקט השות, צור קשר עם" & "-"& request("שם מלא") & "," & request("טלפון")
		tel=request("טלפון")
		tel=Trim(tel)
		tel=Replace(tel,"-","")
		If Len(tel)=10 then
			MyCDONTSMail2.to= "yoniblich-shutsms@yahoo.com"
			MyCDONTSMail2.Subject="sms sent you with message "& "-"& request("שם מלא") & "," & request("טלפון")			
		Else
			MyCDONTSMail2.to= "yonibajak@yahoo.com"			
			MyCDONTSMail2.Subject="Responsa project call to -"& request("שם מלא") & "," & request("טלפון")
		End if
	End if
	MyCDONTSMail2.bcc= "aminadavg@gmail.com"
   
    MyCDONTSMail2.BodyFormat=0
    MyCDONTSMail2.MailFormat=0
	If Len(request.Form("טלפון"))=0 then
		MyCDONTSMail2.Body=strTplm
	Else
		MyCDONTSMail2.Body=strTpl
	End if
    MyCDONTSMail2.Send
    set MyCDONTSMail2=nothing


%>

<br>

<center>
תודה על פניתכם<br>
הטופס נשלח בהצלחה
</center><br>


<%If CInt(emla)>20 then%>
<!-- Google Code for קניה Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1066445145;
var google_conversion_language = "iw";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
if (<%=emla-20%>) {
  var google_conversion_value = <%=emla-20%>;
 }
var google_conversion_label = "VPbACMGITxDZ0sL8Aw";
//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height="1" width="1" border="0" src="http://www.googleadservices.com/pagead/conversion/1066445145/?value=<%=emla%>&amp;label=VPbACMGITxDZ0sL8Aw&amp;script=0"/>
</noscript>
<%Else%>
<!-- Google Code for ליד Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1066445145;
var google_conversion_language = "iw";
var google_conversion_format = "1";
var google_conversion_color = "ffffff";
if (25) {
  var google_conversion_value = 25;
}
var google_conversion_label = "default";
//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height="1" width="1" border="0" src="http://www.googleadservices.com/pagead/conversion/1066445145/?value=25&amp;label=default&amp;script=0"/>
</noscript>
<%End if%>

<!-- #include file="sms.asp" -->
<%
Dim tel
<!--
tel=request("טלפון")
tel=Trim(tel)
tel=Replace(tel,"-","")
If Len(tel)=10 Or Len(tel)=9 Then
	tel=Left(tel,3) & "-" & Right(tel,7)
	sendSms tel,"052-6415963",request("שם מלא") & " " & request("אימייל")
	
	'sendSms tel,"054-2290258",request("שם מלא") & " " & request("אימייל")

End if
 -->'
%>
                                  
