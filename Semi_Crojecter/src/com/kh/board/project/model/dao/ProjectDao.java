package com.kh.board.project.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.gallery.model.vo.Gallery;
import com.kh.board.project.model.vo.Project;

public class ProjectDao {
	
	private Properties prop = new Properties();
	
	public ProjectDao() {
		
		String filePath = ProjectDao.class.getResource("/config/project-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));		
		} catch (IOException e) {			
			e.printStackTrace();			
		}
	}

	public int selectCurrentBid(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String sql = prop.getProperty("selectCurrentBid");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				bid = rset.getInt(1); // "CURRVAL"
				System.out.println("bid : " + bid);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return bid;
	}

	public int insertBoardContent(Connection con, Project p, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
					
			pstmt.setInt(1, bid);
			pstmt.setInt(2, p.getBtype());
			pstmt.setString(3, p.getBtitle());
			pstmt.setString(4, p.getBcontent());
			pstmt.setInt(5, p.getBwriter());			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("ProjectDao insertBoardContent result : " + result);
		return result;
	}

	public int insertProjectContent(Connection con, Project p, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertProject");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			System.out.println("p.getJtag() : " + p.getJtag());
			pstmt.setDate(1, p.getJend());
			pstmt.setInt(2, bid);
			pstmt.setString(3, p.getJtag());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("ProjectDao insertProjectContent result : " + result);
		return result;
	}

	public int insertAttachedfile(Connection con, AttachedFile af) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAttachedfile");
		
		try{
	
			pstmt = con.prepareStatement(sql);				
				
			pstmt.setString(1, af.getFname());
			pstmt.setString(2, af.getFpath());
				
			pstmt.setInt(3, 1);
			pstmt.setInt(4, af.getBid());
				
			result += pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
		} finally {
			close(pstmt);
		}
		
		System.out.println("ProjectDao insertAttachedfile result : " + result);
		return result;
	}

	public Project selectOne(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Project p = null;

		String sql = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				p = new Project();

				p.setJid(rset.getInt("jid"));
				p.setJend(rset.getDate("jend"));
				p.setJtag(rset.getString("jtag"));
				p.setDday(rset.getInt("dday"));
				p.setBid(rset.getInt("bid"));            
				p.setBtype(rset.getInt("btype"));
				p.setBtitle(rset.getString("btitle"));
				p.setBcontent(rset.getString("bcontent"));
				p.setBcount(rset.getInt("bcount"));
				p.setBdate(rset.getDate("bdate"));
				p.setBstatus(rset.getString("bstatus"));
				p.setBrcount(rset.getInt("brcount"));
				p.setBwriter(rset.getInt("bwriter"));
				p.setMname(rset.getString("mname"));
				p.setMprofile(rset.getString("mprofile"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return p;
	}

	public int updateCount(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCount");
		
		try{
			
			pstmt = con.prepareStatement(sql);
				
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
			
			System.out.println("updateCount result : "  + result);
			
		} catch (SQLException e) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> selectProjectMap(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Project p = null;
		AttachedFile af = null;
		
		System.out.println("selectProjectMap 진입");
		String sql = prop.getProperty("selectProjectOne");
				
		try {
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			
			af = new AttachedFile();
			
			while(rset.next()){
				
				p = new Project();
				p.setJid(rset.getInt("jid"));
				p.setJend(rset.getDate("jend"));
				p.setJtag(rset.getString("jtag"));
				p.setBid(rset.getInt("bid"));
                
				p.setBtype(rset.getInt("btype"));
				p.setBtitle(rset.getString("btitle"));
				p.setBcontent(rset.getString("bcontent"));
				p.setBcount(rset.getInt("bcount"));
				p.setBdate(rset.getDate("bdate"));
				p.setBstatus(rset.getString("bstatus"));
				p.setBrcount(rset.getInt("brcount"));
				p.setBwriter(rset.getInt("bwriter"));
				p.setMname(rset.getString("mname"));
				p.setMprofile(rset.getString("mprofile"));
				
				af = new AttachedFile();
				af.setBid(bid);
				af.setFid(rset.getInt("fid"));
				af.setFlevel(rset.getInt("flevel"));
				af.setFname(rset.getString("fname"));
				af.setFpath(rset.getString("fpath"));
				
				System.out.println("selectProjectMap의 p : " + p);
				System.out.println("selectProjectMap의 af : " + af);
				
			}
			
			hmap = new HashMap<String, Object>();
			
			hmap.put("project", p);
			hmap.put("attachedfile", af);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	public int updateBoard(Connection con, Project p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateBoard");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, p.getBtitle());
			pstmt.setString(2, p.getBcontent());
			pstmt.setInt(3, p.getBid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProject(Connection con, Project p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateProject");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setDate(1, p.getJend());
			pstmt.setString(2, p.getJtag());
			pstmt.setInt(3, p.getBid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAttachedfile(Connection con, AttachedFile af) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateAttachedfile");

		try {
				pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, af.getFname());
				pstmt.setInt(2, af.getBid());

				result = pstmt.executeUpdate();

		} catch (SQLException e) {

		} finally {
			close(pstmt);
		}

		System.out.println("updateAttachedfile result : " + result);
		return result;
	}

	public ArrayList<Project> selectProjectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Project> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

				
		String sql = prop.getProperty("selectProjectList");		
		
		try {
			
			pstmt = con.prepareStatement(sql);			
			
			int startRow = (currentPage -1) * limit +1;	
			int endRow = startRow + limit -1;
			
			rset = pstmt.executeQuery();			
			list = new ArrayList<Project>();
			
			while(rset.next()){
				
				Project p = new Project();
				// 갤러리분
				p.setJid(rset.getInt("JID"));
				p.setJend(rset.getDate("GEND"));
				// 상속분
				p.setBid(rset.getInt("BID"));
				p.setBtype(rset.getInt("BTYPE"));
				p.setBtitle(rset.getString("BTITLE"));
				p.setBcontent(rset.getString("BCONTENT"));
				p.setBcount(rset.getInt("BCOUNT"));
				p.setBdate(rset.getDate("BDATE"));
				p.setBstatus(rset.getString("BSTATUS"));
				p.setBwriter(rset.getInt("BWRITER"));
				// 
				
				
				list.add(p);
				//System.out.println("selectGalleryList Dao : "+ list);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getCountProjectList(Connection con) {
	// 
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countProjectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("현재 프로잭트 갯수 : "+ listCount);
		return listCount;
	}




}
