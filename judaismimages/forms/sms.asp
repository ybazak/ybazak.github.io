<%
sub sendSms(sFrom,sTo,sMessage)
		dim SXH_OPTION_URL_CODEPAGE,smsNumbers,DataToSend
		SXH_OPTION_URL_CODEPAGE=0
		smsNumbers="<NUMLIST>" & sTo & "</NUMLIST>"
		 DataToSend = ("<SMS2U><USERNAME>034764670</USERNAME>" _
		 & "<PASSWORD>12345</PASSWORD><SENDER>" & sFrom & "</SENDER><MSGLNG>HEB</MSGLNG>" _
		 & "<MSG><![CDATA[" & sMessage & "]]></MSG><NUMLIST><CELLNUMBER>" _
		 & smsNumbers &  "</CELLNUMBER></NUMLIST></SMS2U>")

		'response.write "<textarea style=width:100%;height:200px>" & DataToSend & "</textarea>"
		'DataToSend=server.urlEncode(DataToSend)
		 DataToSend = "XMLString=" & DataToSend
		
		 set xmlhttp = server.Createobject("MSXML2.ServerXMLHTTP")
		 xmlhttp.setOption SXH_OPTION_URL_CODEPAGE, 65001
		 xmlhttp.Open "POST","http://goldman.co.il/SendSMSAPI/SMSAPI.asmx/SendXMLSMS",false
			 xmlhttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
			 xmlhttp.send DataToSend
		dim add
		 add= xmlhttp.responsetext
		 'response.write add

end sub

'sendSms "08-9790049","054-2290258","האם אתה מקבל?Do you get?"
%>