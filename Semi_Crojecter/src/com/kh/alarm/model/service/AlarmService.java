package com.kh.alarm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.alarm.model.dao.AlarmDao;
import com.kh.alarm.model.vo.Alarm;

import static com.kh.common.JDBCTemplate.*;
public class AlarmService {
	
	private AlarmDao aDao = new AlarmDao();
	
	public int countUnReadAlarm() {
		// 
		Connection con = getConnection();
		int unReadAlarm = aDao.countUnReadAlarm(con);
		
		close(con);
		
		return unReadAlarm;
	}

	public ArrayList<Alarm> selectAlarmList(String Mid) {
		// 
		Connection con = getConnection();
		ArrayList<Alarm> alarmList = aDao.selectAlarmList(con, Integer.parseInt(Mid));
		
		System.out.println("selectAlarmList s : "+ alarmList);
		
		close(con);
		return alarmList;
	}

}
