<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Sign Up </title>
  
</head>
<body style="background: url(digital.jpg) no-repeat center center fixed;
	   background-size: cover;">

  <form name="frm " method="Post" action="Register" enctype="multipart/form-data"  style="color:white">
      
      
      <br><h1><center>Sign Up</center></h1><hr>
      <table align="center">
      
     
      
      <tr>
      <td><h2>Upload Profile Picture :</h2>
      <td><input type="file" name="profile" required><br>
      </tr>
      
      <tr>
       <td><h2>Name :</h2>
       <td><input type="text" name="nm"  required><br>
      </tr>
      
      <tr>
       <td><h2>Set Password :</h2> 
       <td><input type="password" name="psw"  required><br>
      </tr>
      
      <tr> 
	   <td><h2>Gender :</h2>
	   <td><select name="gender" required>
	      <option value="male">Male</option> 
	      <option value="female">Female</option> 
	      <option value="other">Other</option> 
	    </select>
	    <br>
	  </tr>
	  
	  <tr>
        <td><h2>Date Of Birth :</h2> 
        <td><input type="date" name="dt"  required><br>
      </tr>
      
      <tr>
        <td><h2>EmailId :</h2> 
        <td><input type="email" name="email" required><br>
      </tr>
      
      <tr>
        <td><h2>Mobile.No :</h2> 
        <td><input type="number" name="mob" required><br>
      </tr>
      
      <tr>
       <td><h2>Address :</h2> 
       <td><input type="textarea" name="add"  required><br>
      </tr>
      
      <tr>
        <td><h2>Upload Adhar Card :</h2> 
        <td><input type="file" name="file" required><br>
      </tr>
      
     
              
   </table>
   <br>
   <br>
   <center><input type="Submit" value="Submit"></center><br><br><hr>
   
       
  <h2>Click to Home Button For going on Last Page..</h2><center><a href="index.html"><input type="button" value="Home"></a></center>
  <br>
    
       
   
   </form>
 


</body>
</html>