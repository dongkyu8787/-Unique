<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/Life_Style03/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
	<form action="meetingboard.do" method="post">
		<input type="hidden" name="command" value="insertASres">
		<input type="hidden" name="board_no_seq" value="${insertAS_dto.board_no_seq }">
		<table border="1">
			<tr>
				<th>글쓴이</th>
				<td><textarea rows="1" cols="100" style="resize:none" name="board_writer"></textarea></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><textarea rows="1" cols="100" style="resize:none" name="board_title"></textarea></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
					<textarea name="board_content" id="ir1" rows="10" cols="100" style="resize:none"></textarea>
				</td>
			</tr>
			<!-- 답글에는 지역, 태그, 성별, 최소나이, ... 제거 -->
			<tr>
				<th>지역</th>
				<td style="width:700px; height:20px">${insertAS_dto.board_location }</td>
			</tr>
			<tr>
				<th>태그</th>
				<td style="width:700px; height:20px">${insertAS_dto.board_tag}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td style="width:700px; height:20px">${insertAS_dto.board_genderlimit}</td>
			</tr>
			<tr>
				<th>최소나이</th>
				<td style="width:700px; height:20px">${insertAS_dto.board_age_min}</td>
			</tr>
			<tr>
				<th>최대나이</th>
				<td style="width:700px; height:20px">${insertAS_dto.board_age_max}</td>
			</tr>
			<tr>
				<th>인원수제한</th>
				<td style="width:700px; height:20px">${insertAS_dto.board_peoplelimit}</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="새글입력" onclick="submitContents(this)">
				<input type="button" value="홈으로이동" onclick="location.href='home.jsp'">
				</td>
			</tr>
		</table>
	</form>

<script type="text/javascript">

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "/Life_Style03/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("ir1").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) {}
}
</script>

</body>
</html>