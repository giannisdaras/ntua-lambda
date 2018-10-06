package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntuadatabases.dao.hotelsdao;

/* Servlet implementation class HotelphonesController */

public class HotelphonesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_PHONES = "/listhotelphones.jsp";
	private static String INSERT_OR_EDIT_PHONE = "/adminhotelphones.jsp";
	private hotelsdao dao;

	public HotelphonesController() {

		super();
		dao = new hotelsdao();
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
				int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
				long phone = Long.parseLong(request.getParameter("phone"));
				dao.deletephone(hotel_id, phone);
				forward = LIST_PHONES;
				request.setAttribute("phone", dao.getAllPhones(hotel_id));
				request.setAttribute("hotel_id", hotel_id);
			} else if (action.equalsIgnoreCase("listphones")) {
				int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
				forward = LIST_PHONES;
				request.setAttribute("phone", dao.getAllPhones(hotel_id));
				request.setAttribute("hotel_id", hotel_id);
			} else {
				int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
				forward = INSERT_OR_EDIT_PHONE;
				request.setAttribute("hotel_id", hotel_id);
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
		PrintWriter out=response.getWriter();
		String phone = request.getParameter("phone");
		String hotel_id = request.getParameter("hotel_id");
		String forward = "";
		try {
			dao.addphone(Integer.parseInt(hotel_id), Long.parseLong(phone));
			forward = LIST_PHONES;
			request.setAttribute("phone", dao.getAllPhones(Integer.parseInt(hotel_id)));
			request.setAttribute("hotel_id", hotel_id);
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
		}

	}

}
