package com.ntua.databases;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
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
		PrintWriter out = res.getWriter();
		try {
			Statement statement=connection.createStatement();
			String name=req.getParameter("name");
			String surname=req.getParameter("surname");
			String irs=req.getParameter("irs");
			String room=req.getParameter("room");
			String hotel=req.getParameter("hotel");
			String start_month=req.getParameter("start-month-selector");
			String end_month=req.getParameter("end-month-selector");
			String start_date=req.getParameter("start-date-selector");
			String end_date=req.getParameter("end-date-selector");
			String start_year=req.getParameter("start-year-selector");
			String end_year=req.getParameter("end-year-selector");
			String start="0";
			
  
			if (! (start_date.equals("0") || start_month.equals("00") || start_year.equals("0"))) {
				start=start_year+'-'+start_month+'-'+start_date;

			}
			
			String finish="0";
			if (! (end_date.equals("0") || end_month.equals("00") || end_year.equals("0") )) {
				finish=end_year+'-'+end_month+'-'+end_date;
			}
			
			if (start=="0" || finish=="0") {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Start date or finish date not specified');");
				out.println("window.history.back();");
				out.println("</script>");

			}
			else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date myStart=sdf.parse(start); 
				Date myEnd=sdf.parse(finish);
				if (myStart.compareTo(myEnd)>0) {
					  out.println("<script type=\"text/javascript\">");
					  out.println("alert('Start and end date collision');");
					  out.println("window.history.back();");
					  out.println("</script>");
				}
				else {
					String today=java.time.LocalDate.now().toString();
					Date myToday=sdf.parse(today);
					if (myStart.compareTo(myToday)<0) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('You can't book the past');");
						out.println("window.history.back()");
						out.println("</script>");

					}
					else {
						String checkQuery="select * from reserves where not (finish_date<\'"+start+"\' or start_date >\'"+finish+"\') and room_id="+room+";";
//						out.println(checkQuery);
						ResultSet rs=statement.executeQuery(checkQuery);
						Boolean flag=true;
						while (rs.next()) {
							flag=false;
						}
						if (flag==false) {
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Sorry, the room is not available for the specified dates');");
							out.println("window.history.back()");
							out.println("</script>");
						}
						else {

							String query="insert into reserves (irs,room_id,hotel_id,start_date,finish_date,paid) values ("+irs+","+room+","+hotel+",\'"+start+"\',\'"+finish+"\',0);";
//							out.println(query);
							statement.executeUpdate(query);
							getServletContext().getRequestDispatcher("/reservationReady.jsp").forward(req,res);
						}
					}
					
				}

			}

			

		} catch (SQLException e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
//			getServletContext().getRequestDispatcher("/exceptionHandler.jsp").forward(req,res);
			out.println(e.getMessage());
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			out.println("<script> alert('Correct your input and try again :) '); window.history.back();</script>");

			out.println(e.getMessage());
//			e.printStackTrace();
		}
		catch (Exception e) {
			out.println("<script> alert('Correct your input and try again :) '); window.history.back();</script>");

		}
	}

}
