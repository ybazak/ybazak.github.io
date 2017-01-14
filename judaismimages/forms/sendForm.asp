<%
Response.CacheControl = "no-cache"
Response.AddHeader "Pragma", "no-cache"
Response.Expires = -1

dim myMail,strTpl


strTpl="<!DOCTYPE HTML PUBLIC""-//IETF//DTD HTML//EN""><html dir=rtl><head></head><body dir=rtl><table border=1 cellpadding=5 align=center>#thetable#</body></html>" 


dim i,l,tt

for each i in request.form
	tt=tt & request.form(i) 
	l=l & "<tr><td>" & i & "</td><td>" & request.form(i) & "</td></tr>"
next

'if len(tt) <9 then response.End

If Len(request.Form("טלפון"))=0 Then
	isBuy=True
Else
	isBuy=False
End If
psik="yErlsofd" 'NOT delete it
 l=l &  "<tr><td>נשלח ב:</td><td>" & now & "</td></tr>"
' l=l &  "<tr><td>נשלח ב:</td><td>" & dateadd("h",-1,now) & "</td></tr>" ' בגלל שעון קיץ, השרת לא מכוון, יתכן שצריך לשנות בחורף - this is wrong 
price=9999
If request("girsa")="17p" Then 
				price=2250			
			ElseIf request("girsa")="17" Then
				price=1900				
				ElseIf request("girsa")="16-16plus upgrade"  Then '16 version
				price=350
				ElseIf request("girsa")="15plus-16plus upgrade" Or request("girsa")="15-16 upgrade" Then '15 version
				price=370
				ElseIf request("girsa")="14plus-16plus upgrade" Or request("girsa")="14-16 upgrade" Then '14 version
				price=470	
				ElseIf request("girsa")="13plus-16plus upgrade" Or request("girsa")="13-16 upgrade" Then  '13 version
				price=430
				ElseIf request("girsa")="12plus-16plus upgrade" Or request("girsa")="12-16 upgrade" Then   '12 version
				price=430	
				ElseIf request("girsa")="11plus-16plus upgrade" Or request("girsa")="11-16 upgrade" Then	'11 version
				price=430	
				ElseIf request("girsa")="10plus-16plus upgrade" Or request("girsa")="10 or less to 16" Then	'10or less version
				price=430	
				ElseIf request("girsa")="15 - 16plus" Then
				price=370+350	
				ElseIf request("girsa")="14 - 16plus" Then
				price=470+350	
				ElseIf request("girsa")="13 - 16plus" Then
				price=430+350
				ElseIf request("girsa")="12 - 16plus" Then
				price=430+350	
				ElseIf request("girsa")="11 - 16plus" Then
				price=430+350	

				ElseIf request("girsa")="10 or less to 16 plus" Then
				price=430+350		
End If

If request("girsa")="17p" Then
	emla=price-280
ElseIf request("girsa")="17" Then
	emla=price
Else
	emla=price/10
End If
If(isBuy) Then l=l&"<tr><td>מחיר</td><td>" & price & "</td></tr>"

If(isBuy=false) Then 
emla=0

'write it to file lids.csv
	with CreateObject("scripting.filesystemobject")
	if request.servervariables("https")="on" then
		y= server.mappath("lids.csv")
	else
		y= server.mappath("/judaism/pages/forms/lids.csv")
	end if
	'response.write x
	x=LCase(request("טלפון"))
	a="abcdefghijklmnopqrstuvwxyz"
	found=0
	For i=1 To Len(x)
		If InStr(a,Mid(x,i,1))>0 Then found=found+1
		If found=2 Then												 
			response.write "Error, your purchase cannot complete. We are apologize, please call to (972)52-977-2025<br/>"
			response.write ". המערכת זיהתהאותך כספאמר<br />אנחנו מתנצלים על הטעות ומבקשים ממך לבצע הזמנה טלפונית בטלפון 0529772025."
			
			response.End
		End if
	Next						  
					  ' hrw y
	with .opentextfile( y,8,true)
		line=request("שם מלא") & psik&"'" &request("טלפון")&psik &request("אימייל")&psik& Now &psik&"TTTT"&psik

		' בגלל שעון קיץ, השרת לא מכוון, יתכן שצריך לשנות בחורף - this is wrong 
		line=Replace(line,",",";")'replace the psikim from the user with ';'
		line=Replace(line,psik,",") 'replace virtual psik with real psik to csv file
			.writeline line
			.close	
		End with
	End with
End If

Randomize timer

Set conn=CreateObject("ADODB.connection")
str="DRIVER={MySQL ODBC 3.51 Driver}; harSet=utf8;stmt=set names hebrew;SERVER=localhost; DATABASE=data; UID=bubbles;PASSWORD=14248405; OPTION=3"
conn.open str,""
'If Len(request.Form("טלפון"))=0 then
	conn.execute "insert into gbSecureMail set domain='judaism',Subject='הזמנה מהאתר',Body=' '"
'End If

c=CInt(conn.execute("select last_insert_id()").fields(0).value)



If(isBuy) Then
If Len(application("judaism_id_hazmana"))=0 Then  application("judaism_id_hazmana")=Int(rnd*1000)+1
application("judaism_id_hazmana")=application("judaism_id_hazmana")+1


	with CreateObject("scripting.filesystemobject")
		with .opentextfile( server.mappath("data.csv"),8,true)
			a=request("name") & psik
			a=a & Replace(request("address"),",",";") &" "&request("country") & psik 'address
			a=a & "'"&request("phone") & psik'phone
			a=a &  "'"&request("cell") & psik'cell
			a=a & "אשראי"&psik 'דרך תשלום
			a=a & request("tashlumim") & psik 'מספר תשלומים
			a=a & "*" & request("visa") &request("visa1")& psik'number of credit card
			a=a &  "*" &request("valid") &request("valid_month")&"/"&request("valid_year")& psik'valid of credit card
			a=a &  "*" &request("zehut") & psik'תעודת זהות
			a=a & request("girsa") & psik'girsa
		'	If request("source")="bookweek2009" Then
			'	a=a & request("bid") & psik'price
		'		emla=999' that form know this is buy
		'	Else
				a=a & price & psik'price
		'	End If
			a=a & "רגיל"&psik'tranport
			a=a &request("siduri")& psik ' מספר סידורי
			a=a & Now & psik'date
			a=a & c & psik 'מספר הזמנה
			a=a & emla & psik  ' העמלה
			a=a&"משה"&psik 'מי מספק את הדיסק - כאן זהו משה
			a=a&"מקוונת"&psik 'where custumer come from - here, he buy this at himself
			a=a&request("e_mail")&psik
			a=a & request("notes") & psik ' הערות
			a=Replace(a,",",";")' replace the psikim from the user with ;
			b=Replace(a,psik,"</td><td>")
			a=Replace(a,psik,",") 
			'vbNewLine=Chr(13) & Chr(10)
			a=Replace(a,vbNewLine," ; ")
			' replace virtual psik with real psik to csv file.
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

strTpl=replace(strTpl,"#thetable#",l)

'If(isBuy) Then
On Error Resume Next
sql="update gbSecureMail set Body='" & Replace(strTpl,"'","\'") & "' where id=" & c
conn.execute sql
conn.close
Set conn=nothing
On Error goto 0
'End If 

'set myMail = Server.CreateObject( "JMail.Speedmailer" )
'myMail.SendMail "itzik@klules.org.il","aminadavg@gmail.com","הזמנה באתר",strTpl,"smtpin.livedns.co.il" '"alt1.gmail-smtp-in.l.google.com"
'set myMail=nothing



strTplM="<!DOCTYPE HTML PUBLIC""-//IETF//DTD HTML//EN""><html dir=rtl><head></head><body dir=rtl>" & c & ". Secure Email: <a href=""https://secure13.livessl.com/bubbles/judaism/pages/hazmana.asp?id=" & c & """>Click To Read order num  "& c & "</a><br><br><Br><hr><a href=""https://secure13.livessl.com/bubbles/judaism/pages/hazmana.asp?id=-1"">Read All Hazmanot</a><hr><a href=""https://secure13.livessl.com/bubbles/judaism/pages/hazmana.asp?id=0"">Excel File</a></body></html>" 

   Dim theEmail
    Dim HTML
    Set theEmail = CreateObject("CDONTS.NewMail")
    theEmail.From= "yonibajak@yahoo.com"
	  theEmail.Subject="BUY of shut project " &" ver. -" & request("girsa")&" from " & request("name")
	If (isBuy) Then
		theEmail.to= "shut.project@gmail.com"',hasidm@gmail.com" 'send to yoni & moshe.
		If ((request("name")="נסיון") Or (request("source")="bookweek2009") Or (request("name")="ניסיון")) Then 
			theEmail.to= "shut.project@gmail.com" 'send only to yoni, when check.
		End if
	Else
		'theEmail.Subject="פרוייקט השות, צור קשר עם" & "-"& request("שם מלא") & "," & request("טלפון")
		tel=request("טלפון")
		tel=Trim(tel)
		tel=Replace(tel,"-","")
		tel=Replace(tel," ","")
		tel=Replace(tel,",","")
		If Len(tel)=10 then
			theEmail.to= "yoniblich-shutsms@yahoo.com"												
			theEmail.Subject="sms sent you with message "& "-"& request("שם מלא") & "," & tel			
		Else
			theEmail.to= "yonibajak@yahoo.com"			
			theEmail.Subject="Responsa project call to -"& request("שם מלא") & "," &tel
		End if
	End if
	theEmail.bcc= "aminadavg@gmail.com"
   
    theEmail.BodyFormat=0
    theEmail.MailFormat=0
	If Len(request.Form("טלפון"))=0 then
		theEmail.Body=strTplm
	Else
		theEmail.Body=strTpl
	End if
    theEmail.Send
    set theEmail=nothing

%><!-- #include file="sms.asp" --><%
'on error resume next
Dim tel
tel=request("טלפון")
tel=Trim(tel)
tel=Replace(tel,"-","")
tel=Replace(tel,",","")
If (Len(tel)=10 Or Len(tel)=9) AND Left(tel,2)="05" Then
	tel=Left(tel,3) & "-" & Right(tel,7)
	sendSms tel,"052-6415963",request("שם מלא") & " " & request("אימייל")
	'sendSms tel,"054-2290258",request("שם מלא") & " " & request("אימייל")
Else 
	If (isBuy) Then
		'sendSms "2222","052-6415963","Buy " & request("girsa")  & " From " & request("name") & " tel:" 	& request("phone") & request("שם מלא") & request("אימייל") & " at " & request("bid")
		
	Else
		sendSms "3636","052-6415963"," From " & tel & " ," & request("שם מלא") & " " & request("אימייל")&request("phone") &" "&request("country")
		'sendSms "3636","057-4443614","From" & tel & " ," & request("שם מלא") & " " & request("אימייל")
	End if
End if											   
on error goto 0
If CInt(emla)>20 then
	response.redirect "http://www.judaismshop.com/?sp=purchase_received"
Else
	response.redirect "http://www.judaismshop.com/?sp=lid_received"
end if
%>
                                  
