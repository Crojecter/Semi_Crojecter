package com.kh.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ajax.model.service.Service;
import com.kh.spon.model.vo.Spon;

/**
 * Servlet implementation class SponServlet
 */
@WebServlet("/spon.sp")
public class SponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int giver = Integer.parseInt(request.getParameter(""));
		int receiver = Integer.parseInt(request.getParameter(""));
		int hodu = Integer.parseInt(request.getParameter(""));
		int hoduId = 0;
		switch(hodu){
			case 10 : hoduId = 1; break;
			case 30 : hoduId = 2; break;
			case 40 : hoduId = 3; break;
			case 100 : hoduId = 4; break;
		}
		
		Spon sp = new Spon();
		
		sp.setSgiverid(giver);
		sp.setSreceiverid(receiver);
		sp.setShodu(hodu);
		
		Service s = new Service();
		int result = s.spon(sp, hoduId);
		
		if(result > 0) {
			System.out.println("후원 성공");
		} else {
			System.out.println("후원 실패");
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
