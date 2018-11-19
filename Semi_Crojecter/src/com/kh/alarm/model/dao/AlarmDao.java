package com.kh.alarm.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.alarm.model.vo.Alarm;

import static com.kh.common.JDBCTemplate.*;

public class AlarmDao{
	
	private Properties prop = new Properties();
	private PreparedStatement pstmt = null;
	
	public AlarmDao(){
		String filePath = AlarmDao.class.getResource("/config/alarm-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));		
		} catch (IOException e) {			
			e.printStackTrace();			
		}
	}
	
	public int countUnReadAlarm(Connection con) {
		// 
		int unReadAlarm = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("unReadAlarm");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				unReadAlarm = rset.getInt(1);
			}
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return unReadAlarm;
	}


	public ArrayList<Alarm> selectAlarmList(Connection con, int id) {
		// 
		ArrayList<Alarm> alarmList = null;
		ResultSet rset = null;
		Alarm Mid = new Alarm();
		String sql = prop.getProperty("alarmList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			
			rset = pstmt.executeQuery();
			
			alarmList = new ArrayList<Alarm>();
			//
			while(rset.next()){
				Alarm al = new Alarm();
				
				al.setMid(rset.getInt("MID"));
				al.setAMsg(rset.getString("AMSG"));
				al.setADate(rset.getDate("ADATE"));
				al.setAFlag(rset.getString("AFLAG"));
				
				alarmList.add(al);
				//System.out.println("selectAlarmList dao : "+ alarmList);
			}
			
		} catch (SQLException e) {
		 
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return alarmList;
	}

}
