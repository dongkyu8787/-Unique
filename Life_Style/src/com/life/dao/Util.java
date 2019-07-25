package com.life.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.life.dto.schedule_dto;

public class Util {
	private String toDates;
	
	public String getToDates() {
		return toDates;
	}

	public void setToDates(String mdate) {
		String m = mdate.substring(0,4)+"-"
				+ mdate.substring(4,6)+"-"
				+ mdate.substring(6,8)+ " "
				+ mdate.substring(8, 10)+":"
				+ mdate.substring(10)+":00";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� HH��mm��");
		Timestamp tm = Timestamp.valueOf(m);
		toDates = sdf.format(tm);		
	}

	public static String isTwo(String one) {
		if(one.length() < 2) {
			one = "0"+one;
		}
		return one;
	}
	
	public static String fontColor(int date, int dayofWeek) {
		String color = null;
		
		if((dayofWeek + date -1) % 7 == 1)
			color = "red";
		else if((dayofWeek + date-1) % 7 == 0)
			color = "blue";
		else
			color = "black";
		
		return color;
	}
	
	public static String getCalView(int i, List<schedule_dto> clist) {
		String d = isTwo(i+"");
		String ���� = "";
		
		for(schedule_dto dto : clist) {
			if(dto.getSchedule_date().substring(6,8).equals(d)) {
					���� += "<p>" + ((dto.getSchedule_title().length()>6)? dto.getSchedule_title().substring(0,6)+"...":dto.getSchedule_title()) + "</p>";
			}
		}
		return ����;
	}
}
