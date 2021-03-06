<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Blob"%>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ page import=" mybeans.DBConnector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Customer Page.</title>
    
    <script language="javascript" src="scripts.js">
    </script>
    
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
	<h1>Welcome to E-Wallet</h1>
    <h4 align="center" style="color:white">
    WalletId :<%=walletid %>
	</h4>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select balance from wallet where walletid=?;");
	pst.setInt(1,walletid);
	rs=pst.executeQuery();
	while(rs.next())
	{
	%>
	<h4 align="center" style="color:white">
	Wallet balance :<%=rs.getInt("balance") %>
	</h4>
	<%	
	}
}
catch(Exception e)
{
	out.println(e);
}
%>

  
   
    <form name="frm" method="post" action="ShowProfile.jsp">
    <center><input type="Submit" value="Show Profile Pic"></center>
    </form>
    <br>
    <table align="center">
        <tr>
            <th>Sr.No</th>
            <th>Services</th>
            <th>Links</th>
        </tr>

        
         
        <tr>
            <td>1</td>
            <td>Add Money to wallet</td>
            <td><a href="AddMoney.jsp"><input type="button" value="Add Money"></a></td>
        </tr>

        <tr>
            <td>2</td>
            <td>Transfer Money From WalletID</td>
            <td><a href="Transfer1.jsp"><input type="button" value="Transfer"></a></td>
        </tr>

        <tr>
            <td>3</td>
            <td>Pay Electic Bill</td>
            <td><a href="ElectricBill.jsp"><input type="button" value="Pay Bill"></a></td>
        </tr>

        <tr>
            <td>4</td>
            <td>Mobile Recharge</td>
            <td><a href="MobileRecharge.jsp"><input type="button" value="Mob.Recharge"></a></td>
        </tr>

        <tr>
            <td>5</td>
            <td>Fastag Recharge</td>
            <td><a href="FastagRecharge.jsp"><input type="button" value="Fasttag Recharge"></a></td>
        </tr>

        <tr>
            <td>6</td>
            <td>Account Transaction Report</td>
            <td><a href="AccountTransReport.jsp"><input type="button" value="Report"></a></td>
        </tr>

        <tr>
            <td>7</td>
            <td>Search Transaction of certain date </td>
            <td><a href="certinDateReport.jsp"><input type="button" value="Date report"></a></td>
        </tr>


        <tr>
            <td>8</td>
            <td>Search Transaction of walletId</td>
            <td><a href="WalletTrans.jsp"><input type="button" value="Wallet Report"></a></td>
        </tr>
        
        <tr>
            <td>9</td>
            <td>Change Password</td>
            <td><a href="ChangePassword.jsp"><input type="button" value="ChangePassword"></a></td>
        </tr>
        
        <tr>
            <td>10</td>
            <td>LogOut</td>
            <td><a href="LogOut.jsp"><input type="button" value="LogOut"></a></td>
        </tr>
        
          
  </table>
    
    
    </body>
</html>