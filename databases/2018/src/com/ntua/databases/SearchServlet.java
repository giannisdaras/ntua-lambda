package com.ntua.databases;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.sql.*;
import java.util.*;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/welcome.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out=res.getWriter();
		try {
			String stars=req.getParameter("starSelector");
			String capacity=req.getParameter("capacitySelector");
			String group=req.getParameter("groupSelector");
			String start_month=req.getParameter("start-month-selector");
			String end_month=req.getParameter("end-month-selector");
			String start_date=req.getParameter("start-date-selector");
			String end_date=req.getParameter("end-date-selector");
			String start_year=req.getParameter("start-year-selector");
			String end_year=req.getParameter("end-year-selector");
			String price=req.getParameter("price");
			String option=req.getParameter("optionSelector");
			String locations[]=req.getParameterValues("locations");
			String num=req.getParameter("num");
			String today=java.time.LocalDate.now().toString();

			Connector obj=new Connector();
			Connection connection=obj.grabConnection();
			Statement statement=connection.createStatement();
			String columns="hotel_group.name as name2,hotel.name,room_id, hotel_room.hotel_id, price, repairs_needed, expandable, view, capacity, stars, hotel.hotel_group_id, hotel.street, hotel.num, hotel.postal_code, hotel.city";
			String columns2="tmp.name2,tmp.name,tmp.room_id, tmp.hotel_id, price, repairs_needed, expandable, view, capacity, stars, tmp.hotel_group_id, tmp.street, tmp.num, tmp.postal_code, tmp.city";

			String firstQuery="create temporary table tmp select "+columns+" from hotel_room inner join hotel on hotel_room.hotel_id=hotel.hotel_id inner join hotel_group on hotel.hotel_group_id=hotel_group.hotel_group_id where (";
			if (! stars.equals("_______")) {
				firstQuery=firstQuery+"stars="+stars+" and ";
			}
			if (! capacity.equals("_______")) {
				firstQuery=firstQuery+"capacity >="+capacity+ " and ";
			}
			if (!group.equals("_______")) {
				firstQuery=firstQuery+"hotel_group.hotel_group_id="+group+ " and ";
			}
			
			if (!price.equals("")) {
				firstQuery=firstQuery+"hotel_room.price<="+price+" and ";
			}

			int len=locations.length;
			int index=1;
			if (len>0) {
				firstQuery=firstQuery+"hotel.city in (";
			}
			for (String x : locations) {
				if (index==len) {
					firstQuery=firstQuery+"\'"+x+"\'"+") and ";
				}
				else {
					firstQuery=firstQuery+"\'"+x+"\'"+",";
				}
				index=index+1;
			}
			firstQuery=firstQuery+ "1=1 );";
			out.println(firstQuery);
			statement.executeUpdate(firstQuery);
			
			
			
			
			String start="0";
			if (! (start_date.equals("0") || start_month.equals("00") || start_year.equals("0"))) {
				start=start_year+'-'+start_month+'-'+start_date;

			}
			
			String finish="0";
			if (! (end_date.equals("0") || end_month.equals("00") || end_year.equals("0") )) {
				finish=end_year+'-'+end_month+'-'+end_date;
			}
			
			Boolean flag=false;
			Boolean flagStart=false;
			Boolean flagEnd=false;
			String case1="create temporary table tmp2 select distinct "+columns2+" from tmp order by "+option+";";
			String secondQuery="create temporary table tmp2 select distinct "+columns2+" from tmp left join reserves on tmp.room_id=reserves.room_id where ( (reserves.room_id is null) or (";
			if (!start.equals("0")) {
				flag=true;
				flagStart=true;
			}
			if (!finish.equals("0")) {
				flag=true;
				flagEnd=true;
			}
			
			if (flagStart==true && flagEnd==true) {
				// both start date and end date specified
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date myStart=sdf.parse(start); 
					Date myEnd=sdf.parse(finish);
					if (myStart.compareTo(myEnd)>0) {
						// end date before start date problem
						req.setAttribute("prob","yes");
						getServletContext().getRequestDispatcher("/hotelSelection.jsp").forward(req, res);
					}
					else {
						myStart=sdf.parse(start); 
						Date myToday=sdf.parse(today);
						if (myStart.compareTo(myToday)<0) {
							// start date belongs to past
							req.setAttribute("alert","yes");
							getServletContext().getRequestDispatcher("/hotelSelection.jsp").forward(req, res);

						}
						else {
							myEnd=sdf.parse(finish); 
							myToday=sdf.parse(today);
							if (myEnd.compareTo(myToday)<0) {
								// end date belongs to past
								req.setAttribute("alert","yes");
								getServletContext().getRequestDispatcher("/hotelSelection.jsp").forward(req, res);
							}
							else {
								secondQuery=secondQuery+"(finish_date<\'"+start+"\') or (start_date>\'"+finish+"\')";
							}
						}
					}

			}
			else if (flagStart==false && flagEnd==false) {
				// both not specified
			}
			else {
				// only one of them specified
				req.setAttribute("both", "no");
				getServletContext().getRequestDispatcher("/hotelSelection.jsp").forward(req, res);
			}
			
			secondQuery=secondQuery+")) order by "+option+";";
			ResultSet rs;
			if (flag==true) {
				out.println(secondQuery);
				statement.executeUpdate(secondQuery);
			}
			else {
				out.println(case1);
				statement.executeUpdate(case1);
			}
			String helpQuery="create temporary table tmp3 like tmp2";
			statement.executeUpdate(helpQuery);
			helpQuery="insert tmp3 select * from tmp2";
			statement.executeUpdate(helpQuery);
			String finalQuery;
			
			if (!num.equals("")) {
				finalQuery="select * from tmp2 where hotel_id in (select hotel_id from tmp3 group by hotel_id having count(hotel_id)>="+num+")";
			}
			else {
				finalQuery="select * from tmp2";
			}
			out.println(finalQuery);
			rs=statement.executeQuery(finalQuery);
			List<Integer> rooms=new ArrayList<Integer>();
			List<Integer> hotels=new ArrayList<Integer>();
			List<Integer> capacities=new ArrayList<Integer>();
			List<Integer> hotel_stars=new ArrayList<Integer>();
			List<Float> prices=new ArrayList<Float>();
			List<Integer> hotel_groups=new ArrayList<Integer>();
			List<Boolean> views=new ArrayList<Boolean>();
			List<Boolean> repairs=new ArrayList<Boolean>();
			List<Boolean> expandable=new ArrayList<Boolean>();
			List<String> cities= new ArrayList<String>();
			List<String> streets= new ArrayList<String>();
			List<String> hotel_names=new ArrayList<String>();
			List<String> hotel_group_names=new ArrayList<String>();
			List<String> hotel_room_amenities=new ArrayList<String>();
			index=0;
			while (rs.next()) {
				hotel_names.add(rs.getString("name"));
				hotel_group_names.add(rs.getString("name2"));
				hotel_groups.add(rs.getInt("hotel_group_id"));
				capacities.add(rs.getInt("capacity"));
				prices.add(rs.getFloat("price"));
				repairs.add(rs.getBoolean("repairs_needed"));
				expandable.add(rs.getBoolean("expandable"));
				hotel_stars.add(rs.getInt("stars"));
				views.add(rs.getBoolean("view"));
				rooms.add(rs.getInt("room_id"));
				hotels.add(rs.getInt("hotel_id"));
				streets.add(rs.getString("street"));
				cities.add(rs.getString("city"));
				Statement amen=connection.createStatement();
				ResultSet rsAmen=amen.executeQuery("select amenity from amenities inner join hotel_room_amenities on amenities.amenity_id=hotel_room_amenities.amenity_id where room_id="+rs.getInt("room_id")+";");
				String tmp="";
				while (rsAmen.next()) {
					tmp=tmp+rsAmen.getString("amenity")+", ";
				}
				if (tmp.length()>2) {
					tmp=tmp.substring(0,tmp.length()-2);
				}
				hotel_room_amenities.add(tmp);
				index=index+1;
			}
			statement.executeUpdate("drop temporary table tmp;");
			statement.executeUpdate("drop temporary table tmp2;");
			statement.executeUpdate("drop temporary table tmp3;");
			req.setAttribute("rooms",rooms);
			req.setAttribute("hotel_group_names", hotel_group_names);
			req.setAttribute("hotel_room_amenities", hotel_room_amenities);
			req.setAttribute("hotel_names",hotel_names);
			req.setAttribute("hotels", hotels);
			req.setAttribute("groups", hotel_groups);
			req.setAttribute("cities", cities);
			req.setAttribute("streets", streets);
			req.setAttribute("repairs", repairs);
			req.setAttribute("views", views);
			req.setAttribute("expandable", expandable);
			req.setAttribute("stars", hotel_stars);
			req.setAttribute("prices", prices);
			req.setAttribute("capacities", capacities);
			req.setAttribute("index",index);
			getServletContext().getRequestDispatcher("/roomSelection.jsp").forward(req,res);
		}
		catch (SQLException e) {
			getServletContext().getRequestDispatcher("/exceptionHandler.jsp").forward(req,res);
		}
		catch(NullPointerException e) {
			out.println("<script> alert('You should specify at least one location'); window.history.back();</script>");
		}
		catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
		}
	
		

	}

}





