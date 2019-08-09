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
<style>

/*
.chart rect {
  fill: steelblue;
}
*/
.chart .legend {
  fill: black;
  font: 14px sans-serif;
  text-anchor: start;
  font-size: 12px;
}

.chart text {
  fill: white;
  font: 10px sans-serif;
  text-anchor: end;
}

.chart .label {
  fill: black;
  font: 14px sans-serif;
  text-anchor: end;
}

.bar:hover {
  fill: brown;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}


</style>

<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    
<div>
	<input type="radio" value="days" class="statistics_radio" name="a">일간 
	<input type="radio" value="weeks" class="statistics_radio" name="a">주간 
	<input type="radio" value="months" class="statistics_radio" name="a">월간 
	<input type="date" placeholder="검색" id="search_days">
	<input type="button" value="검색" id="search_button">
	
	<svg class="chart"></svg>
</div>    
    <script type="text/javascript" src="js/statistics.js"></script>
</body>
</html>