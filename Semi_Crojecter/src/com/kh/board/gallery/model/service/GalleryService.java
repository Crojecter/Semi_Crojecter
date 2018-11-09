package com.kh.board.gallery.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.gallery.model.dao.GalleryDao;
import com.kh.board.gallery.model.vo.Gallery;
import com.kh.board.gallery.model.vo.GalleryForDetail;

public class GalleryService {
	
	private GalleryDao gDao = new GalleryDao();

	public GalleryForDetail selectOneGFD(int bid) {

		Connection con = getConnection();
		
		GalleryForDetail gfd = gDao.selectOneGFD(con, bid);
		
		close(con);
		
		return gfd;
	}

	public ArrayList<Gallery> selectGalleryList() {
		// 		Connection con = getConnection();
		private GalleryDao gDao = new GalleryDao();
				
		Connection con = getConnection();
				
		ArrayList<Gallery> list = gDao.selectList(con);
		
		close(con);
		
		return list;
	}

}
