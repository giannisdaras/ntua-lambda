package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntuadatabases.dao.hotelgroupsdao;
import com.ntuadatabases.model.Hotelgroups;

/**
 * Servlet implementation class HotelmailsController
 */
@WebServlet("/HotelgroupmailsController")
public class HotelgroupmailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_MAILS = "/listhotelgroupmails.jsp";
	private static String INSERT_OR_EDIT_MAIL = "/adminhotelgroupmails.jsp";
	private hotelgroupsdao dao;

	public HotelgroupmailsController() {

		super();
		dao = new hotelgroupsdao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String forward = "";
		String action = request.getParameter("action");
		try {
		if (action.equalsIgnoreCase("delete")) {
			int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
			String mail = request.getParameter("mail");
			dao.deletemail(hotel_group_id, mail);
			forward = LIST_MAILS;
			request.setAttribute("mail", dao.getAllMails(hotel_group_id));
			request.setAttribute("hotel_group_id", hotel_group_id);
		} else if (action.equalsIgnoreCase("listmails")) {
			int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
			forward = LIST_MAILS;
			request.setAttribute("mail", dao.getAllMails(hotel_group_id));
			request.setAttribute("hotel_group_id", hotel_group_id);
		} else {
			int hotel_group_id = Integer.parseInt(request.getParameter("hotel_group_id"));
			forward = INSERT_OR_EDIT_MAIL;
			request.setAttribute("hotel_group_id", hotel_group_id);
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		}
		catch (Exception e) {
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
		String mail = request.getParameter("mail");
		String hotel_group_id = request.getParameter("hotel_group_id");
		String forward = "";
		try {
			if (!dao.addmail(Integer.parseInt(hotel_group_id), mail)) {
				out.println("<script> alert('Email error'); window.history.back();</script>");
			} else {
				forward = LIST_MAILS;
				request.setAttribute("mail", dao.getAllMails(Integer.parseInt(hotel_group_id)));
				request.setAttribute("hotel_group_id", hotel_group_id);

				RequestDispatcher view = request.getRequestDispatcher(forward);
				view.forward(request, response);
			}
		} catch (Exception e) {
			out.println("<script> alert('Email submit error'); window.history.back();</script>");
		}
	}

}