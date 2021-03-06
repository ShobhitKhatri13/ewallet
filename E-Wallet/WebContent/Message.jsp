<%
String Message=(String)session.getAttribute("Message");
if(Message!=null)
{
	out.println(Message);
	
	session.removeAttribute("Message");
}

%>