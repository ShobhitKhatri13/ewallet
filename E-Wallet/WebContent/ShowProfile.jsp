<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.Blob"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
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
	
	<img src="getImage.jsp?id=<%=walletid%>" />
	<%
	Connection con;
	PreparedStatement pst;

	try {
		DBConnector dbc=new DBConnector();
		con=dbc.getDbconnection();
		pst = con.prepareStatement("select * from userpers where walletid=?");
		pst.setInt(1, walletid);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			Blob blob = rs.getBlob("pic");
			byte byteArrray[] = blob.getBytes(1, (int) blob.length());
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			os.write(byteArrray);
			os.flush();
			os.close();
			out.println("congrats");
		} 
		else 
		{
			out.print("No image found with this id");

		}

	} 
	catch (Exception ex) 
	{
		System.out.println(ex);
	}

	
	%>
	<h3 style="color: red;">Invaild Session...</h3>
	<a href="index.jsp">Please Login Now</a>

</body>
</html>