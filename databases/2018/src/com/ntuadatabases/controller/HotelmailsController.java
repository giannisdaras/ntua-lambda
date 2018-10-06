package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntuadatabases.dao.hotelsdao;
import com.ntuadatabases.model.Hotels;

/**
 * Servlet implementation class HotelmailsController
 */
/* @WebServlet("/HotelmailsController") */
public class HotelmailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_MAILS= "/listhotelmails.jsp";
    private static String INSERT_OR_EDIT_MAIL="/adminhotelmails.jsp"; 
    private hotelsdao dao;
  
    public HotelmailsController() {
   
            super();
            dao = new hotelsdao();
        }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward="";
        String action = request.getParameter("action");
        PrintWriter out= response.getWriter();
        try {
        	
        if (action.equalsIgnoreCase("delete")){
            int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
            String mail=request.getParameter("mail");
            dao.deletemail(hotel_id,mail);
            forward = LIST_MAILS;
            request.setAttribute("mail", dao.getAllMails(hotel_id));
            request.setAttribute("hotel_id",hotel_id);
        } else if (action.equalsIgnoreCase("listmails")){
        	int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
            forward = LIST_MAILS;
            request.setAttribute("mail", dao.getAllMails(hotel_id));
            request.setAttribute("hotel_id",hotel_id);
        }
        else {
        	int hotel_id=Integer.parseInt(request.getParameter("hotel_id"));
            forward = INSERT_OR_EDIT_MAIL;
            request.setAttribute("hotel_id",hotel_id);
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        }
        catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
        }
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String mail=request.getParameter("mail");
        String hotel_id = request.getParameter("hotel_id");
        String forward="";
        try {
            if (! dao.addmail(Integer.parseInt(hotel_id),mail) ) {
    			out.println("<script> alert('Cannot add mail'); window.history.back();</script>");
            }
            forward = LIST_MAILS;
            request.setAttribute("mail",dao.getAllMails(Integer.parseInt(hotel_id)));
            request.setAttribute("hotel_id",hotel_id);
         
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request, response);
        }
        catch(Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");

        }

	}

}
