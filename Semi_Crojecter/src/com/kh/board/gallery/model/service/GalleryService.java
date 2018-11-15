package com.kh.board.gallery.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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
		
		System.out.println("g : " + g);
		
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

	public int updateGallery(Gallery g, ArrayList<AttachedFile> list) {
		Connection con = getConnection();
		
		int result = 0;

		System.out.println("g : " + g);
		
		int result1 = gDao.updateBoard(con, g);
		int result2 = gDao.updateGallery(con, g);
		int result3 = gDao.updateAttachedfile(con, list);
		
		if( result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> selectGalleryMap(int bid) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		int result = gDao.updateCount(con, bid);
		
		if(result > 0) {
			commit(con);
			hmap = gDao.selectGalleryMap(con, bid);
			
			System.out.println("service hamp : " + hmap);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return hmap;
	}
	







}