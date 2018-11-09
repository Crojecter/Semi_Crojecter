package com.kh.board.gallery.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

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
				g.setMprofile(rset.getString("mprofile"));
				g.setMname(rset.getString("mname"));
				
				
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

	public ArrayList<Gallery> selectList(Connection con) {
		Statement stmt = null;
		ArrayList<Gallery> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Gallery>();
			
			while(rset.next()){
				Gallery g = new Gallery();
				
				g.setGid(rset.getInt("GID"));
				g.setGcategoryid(rset.getInt("GCATEGORYID"));
				g.setGtag(rset.getString("GTAG"));
				g.setGlike(rset.getInt("GLIKE"));
				g.setBid(rset.getInt("BID"));
				g.setBtype(rset.getInt("BTYPE"));
				g.setBtitle(rset.getString("BTITLE"));
				g.setBcontent(rset.getString("BCONTENT"));
				g.setBcount(rset.getInt("BCOUNT"));
				g.setBdate(rset.getDate("BDATE"));
				g.setBstatus(rset.getString("BSTATUS"));
				g.setBwriter(rset.getInt("BTYPE"));
				
				list.add(g);
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
