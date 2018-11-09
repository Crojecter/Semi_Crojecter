package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Payment;


public class PaymentService {
	
private PaymentDao pDao = new PaymentDao();
	
	public ArrayList<Payment> selectlist() {
		
		ArrayList<Payment> list = null;
		Connection con = getConnection();
		
		list = pDao.selectList(con);
		
		close(con);
		
		return list;

	}

}
