package com.kh.adminpage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChangeStatusServlet
 */
@WebServlet("/mStatusChange.do")
public class ChangeStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int mStatus = Integer.parseInt(request.getParameter("changeSel"));
		int mId = Integer.parseInt(request.getParameter("chageMid"));
	
		MemberService  ms = new MemberService();
		
		HttpSession session = request.getSession(false);
		Member m = new Member();
		
		m.setMsid(mStatus);
		m.setMid(mId);
		
		int result = ms.updateMemberStatus(m);
		
		if(result > 0) System.out.println("상태 수정 성공");
		else System.out.println("상태 수정 실패");
	
		System.out.println(m);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
