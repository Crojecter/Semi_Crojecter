package com.kh.board.gallery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.gallery.model.service.GalleryService;
import com.kh.board.gallery.model.vo.GalleryForDetail;

/**
 * Servlet implementation class GallerySelectOneServlet
 */
@WebServlet("/gSelectOne.ga")
public class GallerySelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallerySelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bid = Integer.parseInt(request.getParameter("bid"));
			
		GalleryForDetail gfd = new GalleryService().selectOneGFD(bid);
		//ArrayList<BoardComment> clist = new BoardCommentService().selectList(bid);
		
		String page = "";
		if(gfd != null) {
			
			page = "views/board/galleryDetail.jsp";
			request.setAttribute("gallery", gfd);
			//request.setAttribute("clist", clist);
			
		} else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "갤러리 상세보기 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
