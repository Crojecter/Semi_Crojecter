package com.kh.likeit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.likeit.model.service.LikeitService;

/**
 * Servlet implementation class LikeitSwitchServlet
 */
@WebServlet("/lSwitch.li")
public class LikeitSwitchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeitSwitchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mid = Integer.parseInt(request.getParameter("mid"));
		int bid = Integer.parseInt(request.getParameter("bid")); 
		
		int result = new LikeitService().switchLikeit(mid, bid);
		System.out.println("lSwitch.li result : " + result);
		
		response.getWriter().print((result == 0) ? "error" : (result == 1)? "delete" : "insert");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
