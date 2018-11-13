package com.kh.board.project.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.project.model.dao.ProjectDao;
import com.kh.board.project.model.vo.Project;

public class ProjectService {
	
	private ProjectDao pDao = new ProjectDao();

	public int insertProject(Project p, ArrayList<AttachedFile> list) {
		Connection con = getConnection();
		
		int result = 0;
		int result2 =0;
		
		System.out.println("p : " + p);
		
		int bid = pDao.selectCurrentBid(con);
		
		int result1 = pDao.insertBoardContent(con, p, bid);
		
		if(result1 > 0){

			result2 = pDao.insertProjectContent(con, p, bid);
						
			for(int i = 0; i < list.size(); i++){
				list.get(i).setBid(bid);
			}
			
		}
		
		int result3 = pDao.insertAttachedfile(con, list);
		
		if( result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}

}
