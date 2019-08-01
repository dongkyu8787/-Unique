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
<script type="text/javascript" src="/Life_Style03/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	@import url("css/mapC.css");
</style>
</head>
<body>
	<form action="meetingboard.do" method="post" name="frm">
		<input type="hidden" name="command" value="meetingupdateres">
		<input type="hidden" name="board_no_seq" value="${boardupdate_dto.board_no_seq }">
		<input type="hidden" value="" name="lat">
		<input type="hidden" value="" name="lng">
		<input type="hidden" value="" name="map_addr">
		<input type="hidden" name="reh" id="weather_reh">
		<input type="hidden" name="tmn" id="weather_tmn">
		<input type="hidden" name="tmx" id="weather_tmx">
		<input type="hidden" name="t3h" id="weather_t3h">
		<input type="hidden" name="sky" id="weather_sky">
		<table border="1">
			<tr>
				<th>글번호</th>
				<td style="width:700px; height:20px">${boardupdate_dto.board_no_seq }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${boardupdate_dto.board_writer }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input style="width:700px; height:20px" name="board_title" type="text" value="${boardupdate_dto.board_title }"></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea id="ir12" name="board_content" cols="100" rows="10" style="resize:none"></textarea></td>
			</tr>
			<tr>
				<th>글작성일</th>
				<td>${boardupdate_dto.board_regdate }</td>
			</tr>
			<tr>
				<th>지역</th>
				<td><input style="width:700px; height:20px" name="board_location" type="text" value="${boardupdate_dto.board_location }"></td>
			</tr>
			<tr>
				<th>태그</th>
				<td><input style="width:700px; height:20px" name="board_tag" type="text" value="${boardupdate_dto.board_tag }"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${boardupdate_dto.board_genderlimit }</td>
			</tr>
			<tr>
				<th>최소나이</th>
				<td>${boardupdate_dto.board_age_min }</td>
			</tr>
			<tr>
				<th>최대나이</th>
				<td>${boardupdate_dto.board_age_max }</td>
			</tr>
			<tr>
				<th>인원수제한</th>
				<td>${boardupdate_dto.board_peoplelimit }</td>
			</tr>
			<tr>
				<th>시간제한</th>
				<td>${boardupdate_dto.board_timelimit }</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정확인" onclick="submitContents(this)">
				<input type="button" value="홈으로 이동" onclick="location.href='home.jsp'">
				</td>
			</tr>
		</table>
		<div class="map_wrap">
			<div id="map" style="width:50%;height:50%;position:relative;overflow:hidden; " ></div>
			<div id="menu_wrap" class="bg_white" style="height:30%;" >
				<div class="option">
					<div>
						키워드 :  <input type="text" value="이태원"  id="keyword" size="15"> 
								<button type="button" onclick="searchPlaces();">검색하기</button> 
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
					<div class="hAddr">
						<span id="centerAddr"></span>
					</div>
			</div>
			<div style="width: 300px">
				<p align="right" id="addrs" style="margin: 0px">인천광역시 중구 중산동</p>
				<table border="1">
					<colgroup>
						<col style="width: 150px; height: 150px;">
						<col style="width: 150px; height: 150px;">
					</colgroup>
					<tbody>
						<tr>
							<td align="center">습도(%)</td>
							<td align="center"><span id="reh">${weather_dto.weather_reh }</span></td>
						</tr>
						<tr>
							<td align="center">최저/최고(℃)</td>
							<td align="center"><span id="tmn" style="color: blue">${weather_dto.weather_tmn }</span><b>/</b><span id="tmx" style="color: red">${weather_dto.weather_tmx }</span></td>
						</tr>
						<tr>
							<td align="center">현재 온도(℃)</td>
							<td align="center"><span id="t3h"></span></td>
						</tr>
						<tr>
							<td align="center">날씨</td>
							<td align="center"><span id="weather_span">${weather_dto.weather_sky }</span><img alt="" src="" id="weather"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="userMarkerText" style="display:none" ></div>
	</form>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c54788c8f1925b6e8dd99b858e1c6f11&libraries=services"></script>
<script type="text/javascript" src="js/mapS.js"></script>
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir12",
    sSkinURI: "/Life_Style03/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["ir12"].exec("UPDATE_CONTENTS_FIELD", []);

    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("ir1").value를 이용해서 처리한다.
    try {

        elClickedObj.form.submit();

    } catch(e) {}
}
</script>
	
	
</body>
</html>
