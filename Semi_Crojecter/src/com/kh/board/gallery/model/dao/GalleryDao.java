package com.kh.board.gallery.model.dao;

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
import com.kh.board.gallery.model.vo.Gallery;

public class GalleryDao {
	
	private Properties prop = new Properties();
	
	public GalleryDao() {
		
		String filePath = GalleryDao.class.getResource("/config/gallery-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));		
		} catch (IOException e) {			
			e.printStackTrace();			
		}
	}
	
	
	public Gallery selectOne(Connection con, int bid) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Gallery g = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				g = new Gallery();
				
				g.setGid(rset.getInt("gid"));
				g.setGcategoryid(rset.getInt("gcategoryid"));
				g.setGtag(rset.getString("gtag"));
				g.setGlike(rset.getInt("glike"));
				g.setBid(rset.getInt("bid"));
				g.setCclid(rset.getInt("cclid"));
				g.setGcategoryname(rset.getString("gcategoryname"));
				g.setCclname(rset.getString("cclname"));
				
				g.setBtype(rset.getInt("btype"));
				g.setBtitle(rset.getString("btitle"));
				g.setBcontent(rset.getString("bcontent"));
				g.setBcount(rset.getInt("bcount"));
				g.setBdate(rset.getDate("bdate"));
				g.setBstatus(rset.getString("bstatus"));
				g.setBrcount(rset.getInt("brcount"));
				g.setBwriter(rset.getInt("bwriter"));
				g.setMname(rset.getString("mname"));
				g.setMprofile(rset.getString("mprofile"));
				
				
				//System.out.println("gdao g : " + g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return g;   
	}
	
	public int insertBoardContent(Connection con, Gallery g, int bid) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			pstmt.setInt(1, bid);
			pstmt.setInt(2, g.getBtype());
			pstmt.setString(3, g.getBtitle());
			pstmt.setString(4, g.getBcontent());
			pstmt.setInt(5, g.getBwriter());			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("insertBoardContent result : " + result);
		return result;
	}


	public int insertGalleryContent(Connection con, Gallery g, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertGallery");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, g.getGcategoryid());
			pstmt.setString(2, g.getGtag());
			pstmt.setInt(3, bid);
			pstmt.setInt(4, g.getCclid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("insertGalleryContent result : " + result);
		return result;
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
		
		System.out.println("insertAttachedfile result : " + result);
		return result;
	}




	

}
