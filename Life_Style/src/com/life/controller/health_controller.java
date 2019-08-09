package com.life.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.Element;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.apache.xml.utils.URI;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.life.biz.health_biz;
import com.life.dto.health_dto;
import com.sun.org.apache.xerces.internal.util.XML11Char;

@WebServlet("/health.do")
public class health_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public health_controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");

		health_biz biz = new health_biz();

		if (command.equals("food")) {
			//serving_wt='+SERVING_WT+'&nutr_cont1='+ NUTR_CONT1
			String desc_kor = request.getParameter("DESC_KOR");
			
//			List<String> desc = new ArrayList<String>();
//			List<String> serving = new ArrayList<String>();
//			List<String> kcal = new ArrayList<String>();
			
			JsonArray desc = new JsonArray();
			JsonArray serving = new JsonArray();
			JsonArray kcal = new JsonArray();
			
			String addr ="http://openapi.foodsafetykorea.go.kr/api/5d1b56edfa3a46f89f21/I0750/json/1/50/";
			String parameter = "DESC_KOR=" + desc_kor;  
			
			String healthUrl = addr+parameter;
			
			URL url = new URL(healthUrl);
			System.out.println(url);
			
			BufferedReader bf;
			String line = "";
			String result = "";
			
			bf = new BufferedReader(new InputStreamReader(url.openStream()));
			
			while((line=bf.readLine()) != null) {
				result = result.concat(line);
				
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			String list_desc = "";
			String list_serving = "";
			String list_kcal = "";
			JsonElement ele_I0750 = element.getAsJsonObject().get("I0750");
			
			//JsonArray ele_row = ele_I0750.getAsJsonObject().get("row").getAsJsonArray();
			//System.out.println(ele_row);
			
			for(int i =0; i < ele_I0750.getAsJsonObject().get("row").getAsJsonArray().size(); i++) {
				
				JsonObject obj_desc = ele_I0750.getAsJsonObject().get("row").getAsJsonArray().get(i).getAsJsonObject();
				
				JsonElement ele_desc = obj_desc.get("DESC_KOR");
				JsonElement ele_serving = obj_desc.get("SERVING_WT");
				JsonElement ele_kcal = obj_desc.get("NUTR_CONT1");
				//System.out.println(ele_serving);
				
				String health_desc = ele_desc.getAsString();
				String health_serving = ele_serving.getAsString();
				String health_kcal = ele_kcal.getAsString();
				
				if(i == ele_I0750.getAsJsonObject().get("row").getAsJsonArray().size() -1) {
					list_desc += health_desc;
				    list_serving += health_serving;
				    list_kcal += health_kcal;
				}else {
					list_desc += health_desc + "/";
				    list_serving += health_serving + "/";
				    list_kcal += health_kcal + "/";
				}
				//System.out.println(ele_row.get(i).getAsJsonObject().get("DESC_KOR"));
//				JsonElement ele_desc = ele_row.get(i).getAsJsonObject().get("DESC_KOR");
//				System.out.println(ele_desc);
//				JsonElement ele_serving = ele_row.get(i).getAsJsonObject().get("SERVING_WT");
//				JsonElement ele_kcal = ele_row.get(i).getAsJsonObject().get("NUTR_CONT1");
//				
//				desc.add(ele_desc);
//				obj_desc.add("obj_desc", desc);
				
				//serving.add(ele_serving);
				//kcal.add(ele_kcal);
				//System.out.println(desc);
				//System.out.println(serving);
				//System.out.println(kcal);
			}
			
			PrintWriter out = response.getWriter();
			String total = list_desc + "&" + list_serving + "&" + list_kcal;
			out.print(total);
			System.out.println(list_desc);
			
			
			request.setAttribute("desc_kor", URLEncoder.encode(desc_kor, "UTF-8"));
			
			

		} else if (command.equals("health"))

		{

			List<health_dto> list = new ArrayList<health_dto>();

			list = biz.selectList();

			request.setAttribute("list", list);

			RequestDispatcher dispatch = request.getRequestDispatcher("health.jsp");
			dispatch.forward(request, response);

		} else if (command.equals("insertres")) {

			String id = request.getParameter("id");
			int weight = 0;
			if(request.getParameter("weight") != null)
				weight = Integer.parseInt(request.getParameter("weight"));
			
			String food = request.getParameter("food");
			float amount = 0;
			if(request.getParameter("amount") != null)
				amount = Float.parseFloat(request.getParameter("amount"));
			
			float kcal = 0;
			if(request.getParameter("kcal") != null)
			    kcal = Float.parseFloat(request.getParameter("kcal"));

			health_dto dto = new health_dto();

			dto.setHealth_id(id);
			dto.setHealth_weight(weight);
			dto.setHealth_food(food);
			dto.setHealth_amount(amount);
			dto.setHealth_kcal(kcal);

			int res = biz.insert(dto);

			request.setAttribute("health_dto", dto);

			if (res > 0) {
				System.out.println("입력 성공");

				RequestDispatcher dispatch = request.getRequestDispatcher("health.do?command=health");
				dispatch.forward(request, response);

			} else {
				System.out.println("실패");
			}

		} else if (command.equals("search")) {

			List<String> search_list = null;
			String desc_kor = request.getParameter("desc_kor");


			request.setAttribute("search_list", search_list);
			request.setAttribute("desc_kor", URLEncoder.encode(desc_kor, "UTF-8"));
			

			// search_list = biz.searchList(search_desc);
			RequestDispatcher dispatch = request.getRequestDispatcher("healthinfo.jsp");
			dispatch.forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
