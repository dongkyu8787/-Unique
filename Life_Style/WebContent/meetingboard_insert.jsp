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
<script type="text/javascript" src="/Life_Style/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	@import url("css/mapC.css");
</style>
<script src='js/meetingboard.js'></script>
<script type="text/javascript">

function compare(){
	
	var min = $("#min").val()
	var max = $("#max").val()
	
	if(max !="" && min != ""){
		if(min >= max){
			alert("범위에 맞게 설정하세요.")
			//location.href="meetingboard.do?command=insertboard"
		}
	}
}

</script>
</head>
<body>
	<form action="meetingboard.do" method="post" name="frm">
		<input type="hidden" name="command" value="insertboardres">
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
				<th>글쓴이</th>
				<td><textarea rows="1" cols="119" style="resize:none" name="board_writer">${member_dto.member_id }</textarea></td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<select name="board_tag" style="height:21px"> 
					<option>관심사 태그 목록</option>
					<option value="운동">운동</option>
					<option value="음식">음식</option>
					<option value="음악">음악</option>
					<option value="여행">여행</option>
					<option value="패션">패션</option>
					<option value="영화">영화</option>
					<option value="뷰티">뷰티</option>
					<option value="건강">건강</option>
					<option value="경제">경제</option>
				</select>
				<textarea rows="1" cols="100" style="resize:none" name="board_title">
				</textarea></td>
			</tr>
			
			<tr>
				<th rowspan="5">조건 선택</th>
				<td>
				<input type="radio" name="board_genderlimit" value="남자만">남자만
				<input type="radio" name="board_genderlimit" value="여자만">여자만
				<input type="radio" name="board_genderlimit" value="누구나">누구나
				</td>
			</tr>
			
			<tr>
				<td>
				나이제한 : <input type="text" name="board_age_min" type="number" min="0" max="200" id="min" onchange="compare()">~
				<input type="text" name="board_age_max" type="number" min="0" max="200" id="max" onchange="compare()">
				</td>
			</tr>
			<tr>
				<td>
				최대인원수 : <input type="number" name="board_peoplelimit" min="0" max="50">
				</td>
			</tr>
			
			<tr>
				<td>
				<select name="board_location" style="height:21px"> 
					<option>지역선택</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="충청">충청</option>
					<option value="전라">전라</option>
					<option value="경상">경상</option>
					<option value="강원">강원</option>
					<option value="제주">제주</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>시간제한 : 날짜입력 <input name="board_date" type="datetime-local" value="" id="now_date"></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
				<textarea name="board_content" id="ir1" rows="10" cols="118" style="resize:none"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="새글입력" onclick="submitContents(this)">
				<input type="button" value="홈으로이동" onclick="location.href='home.jsp'">
				</td>
			</tr>
		</table>
		<div class="map_wrap">
    	<div id="map" style="width:50%;height:50%;position:relative;overflow:hidden;">
    		<button type="button" id="" onclick="" style="display:none">감추기</button></div>

    		<div id="menu_wrap" class="bg_white" style="height:30%; float: left;">
        		<div class="option">
            		<div>
                    	키워드 : <input type="text" value="이태원"  id="keyword" size="15"> 
							   <input type="button" value="검색하기" onclick="searchPlaces();">
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
				<table border="1">
					<colgroup>
						<col style="width: 150px; height: 150px;">
						<col style="width: 150px; height: 150px;">
					</colgroup>
					<tbody>
						<tr>
							<td align="center">습도(%)</td>
							<td align="center"><span id="reh" ></span></td>
						</tr>
						<tr>
							<td align="center">최저/최고(℃)</td>
							<td align="center"><span id="tmn" style="color: blue"></span><b>/</b><span id="tmx" style="color: red"></span></td>
						</tr>
						<tr>
							<td align="center">현재 온도(℃)</td>
							<td align="center"><span id="t3h"></span></td>
						</tr>
						<tr>
							<td align="center">날씨</td>
							<td align="center"><span id="weather_span" ></span><img alt="" src="" id="weather"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c54788c8f1925b6e8dd99b858e1c6f11&libraries=services"></script>
<script type="text/javascript" src="js/mapS.js"></script>
<script type="text/javascript">
	onload = function(){
		document.getElementById('now_date').value = new Date().toISOString().slice(0,16);
	}
</script>
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "/Life_Style/smarteditor/SmartEditor2Skin.html",
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