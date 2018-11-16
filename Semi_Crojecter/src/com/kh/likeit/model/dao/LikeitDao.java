package com.kh.likeit.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.board.gallery.model.dao.GalleryDao;

public class LikeitDao {

	private Properties prop = new Properties();
	
	public LikeitDao() {
		
		String filePath = LikeitDao.class.getResource("/config/likeit-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));		
		} catch (IOException e) {			
			e.printStackTrace();			
		}
	}
	

	public int checkLikeit(Connection con, int mid, int bid) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("isLikeit");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mid);
			pstmt.setInt(2, bid);

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

	public int deleteLikeit(Connection con, int mid, int bid) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteLikeit");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mid);
			pstmt.setInt(2, bid);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertLikeit(Connection con, int mid, int bid) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertLikeit");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mid);
			pstmt.setInt(2, bid);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}
}
