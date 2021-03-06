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
int cmpid=Integer.parseInt(request.getParameter("cmpid"));
String cmpnm=request.getParameter("companyname");
double amount=Double.parseDouble(request.getParameter("amount"));

Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from company where  companyname=? and  companyID=?;");
	pst.setString(1,cmpnm);
	pst.setInt(2,cmpid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		pst=con.prepareStatement("insert into companytransaction values(now(),?,?,?);");
		pst.setInt(1,walletid);
		pst.setInt(2,cmpid);
		pst.setDouble(3,amount);
		pst.executeUpdate();
		out.println("Money Transferd Suucsfully");
	}
	else
	{
		out.println("Please Fill The Correct Information ");
	}
	
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