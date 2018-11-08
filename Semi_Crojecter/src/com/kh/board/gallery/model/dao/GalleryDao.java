package com.kh.board.gallery.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.board.gallery.model.vo.Gallery;
import com.kh.board.gallery.model.vo.GalleryForDetail;

import static com.kh.common.JDBCTemplate.*;

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
				g.setGcategory(rset.getInt("gcategory"));
				g.setGtag(rset.getString("gtag"));
				g.setGlike(rset.getInt("glike"));
				g.setBid(rset.getInt("bid"));
				g.setCclid(rset.getInt("cclid"));
				g.setBtype(rset.getInt("btype"));
				g.setBtitle(rset.getString("btitle"));
				g.setBcontent(rset.getString("bcontent"));
				g.setBcount(rset.getInt("bcount"));
				g.setBdate(rset.getDate("bdate"));
				g.setBstatus(rset.getString("bstatus"));
				g.setBrcount(rset.getInt("brcount"));
				g.setBwriter(rset.getInt("bwriter"));
				
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

	public GalleryForDetail selectOneGFD(Connection con, int bid) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		GalleryForDetail gfd = null;
		
		String bSql = prop.getProperty("selectOneGfd");
				
		try {
			pstmt = con.prepareStatement(bSql);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				gfd = new GalleryForDetail();
				
				gfd.setBid(rset.getInt("bid"));
				gfd.setGid(rset.getInt("gid"));
				gfd.setMprofile(rset.getString("mprofile"));
				gfd.setMname(rset.getString("mname"));
				gfd.setGcategory(rset.getString("gcategory"));
				gfd.setCclname(rset.getString("cclname"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return gfd;
	}

	

}
