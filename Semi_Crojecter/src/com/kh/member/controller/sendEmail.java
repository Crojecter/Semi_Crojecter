package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class sendEmail
 */
@WebServlet("/send.do")
public class sendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		// getParameter() 로 가져온 부분만 암호화 복호화가 됨.
		// jsp 부분에서 임시비밀번호 발생시켜서 가져오기.
		
		MemberService ms = new MemberService();
		Member m = new Member();
		
		m.setMname(nickName);
		m.setMemail(email);
		
		int result = ms.sendEmail(m);
		
		// 임시비밀번호 발생
		/*String tempPassword = "";

		for (int i = 0; i < 8; i++) {

			int rndVal = (int) (Math.random() * 62);

			if (rndVal < 10) {
				tempPassword += rndVal;
			} else if (rndVal > 35) {
				tempPassword += (char) (rndVal + 61);
			} else {
				tempPassword += (char) (rndVal + 55);
			}

		}*/
		
		//request.setAttribute("tempPassword", tempPassword);
		
		if(result > 0) {
			
			// 임시비밀번호로 업데이트 (업데이트하고난 후 로그인 안됨)
			String tempPwd = request.getParameter("tempPassword");
			String whatPwd = request.getParameter("tempPwd");
			System.out.println("임시 비밀번호 : " + whatPwd);
			
			int resultPwd = ms.rndPwd(tempPwd, m);
			
			if(resultPwd > 0) {
				System.out.println("임시비밀번호로 수정 성공");
			} else {
				System.out.println("임시비밀번호로 수정 실패");
			}
			
			// 이메일 전송
			
			
			System.out.println("이메일 전송 성공");
		} else {
			System.out.println("이메일 전송 실패");
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
