package com.kh.board.project.model.dao;

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
import com.kh.board.project.model.vo.Project;

public class ProjectDao {
	
	private Properties prop = new Properties();
	
	public ProjectDao() {
		
		String filePath = ProjectDao.class.getResource("/config/project-query.properties").getPath();
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

	public int insertBoardContent(Connection con, Project p, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			pstmt.setInt(1, bid);
			pstmt.setInt(2, p.getBtype());
			pstmt.setString(3, p.getBtitle());
			pstmt.setString(4, p.getBcontent());
			pstmt.setInt(5, p.getBwriter());			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("ProjectDao insertBoardContent result : " + result);
		return result;
	}

	public int insertProjectContent(Connection con, Project p, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertProject");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			System.out.println("p.getJtag() : " + p.getJtag());
			pstmt.setDate(1, p.getJend());
			pstmt.setInt(2, bid);
			pstmt.setString(3, p.getJtag());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("ProjectDao insertProjectContent result : " + result);
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
		
		System.out.println("ProjectDao insertAttachedfile result : " + result);
		return result;
	}



}
