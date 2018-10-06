package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static java.lang.System.out;

import com.ntuadatabases.dao.roomsdao;
import com.ntuadatabases.model.Rooms;

public class RoomsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/adminrooms.jsp";
    private static String LIST_ROOMS= "/listadminrooms.jsp";
    private roomsdao dao;

    public RoomsController() {
        super();
        dao = new roomsdao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        PrintWriter out=response.getWriter();
        try {
        	if (action.equalsIgnoreCase("delete")){
                int room_id = Integer.parseInt(request.getParameter("room_id"));
                dao.deleteRoom(room_id);
                forward = LIST_ROOMS;
                request.setAttribute("room", dao.getAllRooms());    
            } else if (action.equalsIgnoreCase("edit")){
                forward = INSERT_OR_EDIT;
                int room_id = Integer.parseInt(request.getParameter("room_id"));
                Rooms room = dao.getRoomById(room_id);
                request.setAttribute("room",room);
            } else if (action.equalsIgnoreCase("listrooms")){
                forward = LIST_ROOMS;
                request.setAttribute("room", dao.getAllRooms());
            } else {
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
        Rooms room = new Rooms();
        PrintWriter out=response.getWriter();
        try {
        	room.sethotelid(Integer.parseInt(request.getParameter("hotel_id")));
            room.setprice(Float.parseFloat(request.getParameter("price")));
            room.setrepairsneeded(Integer.parseInt(request.getParameter("repairs_needed")));
            room.setexpandable(Integer.parseInt(request.getParameter("expandable")));
            room.setview(Integer.parseInt(request.getParameter("view")));
            room.setcapacity(Integer.parseInt(request.getParameter("capacity")));
            String room_id = request.getParameter("room_id");
            String forward="";
            if(room_id == null || room_id.isEmpty())
            {
                dao.addRoom(room);
                forward = LIST_ROOMS;
                request.setAttribute("room",dao.getAllRooms());
                
            }
            else
            {
                room.setroomid(Integer.parseInt(room_id));
                dao.updateRoom(room);
                forward=LIST_ROOMS;
                request.setAttribute("room",dao.getAllRooms());
            }
            RequestDispatcher view = request.getRequestDispatcher(LIST_ROOMS);
            request.setAttribute("room", dao.getAllRooms());
            view.forward(request, response);
        }
        catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
        }
        
    }
}
