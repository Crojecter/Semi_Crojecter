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
		int result2 =0;
		
		System.out.println("insertGallery : " + g);
		
		int bid = gDao.selectCurrentBid(con);
		
		int result1 = gDao.insertBoardContent(con, g, bid);
		
		if(result1 > 0){

			result2 = gDao.insertGalleryContent(con, g, bid);
						
			for(int i = 0; i < list.size(); i++){
				list.get(i).setBid(bid);
			}
			
		}
		
		int result3 = gDao.insertAttachedfile(con, list);
		
		if( result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Gallery> selectGalleryList(int currentPage, int limit) {
		// 게시판 목록
		Connection con = getConnection();
		ArrayList<Gallery> list = gDao.selectGalleryList(con, currentPage, limit);
		
		close(con);
		return list;
	}
	
	public int getCountGalleryList() {
		// 게시판 페이지

		Connection con = getConnection();
		int listCount = gDao.getCountGalleryList(con);
		
		close(con);		
		return listCount;
	}

		
	public ArrayList<Gallery> galleryTop5(){
		// 게시글 순위
		
		Connection con = getConnection();
		ArrayList<Gallery> list = gDao.galleryTop5(con);

		System.out.println("Top5 Ser : " + list);
		close(con);
		return list;
	}


	public ArrayList<Gallery> searchGallery(String condition, String keyword) {
		ArrayList<Gallery> searchGalleryList = null;
		Connection con = getConnection();
		
	
		searchGalleryList = (condition.length() > 0) ? gDao.searchGallery(con, condition, keyword) 
				:  gDao.selectGalleryList(con);
		
		return searchGalleryList;
	}

}