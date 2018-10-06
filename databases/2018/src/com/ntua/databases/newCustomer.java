package com.ntua.databases;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class newCustomer
 */
@WebServlet("/newCustomer")
public class newCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newCustomer() {
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
		PrintWriter out=res.getWriter();
		try {
			Statement statement=connection.createStatement();
			String irs=(String) req.getSession().getAttribute("irs");
			String room_id=(String) req.getSession().getAttribute("room_id");
			String hotel_id=(String) req.getSession().getAttribute("hotel_id");
			String name=req.getParameter("name");
			String surname=req.getParameter("surname");
			String city=req.getParameter("city");
			String street=req.getParameter("street");
			String num=req.getParameter("num");
			String postal=req.getParameter("postal");
			String ssn=req.getParameter("ssn");
			String today=java.time.LocalDate.now().toString();
			String query="insert into customer (irs,first_name,last_name,ssn,first_registration,street,num,postal_code,city) values ("+irs+",\'"+ name+"\'"+",\'"+surname+"\',"+ssn+",\'"+today+"\',\'"+street+"\',"+num+","+postal+",\'"+city+"\');";    
//			out.println(query);
			statement.executeUpdate(query);	
			req.setAttribute("name", name);
			req.setAttribute("surname", surname);
			req.setAttribute("room", room_id);
			req.setAttribute("hotel", hotel_id);
			req.setAttribute("irs", irs);
			getServletContext().getRequestDispatcher("/reservationDates.jsp").forward(req,res);

		} catch (SQLException e) {
			out.println("<script> alert('Too big irs or wrong/missing input '); window.history.back();</script>");
//			getServletContext().getRequestDispatcher("/exceptionHandler.jsp").forward(req,res);
			e.printStackTrace();
		}
	}

}
