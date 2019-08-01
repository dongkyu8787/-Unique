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
	<table border="1">
		<tr>
			<th>글번호</th>
			<td style="width:700px; height:20px">${board_dto.board_no_seq }</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td style="width:700px; height:20px">${board_dto.board_writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td style="width:700px; height:20px">${board_dto.board_title }</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td width="300px" height="150px">${board_dto.board_content }</td>
		</tr>
		<tr>
			<th>글작성일</th>
			<td style="width:700px; height:20px">${board_dto.board_regdate }</td>
		</tr>
		<tr>
			<th>지역</th>
			<td style="width:700px; height:20px">${board_dto.board_location }</td>
		</tr>
		<tr>
			<th>태그</th>
			<td style="width:700px; height:20px">${board_dto.board_tag }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td style="width:700px; height:20px">${board_dto.board_genderlimit }</td>
		</tr>
		<tr>
			<th>최소나이</th>
			<td style="width:700px; height:20px">${board_dto.board_age_min }</td>
		</tr>
		<tr>
			<th>최대나이</th>
			<td style="width:700px; height:20px">${board_dto.board_age_max }</td>
		</tr>
		<tr>
			<th>인원수제한</th>
			<td style="width:700px; height:20px">${board_dto.board_peoplelimit }</td>
		</tr>
		<tr>
			<th>시간제한</th>
			<td style="width:700px; height:20px">${board_dto.board_timelimit }</td>
		</tr>
		<tr>
			<th>모임장소</th>
			<td><div id="map" style="width:100%;height:350px;"></div></td>
		</tr>
		<tr>
			<th>날씨</th>
			<td>
			<table>
				<tr>
					<td align="center">습도(%)</td>
					<td align="center"><span>${weather_dto.weather_reh}</span></td>
				</tr>
				<tr>
					<td align="center">최저/최고(℃)</td>
					<td align="center"><span style="color: blue">${weather_dto.weather_tmn }</span><b>/</b><span style="color: red">${weather_dto.weather_tmx }</span></td>
				</tr>
				<tr>
					<td align="center">현재 온도(℃)</td>
					<td align="center"><span>${weather_dto.weather_t3h}</span></td>
				</tr>
				<tr>
					<td align="center">현재 온도(℃)</td>
					<td align="center"><span>${weather_dto.weather_sky}</span></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='meetingboard.do?command=meetingupdate&board_no_seq=${board_dto.board_no_seq}'">
				<input type="button" value="답글작성" onclick="location.href='meetingboard.do?command=insertAS&board_no_seq=${board_dto.board_no_seq}'">
				<input type="button" value="삭제" onclick="location.href='meetingboard.do?command=meetingdelete&board_no_seq=${board_dto.board_no_seq}'">
				<input type="button" value="홈으로이동" onclick="location.href='home.jsp'">
			</td>
		</tr>
	</table>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c54788c8f1925b6e8dd99b858e1c6f11&libraries=services"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${map_dto.map_latitude} , ${map_dto.map_longitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${map_dto.map_latitude} , ${map_dto.map_longitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">${map_dto.map_place} <br><a href="https://map.kakao.com/link/map/${map_dto.map_place},${map_dto.map_latitude},${map_dto.map_longitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${map_dto.map_place},${map_dto.map_latitude},${map_dto.map_longitude}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(${map_dto.map_latitude} , ${map_dto.map_longitude}); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</body>
</html>