<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ModelDAO.LoginDAO" %>
<%@ page import="Model.User" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	LoginDAO dao = new LoginDAO();
	dao.connectDatabase();
	User user = dao.checkLogin(username, password);
	response.setContentType("text/html;charset=UTF-8");
	if (user == null){
		response.sendRedirect("login.jsp");
	}
	else{
		request.setAttribute("User", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("messaging.jsp");
		dispatcher.forward(request, response);
	}
%>