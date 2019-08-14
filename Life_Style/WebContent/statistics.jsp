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
<link rel="stylesheet" href="css/statistics.css">
<body>
<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="js/liquidFillGauge.js"></script>
<script type="text/javascript" src="js/chart.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<div>
	<input type="date" placeholder="검색" id="search_days">
	<input type="button" value="검색" id="search_button">
	
	<div>
		<div id="chart1"></div>
		<div id="chart2"></div>
	</div>
	<br>
	<br>
	<br>   
	<div>
		<div id="fillgauge1" >
			<svg width="300px" height="250"></svg>
		</div>
		<div id="fillgauge2" >
			<svg width="300px" height="250"></svg>
		</div>
	</div>
</div>    
    <script type="text/javascript" src="js/statistics.js"></script>
</body>
</html>