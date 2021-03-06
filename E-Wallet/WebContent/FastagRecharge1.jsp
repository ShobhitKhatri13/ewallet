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
   

<%

String wo=request.getParameter("wehicleno");
Double amount=Double.parseDouble(request.getParameter("amt"));

Connection con;
PreparedStatement pst;

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
		
	pst=con.prepareStatement("update wallet set balance=balance-? where walletid=?;");
	pst.setDouble(1,amount);
	pst.setInt(2,walletid);
	pst.executeUpdate();
	
	
	pst=con.prepareStatement("insert into wallettransaction values(now(),?,?,?);");
	pst.setDouble(1,amount);
	pst.setInt(2,walletid);
	pst.setString(3,wo);
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