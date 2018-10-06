package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntuadatabases.dao.hotelgroupsdao;
import com.ntuadatabases.model.Hotelgroups;

public class Hotelgroupscontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/adminhotelgroups.jsp";
	private static String LIST_HOTELGROUPS = "/listadminhotelgroups.jsp";
	private hotelgroupsdao dao;

	public Hotelgroupscontroller() {
		super();
		dao = new hotelgroupsdao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
		try {

			if (action.equalsIgnoreCase("delete")) {
				int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
				dao.deleteHotelgroup(hotel_group_id);
				forward = LIST_HOTELGROUPS;
				request.setAttribute("hotelgroup", dao.getAllHotelgroups());
			} else if (action.equalsIgnoreCase("edit")) {
				forward = INSERT_OR_EDIT;
				int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
				Hotelgroups hotelgroup = dao.getHotelgroupById(hotel_group_id);
				request.setAttribute("hotelgroup", hotelgroup);
			} else if (action.equalsIgnoreCase("listhotelgroups")) {
				forward = LIST_HOTELGROUPS;
				request.setAttribute("hotelgroup", dao.getAllHotelgroups());
			} else {
				forward = INSERT_OR_EDIT;
			}

			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			Hotelgroups hotelgroup = new Hotelgroups();
			hotelgroup.setname(request.getParameter("name"));
			hotelgroup.setStreet(request.getParameter("street"));
			hotelgroup.setnum(Integer.parseInt(request.getParameter("num")));
			hotelgroup.setpostalcode(Integer.parseInt(request.getParameter("postal_code")));
			hotelgroup.setCity(request.getParameter("city"));
			String hotel_group_id = request.getParameter("hotel_group_id");
			String forward = "";
			if (hotel_group_id == null || hotel_group_id.isEmpty()) {
				if (!dao.addHotelgroup(hotelgroup)) {
					out.println("<script> alert('Cannot add hotel group.'); window.history.back();</script>");
					return;
				} else {
					forward = LIST_HOTELGROUPS;
					request.setAttribute("hotelgroup", dao.getAllHotelgroups());
				}
			} else {
				hotelgroup.setHotelgroupid(Integer.parseInt(hotel_group_id));

				if (!dao.updateHotelgroup(hotelgroup)) {
					out.println("<script> alert('Cannot update hotel group.'); window.history.back();</script>");
					return;
				} else {
					forward = LIST_HOTELGROUPS;
					request.setAttribute("hotelgroup", dao.getAllHotelgroups());
				}

			}
			RequestDispatcher view = request.getRequestDispatcher(LIST_HOTELGROUPS);
			request.setAttribute("hotelgroups", dao.getAllHotelgroups());
			view.forward(request, response);
		} catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");

		}

	}
}
