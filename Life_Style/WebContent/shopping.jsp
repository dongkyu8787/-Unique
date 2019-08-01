<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<%
List<String> list_href = (List<String>)request.getAttribute("href");
List<String> list_img = (List<String>)request.getAttribute("img");
List<String> list_title = (List<String>)request.getAttribute("title");
List<String> list_price = (List<String>)request.getAttribute("price");
%>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<script type="text/javascript">
	function search(){
		const search_item = $("#search_shop").val();
		
		location.href = "shopping.do?command=search&search_item=" + search_item;
	}		
</script>
<style type="text/css">
	.shop_item{
		width: 630px;
		height: 175px;
		padding: 40px 40px;
		border-bottom: 1.5px solid gray;
	}
	.shop_area{
		padding: 2px 172px; 
	}
	.shop_img{
		width: 148px; 
		height: 148px;
		float: left;
	}
	a{
		text-decoration: none;
		color: black;
	}
	.shop_price{
		font-weight: bold;
	}
	.left{
		color: blue;
	}
</style>
<body>
	<input type="text" id="search_shop">
	<button id="search_button" onclick="search()">검색</button>
	
	<%
	if(list_href != null){
	for(int i =0; i < list_href.size(); ++i){ 
		%>
		<div class="shop_item">
			<a href="<%=list_href.get(i)%>" target="_blank">
				<div class="shop_deal">
					<div class="shop_img">
						<img alt="" src="<%=list_img.get(i)%>" style="width: 148px; height: 148px;" >
					</div>					
					<div class="shop_area">
						<div class="shop_title"><%=list_title.get(i) %></div>
						<div class="shop_price"><%=list_price.get(i) %></div>
					</div>
				</div>
			</a>
		</div>
		<%
		}
	}
	%>
	
</body>
  </html>