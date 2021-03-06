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
int walletid=Integer.parseInt(request.getParameter("walletid"));
String acdc=request.getParameter("acdc");

Connection con;
PreparedStatement pst;

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	
	pst=con.prepareStatement("update userpers set usertype=? where walletid=?;");
	pst.setString(1,acdc);
	pst.setInt(2,walletid);
	pst.executeUpdate();
	

	con.close();
	
}
catch(Exception e)
{
	out.println(e);
}

 %>

</body>
</html>