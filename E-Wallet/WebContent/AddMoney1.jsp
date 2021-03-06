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
double amount=Double.parseDouble(request.getParameter("amt"));
int accno=Integer.parseInt(request.getParameter("accno"));
String password=request.getParameter("password");

Connection con;
PreparedStatement pst;
ResultSet rs;
try
{    
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	
	pst=con.prepareStatement("SELECT * FROM accounts WHERE accno = ? and password=? and balance>=500 ;");
	pst.setInt(1,accno);
	pst.setString(2,password);
	rs=pst.executeQuery();	
	
	if(rs.next())
	{
	pst=con.prepareStatement("update accounts set balance=balance-? where accno=?;");
	pst.setDouble(1, amount);
	pst.setInt(2,accno);
	pst.executeUpdate();
	out.println("<h1>Ammount Added To Your Wallet Suceesfully</h1>");
	
	pst=con.prepareStatement("update wallet set balance=balance+? where walletid=?;");
	pst.setDouble(1, amount);
	pst.setInt(2, walletid);
	pst.executeUpdate();
	
	
	pst=con.prepareStatement("insert into accountranscation values(now(),?,?,?);");
	pst.setInt(1,accno);
	pst.setInt(2,walletid);
	pst.setDouble(3,amount);
	pst.executeUpdate();
		
	con.close();
	
	}
	else
	{
		out.println("<h1>Account Dosen't Exist</h1>");
	}
}
catch(Exception e)
{
	out.println("<h1>Your account balance is low</h1>");
}

%>

</body>
</html>