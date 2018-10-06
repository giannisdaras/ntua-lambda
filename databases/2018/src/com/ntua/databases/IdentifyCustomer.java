package com.ntua.databases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IdentifyCustomer
 */
@WebServlet("/IdentifyCustomer")
public class IdentifyCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdentifyCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher("/welcome.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connector obj=new Connector();
		Connection connection=obj.grabConnection();
		try {
			Statement statement=connection.createStatement();
			String irs=req.getParameter("irs");
			String query="select * from customer where irs = "+irs+";";
			ResultSet rs=statement.executeQuery(query);
			String last_name=null;
			String first_name=null;
			String room_id=req.getParameter("room_id");
			String hotel_id=(String) req.getParameter("hotel_id");
			req.setAttribute("hotel", hotel_id);
			req.setAttribute("room", room_id);
			req.setAttribute("irs", irs);
			
			
			while (rs.next()) {
				last_name=rs.getString("last_name");
				first_name=rs.getString("first_name");
			}
			if (last_name==null) {
				getServletContext().getRequestDispatcher("/createCustomer.jsp").forward(req,res);
			}
			else {
				req.setAttribute("name", first_name);
				req.setAttribute("surname", last_name);
				getServletContext().getRequestDispatcher("/reservationDates.jsp").forward(req,res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			getServletContext().getRequestDispatcher("/exceptionHandler.jsp").forward(req,res);
			e.printStackTrace();
		}
		
	}

}
