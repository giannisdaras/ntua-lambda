package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import com.ntuadatabases.dao.hotelgroupsdao;

/* Servlet implementation class HotelphonesController */

@WebServlet("/HotelgroupphonesController")
public class HotelgroupphonesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_PHONES = "/listhotelgroupphones.jsp";
	private static String INSERT_OR_EDIT_PHONE = "/adminhotelgroupphones.jsp";
	private hotelgroupsdao dao;

	public HotelgroupphonesController() {

		super();
		dao = new hotelgroupsdao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
		try {

			if (action.equalsIgnoreCase("delete")) {
				int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
				long phone = Long.parseLong(request.getParameter("phone"));
				dao.deletephone(hotel_group_id, phone);
				forward = LIST_PHONES;
				request.setAttribute("phone", dao.getAllPhones(hotel_group_id));
				request.setAttribute("hotel_group_id", hotel_group_id);
			} else if (action.equalsIgnoreCase("listphones")) {
				int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
				forward = LIST_PHONES;
				request.setAttribute("phone", dao.getAllPhones(hotel_group_id));
				request.setAttribute("hotel_group_id", hotel_group_id);
			} else {
				int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
				forward = INSERT_OR_EDIT_PHONE;
				request.setAttribute("hotel_group_id", hotel_group_id);
			}

			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String phone = request.getParameter("phone");
		String hotel_group_id = request.getParameter("hotel_group_id");
		String forward = "";
		try {
			if (!dao.addphone(Integer.parseInt(hotel_group_id), Long.parseLong(phone))) {
				out.println("<script> alert('An error occured'); window.history.back();</script>");
			} else {
				forward = LIST_PHONES;
				request.setAttribute("phone", dao.getAllPhones(Integer.parseInt(hotel_group_id)));
				request.setAttribute("hotel_group_id", hotel_group_id);
				RequestDispatcher view = request.getRequestDispatcher(forward);
				view.forward(request, response);
			}
		} catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");

		}

	}

}
