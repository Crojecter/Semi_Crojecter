package com.kh.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.likeit.model.service.LikeitService;
import com.kh.likeit.model.vo.Likeit;

/**
 * Servlet implementation class CollectViewServlet
 */
@WebServlet("/collectView.do")
public class CollectViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Likeit> list = null;
		LikeitService ls = new LikeitService();
		int mid = Integer.parseInt(request.getParameter("mid"));
		
		list = ls.searchLikeit(mid);
		System.out.println("collect list : " + list);
		
		if(list != null){
			
			request.setAttribute("list", list);
			System.out.println("list : " + list);
			request.getRequestDispatcher("views/mypage/mycollectList.jsp").forward(request, response);
			
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
