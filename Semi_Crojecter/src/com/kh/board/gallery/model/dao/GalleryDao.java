package com.kh.board.gallery.model.dao;

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

			if (rset.next()) {
				g = new Gallery();

				g.setGid(rset.getInt("gid"));
				g.setGcategoryid(rset.getInt("gcategoryid"));
				g.setGtag(rset.getString("gtag"));
				g.setGlike(rset.getInt("glike"));
				g.setBid(rset.getInt("bid"));
				g.setCclid(rset.getInt("cclid"));
				g.setGcategoryname(rset.getString("gcategoryname"));
				g.setCclname(rset.getString("cclname"));

				g.setBtype(rset.getInt("btype"));
				g.setBtitle(rset.getString("btitle"));
				g.setBcontent(rset.getString("bcontent"));
				g.setBcount(rset.getInt("bcount"));
				g.setBdate(rset.getDate("bdate"));
				g.setBstatus(rset.getString("bstatus"));
				g.setBrcount(rset.getInt("brcount"));
				g.setBwriter(rset.getInt("bwriter"));
				g.setMname(rset.getString("mname"));
				g.setMprofile(rset.getString("mprofile"));

				// System.out.println("gdao g : " + g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return g;
	}

	public int insertBoardContent(Connection con, Gallery g, int bid) {

		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("insertBoard");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bid);
			pstmt.setInt(2, g.getBtype());
			pstmt.setString(3, g.getBtitle());
			pstmt.setString(4, g.getBcontent());
			pstmt.setInt(5, g.getBwriter());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("insertBoardContent result : " + result);
		return result;
	}

	public int insertGalleryContent(Connection con, Gallery g, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("insertGallery");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, g.getGcategoryid());
			pstmt.setString(2, g.getGtag());
			pstmt.setInt(3, bid);
			pstmt.setInt(4, g.getCclid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("insertGalleryContent result : " + result);
		return result;
	}

	public int selectCurrentBid(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;

		String sql = prop.getProperty("selectCurrentBid");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				bid = rset.getInt(1); // "CURRVAL"
				System.out.println("bid : " + bid);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return bid;
	}

	public int insertAttachedfile(Connection con, ArrayList<AttachedFile> list) {

		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("insertAttachedfile");

		try {

			for (int i = 0; i < list.size(); i++) {

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, list.get(i).getFname());
				pstmt.setString(2, list.get(i).getFpath());

				// 첫번째 데이터일 경우 대표 이미지로 level = 1
				// 나머지 데이터는 일반 이미지로 level = 2
				int level = 2;
				if (i == 0)
					level = 1;

				pstmt.setInt(3, level);
				pstmt.setInt(4, list.get(i).getBid());
				System.out.println("list.get(" + i + ").getBid() : " + list.get(i).getBid());
				System.out.println("insertAttachedfile"+i+"번 flevel : " + level);

				result += pstmt.executeUpdate();

			}

		} catch (SQLException e) {

		} finally {
			close(pstmt);
		}

		System.out.println("insertAttachedfile result : " + result);
		return result;
	}

	public int updateBoard(Connection con, Gallery g) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateBoard");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, g.getBtitle());
			pstmt.setString(2, g.getBcontent());
			pstmt.setInt(3, g.getBid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateGallery(Connection con, Gallery g) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateGallery");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, g.getGcategoryid());
			pstmt.setString(2, g.getGtag());
			pstmt.setInt(3, g.getCclid());
			pstmt.setInt(4, g.getBid());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAttachedfile(Connection con, ArrayList<AttachedFile> list) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("updateAttachedfile");

		try {

			for (int i = 0; i < list.size(); i++) {

				pstmt = con.prepareStatement(sql);
				
				System.out.println("list.get(" + i + ") : " + list.get(i));
				pstmt.setString(1, list.get(i).getFname());
				pstmt.setString(2, list.get(i).getFpath());

				// 첫번째 데이터일 경우 대표 이미지로 level = 1
				// 나머지 데이터는 일반 이미지로 level = 2
				int level = 2;
				if (i == 0) level = 1;

				pstmt.setInt(3, level);
				pstmt.setInt(4, list.get(i).getBid());
				System.out.println("updateAttachedfile의 list.get(" + i + ").getBid() : " + list.get(i).getBid());
				System.out.println("level : " + level);

				result += pstmt.executeUpdate();

			}

		} catch (SQLException e) {

		} finally {
			close(pstmt);
		}

		System.out.println("updateAttachedfile result : " + result);
		return result;
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

	public HashMap<String, Object> selectGalleryMap(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Gallery g = null;
		AttachedFile af = null;
		ArrayList<AttachedFile> list = null;
		
		System.out.println("selectGalleryMap 진입");
		String sql = prop.getProperty("selectGalleryOne");
				
		try {
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<AttachedFile>();
			
			while(rset.next()){
				
				g = new Gallery();
				g.setGid(rset.getInt("gid"));
				g.setGcategoryid(rset.getInt("gcategoryid"));
				g.setGtag(rset.getString("gtag"));
				g.setGlike(rset.getInt("glike"));
				g.setCclid(rset.getInt("cclid"));
				
				g.setBid(rset.getInt("bid"));
				g.setBtype(rset.getInt("btype"));
				g.setBtitle(rset.getString("btitle"));
				g.setBcontent(rset.getString("bcontent"));
				g.setBcount(rset.getInt("bcount"));
				g.setBdate(rset.getDate("bdate"));
				g.setBstatus(rset.getString("bstatus"));
				g.setBrcount(rset.getInt("brcount"));
				g.setBwriter(rset.getInt("bwriter"));
				g.setMname(rset.getString("mname"));
				
				af = new AttachedFile();
				af.setBid(bid);
				af.setFid(rset.getInt("fid"));
				af.setFlevel(rset.getInt("flevel"));
				af.setFname(rset.getString("fname"));
				af.setFpath(rset.getString("fpath"));
				
				System.out.println("selectGalleryMap의 g : " + g);
				System.out.println("selectGalleryMap의 af : " + af);
				
				list.add(af);
				
			}
			
			hmap = new HashMap<String, Object>();
			
			hmap.put("gallery", g);
			hmap.put("attachedfile", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}
}
