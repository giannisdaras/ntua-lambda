package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntuadatabases.dao.hotelsdao;
import com.ntuadatabases.model.Hotels;

public class HotelsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/adminhotels.jsp";
    private static String LIST_HOTELS = "/listadminhotels.jsp";
    private static String LIST_MAILS= "/listhotelmails.jsp";
    private static String INSERT_OR_EDIT_MAILS="/adminhotelmails.jsp";
    private hotelsdao dao;

    public HotelsController() {
        super();
        dao = new hotelsdao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        PrintWriter out=response.getWriter();
        try {
            if (action.equalsIgnoreCase("delete")){
                int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
                dao.deleteHotel(hotel_id);
                forward = LIST_HOTELS;
                request.setAttribute("hotel", dao.getAllHotels());    
            } else if (action.equalsIgnoreCase("edit")){
                forward = INSERT_OR_EDIT;
                int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
                Hotels hotel = dao.getHotelById(hotel_id);
                request.setAttribute("hotel",hotel);
            } else if (action.equalsIgnoreCase("listhotels")){
                forward = LIST_HOTELS;
                request.setAttribute("hotel", dao.getAllHotels());
            }
            else {
                forward = INSERT_OR_EDIT;
            }

            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request, response);
        }
        catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Hotels hotel = new Hotels();
        PrintWriter out=response.getWriter();
        try {
        	hotel.setHotelgroupid(Integer.parseInt(request.getParameter("hotel_group_id")));
            hotel.setname(request.getParameter("name"));
            hotel.setstars(Integer.parseInt(request.getParameter("stars")));
            hotel.setStreet(request.getParameter("street"));
            hotel.setnum(Integer.parseInt(request.getParameter("num")));
            hotel.setpostalcode(Integer.parseInt(request.getParameter("postal_code")));
            hotel.setCity(request.getParameter("city"));
            String hotel_id = request.getParameter("hotel_id");
            String forward="";
            if(hotel_id == null || hotel_id.isEmpty())
            {
                dao.addHotel(hotel);
                forward = LIST_HOTELS;
                request.setAttribute("hotel",dao.getAllHotels());
                
            }
            else
            {
                hotel.setHotelid(Integer.parseInt(hotel_id));
                dao.updateHotel(hotel);
                forward=LIST_HOTELS;
                request.setAttribute("hotel",dao.getAllHotels());
            }
            RequestDispatcher view = request.getRequestDispatcher(LIST_HOTELS);
            request.setAttribute("hotels", dao.getAllHotels());
            view.forward(request, response);
        }
        catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
        }
    }
}
