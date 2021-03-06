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
int dwalletid=Integer.parseInt(request.getParameter("dwalletid"));
double amount=Double.parseDouble(request.getParameter("amount"));

Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();

	pst=con.prepareStatement("select balance from wallet where walletid=? and balance>=20;");
	pst.setInt(1,walletid);
	rs=pst.executeQuery();
	if(rs.next())
	{	
	pst=con.prepareStatement("update wallet set balance=balance+? where walletid=?;");
	pst.setDouble(1, amount);
	pst.setInt(2, dwalletid);
	pst.executeUpdate();
	
	
	pst=con.prepareStatement("update  wallet set balance=balance-? where walletid=?;");
	pst.setDouble(1, amount);
	pst.setInt(2, walletid);
	pst.executeUpdate();
	


	pst=con.prepareStatement("insert into wallettransaction values(now(),?,?,?);");
	pst.setDouble(1,amount);
	pst.setInt(2,walletid);
	pst.setInt(3,dwalletid);
	pst.executeUpdate();
	
	if(amount>=1000)
	{
		pst=con.prepareStatement("update wallet set balance=balance+50 where walletid=?;");
		pst.setInt(1,walletid);
		pst.executeUpdate();
		
		pst=con.prepareStatement("insert into wallettransaction values(now(),50,'cashback',?);");
		pst.setInt(1,walletid);
		pst.executeUpdate();
		
		out.println("Congrulations you have recived a cashback of rs 50");
		
	}
	else
	{
		out.println("money transferd suesulyy");
	}
	
	con.close();
	
	out.println();
	
	}	
	else
	{
		out.println("Your Account Balance Is Low");
	}
	
	
}
catch(Exception e)
{
	out.println(e);
}


%>

</body>
</html>