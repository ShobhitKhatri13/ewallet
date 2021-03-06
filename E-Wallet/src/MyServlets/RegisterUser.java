package MyServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybeans.DBConnector;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String nam,pass,gen,dob,mob,email,adder;
		
		nam=request.getParameter("nm");
		pass=request.getParameter("password");
		gen=request.getParameter("gender");
		dob=request.getParameter("dob");
		email=request.getParameter("email");
		mob=request.getParameter("mobileno");
		adder=request.getParameter("address");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			DBConnector dbc=new DBConnector();
			con=dbc.getDbconnection();
			
			
			pst=con.prepareStatement("insert into userpers values(?,?,?,?,?,?,?,walletid,default,default);");
			pst.setString(1, nam);
			pst.setString(2, pass);
			pst.setString(3, gen);
			pst.setString(4, dob);
			pst.setString(5, email);
			pst.setString(6, mob);
			pst.setString(7, adder);
			pst.executeUpdate();
			out.println("<h1>user registration successful</h1><hr>");
			
			pst=con.prepareStatement("select walletid from userpers where password=? and email=?;");
			pst.setString(1, pass);
			pst.setString(2,email);
			rs=pst.executeQuery();
			while(rs.next())
			{
				out.println("<h2>Your Userid is : " +rs.getInt("walletid")+"</h2>");
			}
			
			out.println("<br><h2>Please use this userid to login...</h2>");
			out.println("<br><a href='index.html'>Home</a>");
			
			pst=con.prepareStatement("insert into wallet(walletid) select walletid from userpers where MobileNo=?;");
			pst.setString(1,mob);
			pst.executeUpdate();
			
			
			
			con.close();			
			
		}
		
		catch(Exception e)
		{
			out.println(e);
		}


	}

}
