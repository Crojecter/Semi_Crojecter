package com.kh.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Payment;


/**
 * Servlet implementation class FollowingViewServlet
 */
@WebServlet("/paymentSelect.do")
public class PaymentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Payment> list = null;
		PaymentService ps = new GalleryService();
		int mid = Integer.parseInt(request.getParameter("mid"));
		
		list = ps.searchPayment(mid);
		
		if(list != null){
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/mypage/paymentList.jsp").forward(request, response);
			
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

