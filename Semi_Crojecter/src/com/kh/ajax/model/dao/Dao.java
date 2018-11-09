package com.kh.ajax.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.dao.MemberDao;
import static com.kh.common.JDBCTemplate.*;

public class Dao {

	private Properties prop = new Properties();
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	public Dao(){
		
		String filePath = Dao.class.getResource("/config/ajax-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public int checkNickName(Connection con, String nickName) {
		
		int result = 0;
		
		String sql = prop.getProperty("checkNickName");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, nickName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int checkEmail(Connection con, String email) {

		int result = 0;
		
		String sql = prop.getProperty("checkEmail");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}

	public String searchNickName(Connection con, String email) {
		
		String result = null;

		String sql = prop.getProperty("searchNickName");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, email);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				result = rset.getString(1);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(pstmt);

		}

		return result;

	}

}
