package com.kh.payment.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Payment;

public class PaymentDao {
	
private Properties prop = null;
	
	public PaymentDao(){
		prop = new Properties();
		
		String filePath = PaymentDao.class
				.getResource("/config/mypage-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	 
	public ArrayList<Payment> selectList(Connection con){
		ArrayList<Payment> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPayment");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Payment>();
			
			while(rset.next()){
				Payment p = new Payment();
				
				//p.setPid(rset.getInt("pid"));
				p.setPmoney(rset.getInt("pmoney"));
				p.setPdate(rset.getDate("pdate"));
				p.setMid(rset.getInt("mid"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(stmt);
		}
		
		return list;
	}

}
