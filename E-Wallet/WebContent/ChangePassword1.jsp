<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import=" mybeans.DBConnector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int walletid=Integer.parseInt(String.valueOf(session.getAttribute("walletid")));
%>
   
Password Of WalletId :-<%=walletid %> Is Succesfully Changed...

<%
String oldpass=request.getParameter("oldpass");
String newpass=request.getParameter("newpass");

Connection con;
PreparedStatement pst;

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("update userpers set password=? where walletid=?;");
	pst.setString(1,newpass);
	pst.setInt(2,walletid);
	pst.executeUpdate();
	
	con.close();
	
	out.println();
	
	
	
	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>