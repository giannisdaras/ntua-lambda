package com.ntua.databases;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/RentServlet")
public class RentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher("/welcome.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connector obj = new Connector();
		Connection connection = obj.grabConnection();
		PrintWriter out = res.getWriter();
		try {
			Statement statement = connection.createStatement();
			String room = (String) req.getSession().getAttribute("room_id");
			String hotel = (String) req.getSession().getAttribute("hotel");
			String price = (String) req.getSession().getAttribute("price");
			String irs_employee = (String) req.getSession().getAttribute("irs_employee");
			String irs_customer = (String) req.getSession().getAttribute("irs_customer");
			String reservation_id=(String) req.getSession().getAttribute("reservation_id");
			String payment_method = req.getParameter("paySelector");
			PreparedStatement preparedStatement=connection.prepareStatement("select * from reserves where reserve_id=?");
			preparedStatement.setInt(1,Integer.parseInt(reservation_id));
			ResultSet rs=preparedStatement.executeQuery();
			rs.next(); 
			Date start_date=rs.getDate("start_date");
			Date finish_date=rs.getDate("finish_date");
			PreparedStatement queryRent =connection.prepareStatement("insert into rents (irs_employee, irs_customer,hotel_id,room_id,payment_method,payment_amount,start_date,finish_date) values ("
					+ irs_employee + "," + irs_customer + "," + hotel + "," + room + ",\'" + payment_method + "\'," + price
					+"," + "?" + ","+ "?"+ ")");
			
			queryRent.setDate(1,start_date);
			queryRent.setDate(2,finish_date);
			queryRent.executeUpdate();
			String queryReserves="update reserves set paid=1 where reserve_id="+reservation_id+";";
			statement.execute(queryReserves);
			getServletContext().getRequestDispatcher("/IdentifyEmployee?irs="+irs_employee).forward(req,res);

		} catch (SQLException e) {
			getServletContext().getRequestDispatcher("/exceptionHandler.jsp").forward(req,res);
			out.println(e.getMessage());
			e.printStackTrace();
		}

	}

}
