package com.life.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.life.biz.account_biz;
import com.life.biz.health_biz;
import com.life.biz.statistics_biz;
import com.life.dao.Util;
import com.life.dto.account_dto;
import com.life.dto.health_dto;
import com.life.dto.member_dto;
import com.life.dto.statistics_dto;

@WebServlet("/statistics.do")
public class statistics_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public statistics_controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		statistics_biz stat_biz = new statistics_biz();
		account_biz acc_biz = new account_biz();
		health_biz health_biz = new health_biz();
		member_dto member_dto = (member_dto)request.getSession().getAttribute("member_dto");
		
		if(command.equals("statistics")){
			response.sendRedirect("statistics.jsp");
		}else if(command.equals("graph")) {
			String date = request.getParameter("date");
			String letter = request.getParameter("letter");
			String ss[] = date.split("-");
			
			int year = Integer.parseInt(ss[0]);
			int month = Integer.parseInt(ss[1]);
			int day = Integer.parseInt(ss[2]);
			
			Calendar c = Calendar.getInstance();

			c.set(Calendar.YEAR, year);
			c.set(Calendar.MONTH, month - 1);
			c.set(Calendar.DATE, day);
			
			if(letter.equals("days")) {
				
				System.out.println(account_week_value(c, year, month, acc_biz));
				PrintWriter out = response.getWriter();
				out.print(account_day_value(c, year, month, acc_biz));
			}else if(letter.equals("weeks")) {
				//해당 월 검색
				//해당 월의 1일 부터 마지막일 구해서
				//각 주의 평균값 
				
			}else if(letter.equals("months")) {
				//해당 년도 검색
				// 1월 1일부터 12월 31일까지 구해서
				// 각 월별 평균 값
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public String account_day_value(Calendar c, int year, int month, account_biz acc_biz) {
		int sunday = 0;
		int saturday = 0;
		if(1 == c.get(Calendar.WEEK_OF_MONTH)) {
			sunday = 1;
			saturday = c.get(Calendar.DATE) + (7 - c.get(Calendar.DAY_OF_WEEK));
		}else {
			sunday = Math.abs(c.get(Calendar.DATE) - (c.get(Calendar.DAY_OF_WEEK) -1));
			saturday = c.get(Calendar.DATE) + (7 - c.get(Calendar.DAY_OF_WEEK));
		}
		
		String day_min_date = year + "-" + Util.isTwo(month+"") + "-" + Util.isTwo(sunday+"");
		String day_max_date = year + "-" + Util.isTwo(month+"") + "-" + Util.isTwo(saturday+"");
		
		List<account_dto> account_list = acc_biz.searchList("kakao@진수"/*member_dto.getMember_id()*/, day_min_date, day_max_date);
		
		String labels =""; //요일
		String series_value =""; // 값
		
		for(int i = 0; i < account_list.size(); ++i) {
			if(i == account_list.size() -1) {
				labels += account_list.get(i).getAccount_days();
				series_value += account_list.get(i).getAccount_out_cash() + "";
			}else {
				labels += account_list.get(i).getAccount_days() + "/";
				series_value += account_list.get(i).getAccount_out_cash() + "/";
			}
		}
		
		String data = labels+"_"+series_value;
		return data;
	}
	
	public String account_week_value(Calendar c, int year, int month, account_biz acc_biz) {
		int month_startday = c.getMinimum(Calendar.DATE);
		int month_endday = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		c.set(Calendar.DATE, month_endday);
		
		String week_min_date = year + "-" + Util.isTwo(month+"") + "-" + Util.isTwo(month_startday+"");
		String week_max_date = year + "-" + Util.isTwo(month+"") + "-" + Util.isTwo(month_endday+"");
		
		List<account_dto> account_week = acc_biz.searchList("kakao@진수"/*member_dto.getMember_id()*/, week_min_date, week_max_date);

		String labels =""; //요일
		String series_value =""; // 값
		
		String data = "";

		for(int i = 1; i <= c.get(Calendar.WEEK_OF_MONTH); ++i) {
			int account_week_out = 0;
			if(i == c.get(Calendar.WEEK_OF_MONTH)) {
				for(int j = 0; j < 7; ++j) {
					if(((i-1)*7+j) < month_endday) {
						account_week_out += account_week.get((i-1)*7+j).getAccount_out_cash();
					}
				}
				series_value += account_week_out +"";
				labels += i+"주";
			}else {
				for(int j = 0; j < 7; ++j) {
					if(((i-1)*7+j) < month_endday) {
						account_week_out += account_week.get((i-1)*7+j).getAccount_out_cash();
					}
				}
				series_value += account_week_out +"/";
				labels += i+"주/";
			}
		}
		data = labels + "_" + series_value;
		return data;
	}

	public String account_month_value(Calendar c, int year, int month, account_biz acc_biz) {
		String week_min_date = year + "-" + Util.isTwo(01+"") + "-" + Util.isTwo(01+"");
		String week_max_date = year + "-" + Util.isTwo(12+"") + "-" + Util.isTwo(31+"");
		
		List<account_dto> account_week = acc_biz.searchList("kakao@진수"/*member_dto.getMember_id()*/, week_min_date, week_max_date);
		
		String labels =""; //요일
		String series_value =""; // 값
		String data = "";
		
		for(int i = 1; i <= 12; ++i) {
			int account_month_out = 0;
			c.set(Calendar.MONTH, i);
			
			if(i == 12) {
				for(int j = 0; j < c.getActualMaximum(Calendar.DAY_OF_MONTH); ++j) {
					account_month_out += account_week.get(j).getAccount_out_cash();
				}
				series_value += account_month_out +"";
				labels += i+"월";
			}else {
				for(int j = 0; j < c.getActualMaximum(Calendar.DAY_OF_MONTH); ++j) {
					account_month_out += account_week.get(j).getAccount_out_cash();
				}
				series_value += account_month_out +"/";
				labels += i+"월/";
			}
		}
		
		return "";
	}
}
