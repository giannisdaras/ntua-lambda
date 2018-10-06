package com.ntua.databases;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IdentifyEmployee
 */
@WebServlet("/IdentifyEmployee")
public class IdentifyEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdentifyEmployee() {
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
		PrintWriter out=res.getWriter();
		Connector obj=new Connector();
		Connection connection=Connector.grabConnection();
		try {
			Statement statement=connection.createStatement();
			String irs=req.getParameter("irs");
			String query="select * from employee inner join works on employee.irs=works.irs where employee.irs ="+irs+ " and works.finish_date>=curdate();";
			ResultSet rs=statement.executeQuery(query);
			ResultSet rs2;
			String last_name=null;
			String first_name=null;
			while (rs.next()) {
				last_name=rs.getString("lastname");
				first_name=rs.getString("firstname");
			}
			if (last_name==null) {
				req.setAttribute("wrong", "yes");
				getServletContext().getRequestDispatcher("/EmployeeLogin.jsp").forward(req,res);
			}
			else {
				req.setAttribute("name", first_name);
				req.setAttribute("surname", last_name);
				String workQuery="select hotel_id from works where irs="+irs+";";
				Integer hotel_id=0;
				rs.close();
				rs=statement.executeQuery(workQuery);
				while (rs.next()) {
					hotel_id=rs.getInt("hotel_id");
				}
				String reservesQuery="select * from reserves where hotel_id="+hotel_id+" and paid=0";
				rs.close();
				rs=statement.executeQuery(reservesQuery);
				List<String> irs_customers=new ArrayList<String>();
				List<Double> prices=new ArrayList<Double>();
				List<Integer> roomIds=new ArrayList<Integer>();
				List<Integer> reservationIds=new ArrayList<Integer>();
				List<String> customer_names=new ArrayList<String>();
				List<String> customer_surnames=new ArrayList<String>();
				Integer counter=0;
				while (rs.next()) {
					counter+=1;
					reservationIds.add(rs.getInt("reserve_id"));
					roomIds.add(rs.getInt("room_id"));
					irs_customers.add(rs.getString("irs"));
					String priceQuery="select distinct price from hotel_room where room_id="+rs.getInt("room_id")+" and hotel_id="+hotel_id+";";
					Statement statement2=connection.createStatement();
					rs2=statement2.executeQuery(priceQuery);
					while (rs2.next()) {
						prices.add(rs2.getDouble("price"));
					}
					Statement statement3=connection.createStatement();
					ResultSet rs3=statement3.executeQuery("select * from customer where irs="+rs.getString("irs")+";");
					while (rs3.next()) {
						customer_names.add(rs3.getString("first_name"));
						customer_surnames.add(rs3.getString("last_name"));
					}
				}
				if (counter==0) {
					req.setAttribute("clr","yes");
				}
				else {
					req.setAttribute("clr", "no");
				}
				req.setAttribute("customer_names",customer_names);
				req.setAttribute("customer_surnames", customer_surnames);
				req.setAttribute("reservation_ids", reservationIds);
				req.setAttribute("prices", prices);
				req.setAttribute("room_ids", roomIds);
				req.setAttribute("hotel_id", hotel_id);
				req.setAttribute("irs_customers",irs_customers);
				req.setAttribute("irs_employee", irs);
				
				getServletContext().getRequestDispatcher("/employeeRent.jsp").forward(req,res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			getServletContext().getRequestDispatcher("/exceptionHandler.jsp").forward(req,res);
			out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
