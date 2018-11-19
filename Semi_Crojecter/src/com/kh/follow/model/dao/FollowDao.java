package com.kh.follow.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class FollowDao {
	
	private Properties prop = new Properties();
	
	public FollowDao() {
		
		String filePath = FollowDao.class.getResource("/config/follow-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));		
		} catch (IOException e) {			
			e.printStackTrace();			
		}
	}
	

	public int checkFollow(Connection con, String wid, String mid) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("isFollow");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mid);
			pstmt.setString(2, wid);

			rset = pstmt.executeQuery();
			
			if(rset.next()) result = rset.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteFollow(Connection con, String wid, String mid) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteFollow");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mid);
			pstmt.setString(2, wid);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertFollow(Connection con, String wid, String mid) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertFollow");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mid);
			pstmt.setString(2, wid);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

}
