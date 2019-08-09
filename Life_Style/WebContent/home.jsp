<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/login_regist.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/regist.js"></script>
<body>
	<input type="hidden" id="hiddenval" value="null" />
	

	<div id="non_login">
		<input type="button" name="btn" onclick="registForm()" value="회원가입" />
		<input type="button" name="btn" onclick="loginForm()" value="로그인" />
		<input type="button" name="btn" id="link" value="테스트" onclick="sessionchk()"/>
	</div>
	
	<div id="on_login">
		<input type="button" name="btn" id="logout" value="로그아웃" onclick="logout()"/>
		<input type="button" name="btn" id="link" value="테스트" onclick="sessionchk()"/>
	</div>
	
	<div id="login">
	<p><img id="login_logo" src="img/logo2.png"></p>
			<table cellspacing="10">
				</br></br></br>
				<caption>로 그 인</caption>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" />
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" id="loginajax"/> 
						<input type="button" value="취소" onclick="closeWin()">
					</td>
				</tr>
			</table>
		<div>
			&nbsp;&nbsp;&emsp;&emsp;<a id="kakao-login-btn"></a> 
		</div>
	</div>
	
	<div id="kakao_regist">
		<p><img id="regist_logo" src="img/logo2.png"></p>
			<input type="hidden" name="command" value="regist" />
			<table cellspacing="10"><br/><br/><br/> 			
				<caption>회원가입</caption>
				<tr>
					<td>아 이 디</td>
					<td>
						<input type="text" name="id" id='kakaoid' value=" " readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>이 름</td>
					<td><input type="text" name="name" id="kakaoname" placeholder="한글만"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" id="kakaobirth" style="width:60%;" placeholder="주민번호 앞 6자리"/></td>
				</tr>
				<tr>
					<td>주 소</td>
					<td>
						<input type="text" name="addr" id="kakaoaddr1" readonly="readonly" style="width:30%;"  /> &nbsp;
						<input type="button" id="kakaofindaddr" value="주소 찾기" /><br/>
						<input type="text" name="addr" id="kakaoaddr2" readonly="readonly" style="width:80%;"/>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" name="addr" id="kakaoaddr3" style="width:80%;"/>
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<input type="text" id="kakaophone" name="phone" placeholder="-제외 숫자만 적어주세요"/> 
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="kakaoemail" value="" readonly="readonly"></td>
				</tr>
				<tr>
					<td>성 별</td>
					<td>
						<input type="radio" name='kakaogender' value='남' />남 
						<input type="radio" name='kakaogender' value='여' />여
					</td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" name="kakaointerest" value="운동" />운동 
						<input type="checkbox" name="kakaointerest" value="음식" />음식 
						<input type="checkbox" name="kakaointerest" value="음악" />음악<br/> 
						<input type="checkbox" name="kakaointerest" value="여행" />여행
						<input type="checkbox" name="kakaointerest" value="패션" />패션 
						<input type="checkbox" name="kakaointerest" value="영화" />영화<br/> 
						<input type="checkbox" name="kakaointerest" value="뷰티" />뷰티 
						<input type="checkbox" name="kakaointerest" value="건강" />건강
						<input type="checkbox" name="kakaointerest" value="경제" />경제
					</td>
				</tr>
				<tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="가입하기" id="kakaosignupajax" /> &nbsp;&nbsp;
						<input type="button" value="취소"  onclick="kakao_closeWin()" />
					</td>
				</tr>
		</table>
	</div>

	
	<div id="regist">
		<p><img id="regist_logo" src="img/logo2.png"></p>
			<input type="hidden" name="command" value="regist" />
			<table cellspacing="10">
				</br></br>
				<caption>회 원 가 입</caption></br>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" id="originid" placeholder="영어,숫자 4~8글자"/>&nbsp;
						<input type="button" value="중복체크" id="idbutton" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pw" id="originpw" placeholder="영문,숫자,특문 6~10글자 "/></td>
				</tr>
				<tr>
					<td>이 름</td>
					<td><input type="text" name="name" id="originname" placeholder="한글만"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" id="originbirth" style="width:60%;" placeholder="주민번호 앞 6자리"/></td>
				</tr>
				<tr>
					<td>주 소</td>
					<td>
						<input type="text" name="addr" id="originaddr1" readonly="readonly" style="width:30%;"  />&nbsp;
						<input type="button" id="originfindaddr" value="주소 찾기" /><br/>
						<input type="text" name="addr" id="originaddr2" readonly="readonly" style="width:80%;"/>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" name="addr" id="originaddr3" style="width:80%;"/>
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<input type="text" id="originphone" name="phone" placeholder="-제외 숫자만 적어주세요"/> 
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" id="originemail"/>&nbsp;
						<input type="button" value="이메일 인증" id="emailchk"/><br/> 
						<input type="text" placeholder="인증 번호" id="userwriternum"/>&nbsp;
						<input type="button" value="인 증"  id="ranchk" onclick="randomchk()" />
					</td>
				</tr>
				<tr>
					<td>성 별</td>
					<td>
						<input type="radio" name='origingender' value='남' />남 
						<input type="radio" name='origingender' value='여' />여
					</td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" name="origininterest" value="운동" />운동 
						<input type="checkbox" name="origininterest" value="음식" />음식 
						<input type="checkbox" name="origininterest" value="음악" />음악<br/> 
						<input type="checkbox" name="origininterest" value="여행" />여행
						<input type="checkbox" name="origininterest" value="패션" />패션 
						<input type="checkbox" name="origininterest" value="영화" />영화<br/> 
						<input type="checkbox" name="origininterest" value="뷰티" />뷰티 
						<input type="checkbox" name="origininterest" value="건강" />건강
						<input type="checkbox" name="origininterest" value="경제" />경제
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="가입하기" id="signupajax" />&nbsp;&nbsp;
						<input type="button" value="취소" onclick="closeWin()" />
					</td>
				</tr>
			</table>
	</div>
	
	
	<script type="text/javascript" src="js/kakao_login.js"></script>
	<script type="text/javascript">
		window.onbeforeunload = unloadPage();

		function unloadPage() {

			var id = "" + "${member_dto.member_id}";
			if (!id) {
				//alert("로그인 안된상태");
				document.getElementById("non_login").style.display = "block";
				document.getElementById("on_login").style.display = "none";
			} else {
				//alert("로그인 된상태");
				document.getElementById("non_login").style.display = "none";
				document.getElementById("on_login").style.display = "block";
				document.getElementById("hiddenval").value = id;
			}
		}
	</script>
	
	<a href="myinformation.do?command=memberinfo&id=아이디">내정보이동</a>
	<a href="meetingboard.do?command=meetingboard&page=1">만남게시판이동</a>	
	<a href="shopping.do?command=shop_main">쇼핑 이동</a>
	<a href="schedule.do?command=calendar">내 스케쥴 이동</a>
	<a href="#" onclick="open('whisper.do?command=message_box','메세지 함','width=360, height=300')">메세지 함</a>
	<a href="http://192.168.10.6:8090/?id=${member_dto.member_id}" target="_blank">채팅 이동</a>
	<a href="health.do?command=health">건강 관리</a>
	<a href="account.do?command=account">가계부</a>
	<a href="statistics.do?command=statistics">통계</a>
</body>
</html>