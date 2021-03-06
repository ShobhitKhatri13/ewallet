<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
    *{
	margin: 0;
	padding:0;
}

body{
	   background:url(Back.jpg) no-repeat center center fixed; 
	   background-size: cover;
}
.forgot{
	width: 500px;
	background: #3e3d3d;
	padding: 100px 45px;
	box-sizing: border-box;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
h1{
	
	text-align:centercenter;
	color: #fff;
	font-weight: normal;
	margin-bottom: 20px;
}

input{
	width: 100%;
	background:none;
	border: 1px solid #fff;
	border-radius: 3px;
	padding: 6px 15px;
    box-sizing: border-box;
	margin-bottom: 20px;
    font-size: 16px;
	color: #fff;
}

input[type="submit"]{
	background: #bac675;
	border: 0;
	cursor: pointer;
	color: #3e3d3d;
}

a{
	color: #bac675;
	font-size: 15px;
}

</style>  


</head>
<body>

<div class="forgot">
        <form name="frm" method="post" action="ShowDoc.jsp">
            <h1><center>Search KYC Documents</center></h1>
            <%
			int walletid=Integer.parseInt(String.valueOf(session.getAttribute("walletid")));
			%>
			<center><h2 style="color:white">Walletid :<%=walletid %></h2></center><br>
            <input type="number" name="walletid" placeholder="Walletid" required>
            <input type="Submit" value="Submit">
    <center><a href="index.html">Home</a></center>
        </form>
    </div>


</body>
</html>