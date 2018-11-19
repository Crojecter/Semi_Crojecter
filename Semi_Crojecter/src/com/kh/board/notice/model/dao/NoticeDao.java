package com.kh.board.notice.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.board.notice.model.vo.Notice;

public class NoticeDao {
	
private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String filePath = NoticeDao.class.getResource("/config/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));		
		} catch (IOException e) {			
			e.printStackTrace();			
		}
	}

	public int selectCurrentBid(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String sql = prop.getProperty("selectCurrentBid");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				bid = rset.getInt(1); // "CURRVAL"
				System.out.println("bid : " + bid);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return bid;
	}

	public int insertBoardContent(Connection con, Notice n, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			pstmt.setInt(1, bid);
			pstmt.setInt(2, n.getBtype());
			pstmt.setString(3, n.getBtitle());
			pstmt.setString(4, n.getBcontent());
			pstmt.setInt(5, n.getBwriter());			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("NoticeDao insertBoardContent result : " + result);
		return result;
	}

	public Notice selectOne(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;

		String sql = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				n = new Notice();
                
				n.setBid(rset.getInt("bid"));
				n.setBtype(rset.getInt("btype"));
				n.setBtitle(rset.getString("btitle"));
				n.setBcontent(rset.getString("bcontent"));
				n.setBcount(rset.getInt("bcount"));
				n.setBdate(rset.getDate("bdate"));
				n.setBstatus(rset.getString("bstatus"));
				n.setBrcount(rset.getInt("brcount"));
				n.setBwriter(rset.getInt("bwriter"));
				n.setMname(rset.getString("mname"));

				System.out.println("m : " + n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return n;
	}

	public int updateBoard(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateBoard");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, n.getBtitle());
			pstmt.setString(2, n.getBcontent());
			pstmt.setInt(3, n.getBid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



}
