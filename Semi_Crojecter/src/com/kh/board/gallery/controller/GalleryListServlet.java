package com.kh.board.gallery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.gallery.model.service.GalleryService;
import com.kh.board.gallery.model.vo.Gallery;
import com.kh.board.gallery.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/gList.ga")
public class GalleryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 목록용 서블릿
		ArrayList<Gallery> list = null;
		GalleryService gs = new GalleryService();
		
		int startPage;		// 첫 페이지	
		int endPage;		// 마지막 페이지 
		int maxPage;		// 전체페이지의 마지막 페이지
		int currentPage;	// 현재 사용자가 위치한 페이지
		int limit;			// 한번에 보여줄 페이지 수

		currentPage = 1;
		// 한번에 보여줄 페이지 수 / 한 페이지에 표시할 게시글 수
		limit = 20; // 
		// 만약에 사용자가 현재 접속한 페이지의 정보를 가진다면, 해당페이지의 정보를 받을수 있어야 한다.
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// 전체 게시글 수 조회하기
		int countGalleryList = gs.getCountGalleryList();
		
		System.out.println("전체 게시글 수 : "+ countGalleryList);
					
		maxPage = (int)((double)countGalleryList / limit + 0.9);
		
		startPage = ((int)((double)currentPage / limit + 1.9) - 1) * limit + 1;
		
		endPage = startPage + limit;
		
		// 마지막 페이지보다 현재 게시글의 페이지가 적다면 endPage를 max페이지로 바꿔준다.
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		list = gs.selectGalleryList(currentPage, limit);
		System.out.println("GalleryListServlet ga : "+ list);
		String page = "";
		
		if(list != null){
			
			PageInfo pi = new PageInfo(currentPage, countGalleryList, limit, maxPage, startPage, endPage);
			
			page = "galleryMain.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		} else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회실패");
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
