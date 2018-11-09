package com.kh.spon.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.spon.model.vo.Spon;
import com.kh.spon.model.dao.SponDao;

public class SponDao {
	
	private Properties prop = null;
	
	public SponDao(){
		prop = new Properties();
		
		String filePath = SponDao.class
				.getResource("/config/mypage-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	 
	public ArrayList<Spon> selectList(Connection con){
		ArrayList<Spon> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Spon>();
			
			while(rset.next()){
				Spon s = new Spon();
				
				s.setSid(rset.getInt("sid"));
				s.setShodu(rset.getInt("shodu"));
				s.setSdate(rset.getDate("sdate"));
				s.setSgiverid(rset.getInt("sgiverid"));
				s.setSreceiverid(rset.getInt("sreceiverid"));
				
				list.add(s);
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
