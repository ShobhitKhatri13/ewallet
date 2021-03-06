package MyServlets;

import mybeans.DBConnector;
import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
        int walletid=Integer.parseInt(request.getParameter("walletid"));
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try {
			
			DBConnector dbc=new DBConnector();
			con=dbc.getDbconnection();
			
			pst=con.prepareStatement("select * from userpers where walletid=? and email=? and password=? and userstatus='active';");
			pst.setInt(1,walletid);
			pst.setString(2,email);
			pst.setString(3,pass);
			rs=pst.executeQuery();
			if(rs.next())
			{
				HttpSession ses=request.getSession(true);
				ses.setAttribute("walletid",walletid);
			    String ty=rs.getString("usertype");
				if(ty.equalsIgnoreCase("Admin"))
					response.sendRedirect("Admin.jsp");
				else
					response.sendRedirect("Customer.jsp");
				
			}
			else
				response.sendRedirect("Failure.jsp");
			
			con.close();
			}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

}
