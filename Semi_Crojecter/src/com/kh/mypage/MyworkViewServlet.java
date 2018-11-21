package com.kh.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.gallery.model.service.GalleryService;
import com.kh.board.gallery.model.vo.Gallery;
import com.kh.board.notice.model.service.NoticeService;
import com.kh.board.notice.model.vo.Notice;


/**
 * Servlet implementation class MyworkViewServlet
 */
@WebServlet("/mworkView.do")
public class MyworkViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyworkViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Gallery> glist = null;
		GalleryService gs = new GalleryService();
		
		int mid = Integer.parseInt(request.getParameter("mid"));

		glist = gs.searchGallery(mid);
		
		System.out.println("work list : " + glist);
		
		if(glist != null){
			
			request.setAttribute("glist", glist);
			request.getRequestDispatcher("views/mypage/myworkList.jsp").forward(request, response);
			
		} else {
			
			request.setAttribute("msg", "조회 실패!");
			
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
