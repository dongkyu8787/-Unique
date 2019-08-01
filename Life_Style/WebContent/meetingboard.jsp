<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만남게시판</title>
<style type="text/css">
#side {
	position: relative;
	top: 50px;
}

#center {
	position: relative;
	left: 200px;
	top: -150px;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

$(function(){
	
	 $("#button").click(function(){
		 
		 
		 
		 
	 })
	
})

</script>

</head>

<%
	int pageno = Integer.parseInt(request.getParameter("pageno"));
	int colno = Integer.parseInt(request.getParameter("colno"));
	int viewno = Integer.parseInt(request.getParameter("viewno"));
	int lastpage = Integer.parseInt(request.getParameter("lastpage"));
	int indexviewno = Integer.parseInt(request.getParameter("indexviewno"));
	int indexno = Integer.parseInt(request.getParameter("indexno"));
%>
<body>
	<span style="color: blue; font-size: 30px;">Life Style 
		<span style="color: black; font-size: 20px;"> 
			<span>상단메뉴</span> 
			<span>메뉴1</span>
			<span>메뉴2</span> 
			<span>메뉴3</span> 
			<span>메뉴4</span>
		</span>
	</span>

	<div id="side">
		<p style="color: red; font-size: 20px;">사이드 메뉴</p>
		<table>
			<tr>
				<td>메뉴1</td>
			</tr>
			<tr>
				<td>메뉴2</td>
			</tr>
			<tr>
				<td>메뉴3</td>
			</tr>
			<tr>
				<td>메뉴4</td>
			</tr>
			<tr>
				<td>메뉴5</td>
			</tr>
		</table>
	</div>
	<form action="" method="get">
		<div id="center">
			<table border="1">
				<col width="100">
				<col width="300">
				<col width="300">
				<col width="100">
				<col width="100">

				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>제한조건</th>
					<th>글쓴이</th>
					<th>글작성일</th>
					<th>조회수</th>
				</tr>

				<c:choose>
					<c:when test="${empty board_list }">
						<tr>
							<td colspan="6">----작성된 글이 없습니다.----</td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="i" begin="<%=colno%>" end="<%=colno + viewno - 1%>">
							<c:choose>
								<c:when test="${board_list[i].board_del eq 'N' }">
									<tr>
										<td>${board_list[i].board_no_seq}</td>

										<td><c:forEach begin="1" end="${board_list[i].board_tab }">
											RE:</c:forEach> 
											<a href="meetingboard.do?command=selectone&board_no_seq=${board_list[i].board_no_seq }&board_viewnum=${board_list[i].board_viewnum}">
												${board_list[i].board_title}
												</a>
										</td>
										<td>${board_list[i].board_genderlimit}</td>
										<td>${board_list[i].board_writer}</td>
										<td>${board_list[i].board_regdate}</td>
										<td>${board_list[i].board_viewnum}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:choose>
									<c:when test="${board_list[i].board_del eq 'Y' }">
									<tr>
										<td>${board_list[i].board_no_seq}</td>
										<td colspan="5">
										<c:forEach begin="1" end="${board_list[i].board_tab }">
										RE:</c:forEach>
										삭제된 글입니다.
										</td>
									</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6"></td>
										</tr>
									</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="6"><input type="button" value="글쓰기"
						onclick="location.href='meetingboard.do?command=insertboard'"></td>
				</tr>
				<tr>
					<td colspan="6">
						<input type="radio" name="chk" value="제목">제목
						<input type="radio" name="chk" value="내용">내용
						<input type="radio" name="chk" value="제목+내용">제목+내용
						<input type="radio" name="chk" value="글쓴이">글쓴이
						<input type="text">
						<input type="button" value="검색" id="button">
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<a href='meetingboard.do?command=meetingboard&viewno=<%=viewno%>&pageno=<%=1%>&indexviewno=10'>◀◀</a> 
						<a href='meetingboard.do?command=meetingboard&viewno=<%=viewno%>&pageno=<%=pageno - 1%>&indexviewno=10'>◀</a>
						<%
							for (int i = indexno * indexviewno + 1; i <= (indexno + 1) * indexviewno; i++) {
								if (i <= lastpage + 1) {
						%> 
						<a href='meetingboard.do?command=meetingboard&viewno=<%=viewno%>&pageno=<%=i%>&indexviewno=10'>
							<%=i%>
						</a>
						<%
							} else {
									break;
								}
							}
						%> 
						<a href='meetingboard.do?command=meetingboard&viewno=<%=viewno%>&pageno=<%=pageno + 1%>&indexviewno=10'>▶</a>
						<a href='meetingboard.do?command=meetingboard&viewno=<%=viewno%>&pageno=<%=lastpage + 1%>&indexviewno=10'>▶▶</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>