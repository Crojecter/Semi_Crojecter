package com.kh.mypage;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.gallery.model.vo.Gallery;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		
		if(ServletFileUpload.isMultipartContent(request)){

			int maxSize = 1024 * 1024 * 10;
			
			// 저장할 경로 설정하기
			String root = request.getServletContext().getRealPath("/resources");		
			String savePath = root + "/profileFiles/";
			
			MultipartRequest mrequest = new MultipartRequest(
					request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			String mpwd = mrequest.getParameter("password");
			String fileName = mrequest.getFilesystemName("file");
			
			System.out.println("mpwd : " + mpwd);
			System.out.println("filename : " + fileName);
			
			HttpSession session = request.getSession(false);
			Member m = (Member)session.getAttribute("member");
			
			m.setMpwd(mpwd);
			m.setMprofile(fileName);
			
			System.out.println("update m : " + m);
			
			int result = new MemberService().updateMember(m);
						
			if(result > 0) {
				response.sendRedirect("views/mypage.jsp");
			} else {
				request.setAttribute("msg", "파일 전송 실패!");				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
