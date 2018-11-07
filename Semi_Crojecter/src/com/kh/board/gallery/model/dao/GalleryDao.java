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

}
