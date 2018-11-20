package com.kh.alarm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.gallery.model.service.GalleryService;

/**
 * Servlet implementation class AlarmUpdateServlet
 */
@WebServlet("/aUpdate.al")
public class AlarmUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlarmUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		int Aid = Integer.parseInt(request.getParameter("Aid"));
		
		int result = new GalleryService().updateAlarm(Aid);
		
		if(result > 0) {
			response.sendRedirect("gSelectOne.ga?bid="+Aid);
		} else {
			request.setAttribute("msg", "삭제 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
