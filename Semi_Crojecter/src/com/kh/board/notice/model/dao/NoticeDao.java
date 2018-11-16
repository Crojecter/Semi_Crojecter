package com.kh.board.notice.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.common.model.vo.Board;
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

	public int insertAttachedfile(Connection con, ArrayList<AttachedFile> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAttachedfile");
		
		try{
			
			for(int i = 0 ; i < list.size(); i++){
				
				pstmt = con.prepareStatement(sql);				
				
				pstmt.setString(1, list.get(i).getFname());
				pstmt.setString(2, list.get(i).getFpath());
				
				// 첫번째 데이터일 경우 대표 이미지로 level = 1
				// 나머지 데이터는 일반 이미지로 level = 2
				int level = 2;
				if(i == 0 ) level = 1;
				
				pstmt.setInt(3, level);
				pstmt.setInt(4, list.get(i).getBid());
				System.out.println("list.get(i).getBid() : " + list.get(i).getBid());
				System.out.println("level : " + level);
				
				result += pstmt.executeUpdate();
				
			}
	
			
		} catch (SQLException e) {
			
		} finally {
			close(pstmt);
		}
		
		System.out.println("NoticeDao insertAttachedfile result : " + result);
		return result;
	}

	public ArrayList<Notice> selectNoticeList(Connection con) {
		// 
		ArrayList<Notice> noticeList = null;
		// 값이 변하지 않으면 Statememt를 사용하는것이 유리하다.
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectNoticeList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);

			noticeList = new ArrayList<Notice>();
			// next 값이 없을때까지
			while (rset.next()) {
				Notice n = new Notice();
				n.setBid(rset.getInt("BID"));
				n.setBwriter(rset.getInt("BWRITER"));
				n.setBtitle(rset.getString("BTITLE"));
				n.setBcontent(rset.getString("BCONTENT"));
				n.setBdate(rset.getDate("BDATE"));
				n.setBcount(rset.getInt("BCOUNT"));	
				noticeList.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return noticeList;
	}

	public Notice noticeSelectOne(Connection con, int bid) {
		// 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;

		String sql = prop.getProperty("noticeSelectOne");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bid);

			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				n = new Notice();
				n.setBid(rset.getInt("BID"));
				n.setBwriter(rset.getInt("BWRITER"));
				n.setBtitle(rset.getString("BTITLE"));
				n.setBcontent(rset.getString("BCONTENT"));
				n.setBdate(rset.getDate("BDATE"));
				n.setBcount(rset.getInt("BCOUNT"));
				
				System.out.println("조회할 notice : " + n);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int noticeUptdateCount(Connection con, int bid) {
		// 
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateNoticeCount");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}





}
