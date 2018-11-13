package com.kh.board.gallery.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.attachedfile.model.vo.AttachedFile;
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

	public int insertGallery(Gallery g, ArrayList<AttachedFile> list) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = gDao.insertGalleryContent(con, g);
		
		if(result1 > 0){
			int bid = gDao.selectCurrentBid(con);
			
			for(int i = 0; i < list.size(); i++){
				list.get(i).setBid(bid);
			}
			
		}
		
		int result2 = gDao.insertAttachedfile(con, list);
		
		if( result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Gallery> selectGalleryList(int currentPage, int limit) {
		
		Connection con = getConnection();
		ArrayList<Gallery> list = gDao.selectGalleryList(con, currentPage, limit);
		
		close(con);
		return list;
	}
	
	public int getCountGalleryList() {
		// TODO Auto-generated method stub

		Connection con = getConnection();
		int listCount = gDao.getCountGalleryList(con);
		
		close(con);		
		return listCount;
	}

		
	public ArrayList<Gallery> top5(){
		
		Connection con = getConnection();
		ArrayList<Gallery> list = gDao.top5(con);
		
		close(con);
		
		return list;
	}


}