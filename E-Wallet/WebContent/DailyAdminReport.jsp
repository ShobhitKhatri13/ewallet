<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<h1>Admin Can Check Various Report From Here...</h1>
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
            <td>You Can See All The Users</td>
            <td><a href="UserReport.jsp"><input type="button" value="See All The Users"></a></td>
        </tr>
        
        <tr>
        	<td>2</td>
        	<td>Daily Transaction Report Of Users</td>
        	<td><a href="DailyTransactionReport.jsp"><input type="button" value="DailyReport"></a></td>
        </tr>
        
        <tr>
        	<td>3</td>
        	<td>Search Transaction By Date</td>
        	<td><a href="ReportAdminDate.jsp"><input type="button" value="Search By Date"></a></td>
        </tr>
		
		<tr>
		<td>4</td>
		<td>Report Of Money Trnsaferd To Company</td>
		<td><a href="CompanyReport.jsp"><input type="button" value="Company Trnasaction Report"></a>
		
		</tr>
</table>

</body>
</html>