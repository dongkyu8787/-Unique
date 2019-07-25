<%@page import="com.life.dao.Util"%>
<%@page import="com.life.dto.schedule_dto"%>
<%@page import="com.life.biz.schedule_biz"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<link rel="stylesheet" href="css/calendar.css">
</head>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) +1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null){
		year = Integer.parseInt(paramYear);
	}
	if(paramMonth != null){
		month = Integer.parseInt(paramMonth);
	}
	
	if(month > 12){
		year++;
		month = 1;
	}
	if(month < 1){
		year--;
		month = 12;
	}
	
	cal.set(Calendar.YEAR, year);
	cal.set(Calendar.MONTH, month -1);
	cal.set(Calendar.DATE,1);
	
	int totalday = cal.getActualMaximum(Calendar.DATE);
	int startday = cal.get(Calendar.DAY_OF_WEEK);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	cal.set(Calendar.YEAR, year);
	cal.set(Calendar.MONTH, month -2);
	cal.set(Calendar.DATE,1);	

	int pretotalday = cal.getActualMaximum(Calendar.DATE);
	pretotalday++;
	startday--;
	
	schedule_biz biz = new schedule_biz();
	String yyyMM = year + Util.isTwo(month + "");
	
	List<schedule_dto> clist = biz.getCalViewList("kh", yyyMM);
%>
<body>
<table id="calendar">
        <caption >
            <a href="schedule.jsp?year=<%=year-1 %>&month=<%=month%>">◀◀</a>
            <a href="schedule.jsp?year=<%=year %>&month=<%=month-1%>">◁◁</a>
            <span class="y"><%=year %></span>년
            <span class="m"><%=month %></span>월
            <a href="schedule.jsp?year=<%=year %>&month=<%=month+1%>">▷▷</a>
            <a href="schedule.jsp?year=<%=year+1 %>&month=<%=month%>">▶▶</a>
        </caption>
        <tr>
            <th class="week" style="color:red;">일</th><th class="week">월</th><th class="week">화</th><th class="week">수</th><th class="week">목</th><th class="week">금</th><th class="week" style="color:blue;">토</th>
        </tr>
        	<tbody>
        	<tr>
                
<%
        	for(int i = 0; i < startday; ++i){
%>
        		<td class="nextcal"><%=pretotalday-startday %></td>
<%
				++pretotalday;
        	}
        		for(int i = 1; i <= totalday ;++i){
%>
        			<td>
        			<a class="countview" href="schedule.do?command=list&year=<%=year%>&month=<%=month%>&date=<%=i%>" style="color :<%=Util.fontColor(i, dayOfWeek)%>;"><%=i %></a>
        			<div class="clist">
        				<%=Util.getCalView(i, clist) %>
        			</div>
        			</td>
<% 		
        		if(i == totalday){
        			int k = 1;
        			for(int j = startday % 7; j < 6; ++j){
%>
        				<td class="nextcal"><%=k %></td>
<%        				
						++k;
        			}
        		}
        		if(startday % 7 == 6){
%>
            		</tr>
<%
				}        		
            	startday++;
        	}
%>
		</tbody>
    </table>

</body>
</html>