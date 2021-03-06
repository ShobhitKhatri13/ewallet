package MyServlets;


import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybeans.DBConnector;

/**
 * Servlet implementation class GenerateCompanyWalletID1
 */
@WebServlet("/GenerateCompanyWalletID1")
public class GenerateCompanyWalletID1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateCompanyWalletID1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String companyname=request.getParameter("companyname");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			DBConnector dbc=new DBConnector();
			con=dbc.getDbconnection();
			
			
			pst=con.prepareStatement("select companyname from company where companyname=?;");
			pst.setString(1, companyname);
			rs=pst.executeQuery();
			if(rs.next())
			{
				out.println("Company ID Is Already Generated ");
			
			}
			else
			{
				pst=con.prepareStatement("insert into company values(?,companyid);");
				pst.setString(1, companyname);
				pst.executeUpdate();
				out.println("Company ID Craeted Succesfully");
				
				pst=con.prepareStatement("select companyID from company where companyname=?;");
				pst.setString(1, companyname);
				rs=pst.executeQuery();
				while(rs.next())
				{
					out.println("Company ID Is"+ rs.getInt("companyID"));
				}
			}
		}
		catch(Exception e)
		{
		out.println(e);
		}
		
		
	}

}
