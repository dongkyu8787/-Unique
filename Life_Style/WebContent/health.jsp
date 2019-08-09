<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/health.js"></script>
</head>
<body>
	<div>
		<h1>건강 관리</h1>
		<form action="health.do?command=insertres" method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" value=""></td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td><input type="text" name="weight" value=""></td>
				</tr>
				<tr>
					<th>먹은 음식</th>
					<td><input type="text" id="food" name="food" value="">
						<input type="button" value="먹은거" onclick="search();"> <span
						id="search"></span></td>
				</tr>
				<tr>
					<th>칼로리</th>
					<td><input type="text" name="kcal" id="kcal"></td>
				</tr>
				<tr>
					<td>
						<div id="desc_div"></div>
					</td>
					<td>
						<div id="amount_div">
							<input type="number" id="amount" name="amount">
						</div>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="입력"> <input
						type="button" value="마이페이지"
						onclick="location.href='myinformation.do?command=myinformation'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<table border="1">
			<col width="200">
			<col width="200">
			<col width="500">
			<col width="500">
			<col width="300">
			<tr>
				<th>ID</th>
				<th>몸무게</th>
				<th>먹은 음식</th>
				<th>먹은 양</th>
				<th>날짜</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4">-----입력된 정보가 없습니다.------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="health_dto">
						<tr>
							<td>${health_dto.health_id }</td>
							<td>${health_dto.health_weight }</td>
							<td>${health_dto.health_food }</td>
							<td>${health_dto.health_kcal }</td>
							<td>${health_dto.health_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>