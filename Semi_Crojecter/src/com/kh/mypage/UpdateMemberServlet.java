package com.kh.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/mUpdate.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mname = request.getParameter("nickName");
		String memail = request.getParameter("email");
		String mpwd = request.getParameter("password");

		MemberService ms = new MemberService();
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		m.setMname(mname);
		m.setMemail(memail);
		m.setMpwd(mpwd);
		
		ms.updateMember(m);
		
		if(m != null){
			System.out.println("회원정보 수정 성공!");
		} else {
			System.out.println("회원정보 수정 실패");
		}
		
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