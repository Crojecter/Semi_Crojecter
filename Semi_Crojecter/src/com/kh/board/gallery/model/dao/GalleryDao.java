package com.kh.board.gallery.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
				gfd.setBtitle(rset.getString("btitle"));
				gfd.setBcontent(rset.getString("bcontent"));
				gfd.setMprofile(rset.getString("mprofile"));
				gfd.setMname(rset.getString("mname"));
				gfd.setGcategory(rset.getString("gcategory"));
				gfd.setCclname(rset.getString("cclname"));
				gfd.setGtag(rset.getString("gtag"));
				gfd.setBdate(rset.getDate("bdate"));
				
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
				GalleryForDetail g = new GalleryForDetail();
				
				g.setBid(rset.getInt("BID"));
				g.setGid(rset.getInt("GID"));
				g.setBtitle(rset.getString("BTITLE"));
				g.setBcontent(rset.getString("BCONTENT"));
				g.setBwriter(rset.getInt("BWRITER"));
				g.setGcategory(rset.getString("GCATEGORY"));
				g.setGtag(rset.getString("GTAG"));
				g.setBcount(rset.getInt("BCOUNT"));
				g.setBdate(rset.getDate("BDATE"));
				
				list.add(t);
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
