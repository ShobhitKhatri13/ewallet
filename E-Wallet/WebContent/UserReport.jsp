<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import=" mybeans.DBConnector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    
       
       body{
           background: url(blackgray.jpg) no-repeat center center fixed;
		   background-size: cover;
	       font-family: serif;
	       font-size: 22px;
       } 
       
       h1{
           text-align: center;
           color: white;
       }

       table ,th,td{
           border: 1px solid black;
           border-collapse: collapse;
           table-layout: fixed;
       }

       th,td{
           text-align: center;
           padding: 10px;
       }

       td:hover{
           background: rgba(220,20,60,.6);
       }

       th{
           background: rgba(220,20,60,.6);
       }

       tr:nth-child(odd){
           background: rgba(128,128,128,.8);
           color: white
       }

       tr:nth-child(even){
           background: rgba(0,0,0,.8);
           color: white
       }
       
       #profileDisplay{
			display: block;
			width: 10%;
			margin: 10px auto;
			border-radius: 50%;
			
		}
       
       
    </style>

</head>
<body>
<%
	int walletid=Integer.parseInt(String.valueOf(session.getAttribute("walletid")));
%>
    <h4 align="center" style="color:white">
    WalletId :<%=walletid %>
    </h4>
	    <table align="center">
        <tr>
            <th>name</th>
            <th>password</th>
            <th>gender</th>
            <th>Dob</th>
            <th>email</th>
            <th>mobileno</th>
            <th>address</th>
            <th>Walletid</th>
            <th>usertype</th>
            <th>userstatus</th>
        </tr>

       <%
Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();

	pst=con.prepareStatement("select * from userpers where usertype='customer';");
	
	rs=pst.executeQuery();
	while(rs.next())
	{
	%>
		<tr>
		<td><%=rs.getString("name") %>
		<td><%=rs.getString("password") %>
		<td><%=rs.getString("gender") %>
		<td><%=rs.getString("Dob") %>
		<td><%=rs.getString("email") %>
		<td><%=rs.getString("MobileNo") %>
		<td><%=rs.getString("address") %>
		<td><%=rs.getInt("walletid") %>
		<td><%=rs.getString("usertype") %>
		<td><%=rs.getString("userstatus") %>
		</tr>
	<%	
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
       
 


</table>

</body>
</html>