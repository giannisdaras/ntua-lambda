package com.ntuadatabases.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntuadatabases.dao.roomsdao;
import com.ntuadatabases.model.Rooms;

/**
 * Servlet implementation class RoomamenitiesController
 */
@WebServlet("/RoomamenitiesController")
public class RoomamenitiesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_AMENITIES = "/listroomamenities.jsp";
	private static String INSERT_OR_EDIT_AMENITIES = "/adminroomamenities.jsp";
	private roomsdao dao;

	public RoomamenitiesController() {

		super();
		dao = new roomsdao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		PrintWriter out=response.getWriter();
		try {
			if (action.equalsIgnoreCase("delete")) {
				int room_id = Integer.parseInt(request.getParameter("room_id"));
				String amenity = request.getParameter("amenity");
				dao.deleteamenity(room_id, amenity);
				forward = LIST_AMENITIES;
				request.setAttribute("amenity", dao.getAllAmenities(room_id));
				request.setAttribute("room_id", room_id);
			} else if (action.equalsIgnoreCase("listamenities")) {
				int room_id = Integer.parseInt(request.getParameter("room_id"));
				forward = LIST_AMENITIES;
				request.setAttribute("amenity", dao.getAllAmenities(room_id));
				request.setAttribute("room_id", room_id);
			} else {
				int room_id = Integer.parseInt(request.getParameter("room_id"));
				forward = INSERT_OR_EDIT_AMENITIES;
				request.setAttribute("room_id", room_id);
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
		String amenities[] = request.getParameterValues("amenities");
		PrintWriter out = response.getWriter();
		try {
			String room_id = request.getParameter("room_id");
			String forward = "";
			for (int j = 0; j < amenities.length; j++) {
				dao.addamenity(Integer.parseInt(room_id), amenities[j]);
			}

			forward = LIST_AMENITIES;
			request.setAttribute("amenity", dao.getAllAmenities(Integer.parseInt(room_id)));
			request.setAttribute("room_id", room_id);

			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} catch (NullPointerException e) {
			out.println("<script>alert('You should choose at least one amenity'); location='RoomsController?action=listrooms';</script>");
			
		}
		catch (Exception e) {
			out.println("<script> alert('An error occured'); window.history.back();</script>");
		}

	}

}
