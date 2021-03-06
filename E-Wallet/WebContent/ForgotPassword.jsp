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
String oldpass=request.getParameter("psw");
String newpass=request.getParameter("cpsw");

Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("Select * from userpers where walletid=?;");
	pst.setInt(1,walletid);
	rs=pst.executeQuery();
	if(rs.next())
	{
	pst=con.prepareStatement("update userpers set password=? where walletid=?;");
	pst.setString(1,newpass);
	pst.setInt(2,walletid);
	pst.executeUpdate();
	
	con.close();
	
	out.println("Password Updated");
	}
	else
	{
		out.println("Sorry! walletid dose not exist..");
	}
	
}
catch(Exception e)
{
	out.println(e);
}


%>

</body>
</html>