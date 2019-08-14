<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="account.do?command=insertres" method="post">
			<table>
				<tr>
					<th>입금 금액</th>
					<td><input type="text" name="in"></td>
				</tr>
				<tr>
					<th>출금 금액</th>
					<td><input type="text" name="out"></td>
				</tr>
				<tr>
					<th>입출금 내용</th>
					<td><input type="text" name="content"></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="입력"> 
						<input type="button" value="마이페이지" onclick="location.href='myinformation.do?command=myinformation'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<h1>가계부</h1>
		<table border="1">
			<col width="100">
			<col width="100">
			<col width="400">
			<col width="400">
			<col width="500">
			<col width="400">
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>입금 금액</th>
				<th>출금 금액</th>
				<th>입출금 내용</th>
				<th>총 자산</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="6">------내역이 존재 하지 않습니다.-------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.account_io_no }</td>
							<td>${dto.account_date }</td>
							<td>${dto.account_in_cash }</td>
							<td>${dto.account_out_cash }</td>
							<td>${dto.account_io_content }</a></td>
							<td>${dto.account_totalcash }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>