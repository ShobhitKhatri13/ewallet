<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

		h2{
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
	<h2>Admin Page</h2>
    <h4 align="center" style="color:white">
    WalletId :<%=walletid %>
	</h4>
<table align="center">
        <tr>
            <th>Sr.No</th>
            <th>Services</th>
            <th>Links</th>
        </tr>

        
         
        <tr>
            <td>1</td>
            <td>Search WalletID And View Documnet</td>
            <td><a href="AddMoney.jsp"><input type="button" value="Add Money"></a></td>
        </tr>

        <tr>
            <td>2</td>
            <td>Add Payment To Company</td>
            <td><a href="AddPaymentCompany.jsp"><input type="button" value="Add Payment To Company"></a></td>
        </tr>

        <tr>
            <td>3</td>
            <td>Generate Company WalletID</td>
            <td><a href="GenerateCompanyWalletID.jsp"><input type="button" value="Genarate Company WalletID"></a></td>
        </tr>

        <tr>
            <td>4</td>
            <td>Daily Report</td>
            <td><a href="DailyAdminReport.jsp"><input type="button" value="Daily Report"></a></td>
        </tr>

        <tr>
            <td>5</td>
            <td>Activate/Deactivate WalletID</td>
            <td><a href="ActivateDeactivate.jsp"><input type="button" value="AcDc"></a></td>
        </tr>

        <tr>
            <td>6</td>
            <td>Change Password</td>
            <td><a href="ChangePassword.jsp"><input type="button" value="ChangePassword"></a></td>
        </tr>
        
        <tr>
            <td>7</td>
            <td>Show Kyc Documents</td>
            <td><a href="Show.jsp"><input type="button" value="Search Kyc"></a></td>
        </tr>
        

        <tr>
            <td>8</td>
            <td>LogOut</td>
           <td><a href="LogOut.jsp"><input type="button" value="LogOut"></a></td>
        </tr>




    </table>

</body>
</html>