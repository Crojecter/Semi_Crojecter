package com.kh.board.gallery.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.gallery.model.dao.GalleryDao;
import com.kh.board.gallery.model.vo.Gallery;

public class GalleryService {
	
	private GalleryDao gDao = new GalleryDao();

	
	public Gallery selectOne(int bid) {
		
		Connection con = getConnection();
		
		Gallery g = gDao.selectOne(con, bid);
		
		close(con);
		
		return g;
	}
	

	public Gallery updateView(int bid) {
		
		Connection con = getConnection();
		
		Gallery g = gDao.selectOne(con, bid);
		
		close(con);
		
		return g;
	}



	public ArrayList<Gallery> selectGalleryList() {
		// 		Connection con = getConnection();
		GalleryDao gDao = new GalleryDao();
				
		Connection con = getConnection();
				
		ArrayList<Gallery> list = gDao.selectList(con);
		
		close(con);
		
		return list;
	}



}
