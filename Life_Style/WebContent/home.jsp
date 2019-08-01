<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
	<h1>첫화면</h1>
	
	<a href="meetingboard.jsp">게시판이동</a>
	<a href="myinformation.do?command=memberinfo&id=아이디">내정보이동</a>
	<a href="meetingboard.do?command=meetingboard&viewno=10&pageno=1&indexviewno=10">만남게시판이동</a>	
	<a href="shopping.do?command=shop_main">쇼핑 이동</a>
	<a href="schedule.do?command=calendar">내 스케쥴 이동</a>
</body>
</html>