package com.life.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.life.biz.member_biz;

@WebServlet("/emailchk.do")
public class emailchk_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String m_email = request.getParameter("email");

		String command = request.getParameter("command");
		System.out.println("<" + command + ">");

		Random rand = new Random();
		int randomNum = rand.nextInt((10000 - 1000) + 1) + 1000;

		if (command.equals("emailchk")) {

			String email = "pooo3405@gmail.com";

			try {
				String mail_from = "Life_Style" + "<" + email + ">";
				String mail_to = m_email;
				String title = "Life_Style 회원가입 인증 이메일 입니다";
				String contents = "이메일 인증 번호 입니다 " + "< " + randomNum + " >";

				mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
				mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");

				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.auth", "true");

				Authenticator auth = new SMTPAuthenticator();

				Session sess = Session.getDefaultInstance(props, auth);

				MimeMessage msg = new MimeMessage(sess);

				msg.setFrom(new InternetAddress(mail_from));
				msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
				msg.setSubject(title, "UTF-8");
				msg.setContent(contents, "text/html; charset=UTF-8");
				msg.setHeader("Content-type", "text/html; charset=UTF-8");

				Transport.send(msg);

			} catch (Exception e) {

				PrintWriter out = response.getWriter();
				out.println("실패");

			} finally {

				PrintWriter out = response.getWriter();
				out.println(randomNum);

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void alert(HttpServletResponse response, String msg, String url) throws IOException {

		PrintWriter out = response.getWriter();

		out.println(" <script type=\"text/javascript\">" + "	  alert('" + msg + "');" + "     location.href='" + url
				+ "';" + " </script> ");
	}

	public void alert2(HttpServletResponse response, String msg) throws IOException {

		PrintWriter out = response.getWriter();

		out.println(" <script type=\"text/javascript\">" + "	  alert('" + msg + "');" + " </script> ");
	}
}