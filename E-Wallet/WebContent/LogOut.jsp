<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout </title>
</head>
<body style="background: url(Back.jpg) no-repeat center center fixed;
		   background-size: cover;">
<%session.invalidate(); %>
<h2 style="color:Voilet"><i>You Are Successfully Logged Out........</i></h2>
<br><h3>Thank You...!</h3>
<hr>
<br>
<a href="index.html"><input type="button" value="Home"></a>
</body>
</html>