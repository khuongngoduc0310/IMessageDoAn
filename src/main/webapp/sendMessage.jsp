<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="Model.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "ModelDAO.MessageDAO"%>
<%
	String receiveID = request.getParameter("receiveID");
	String sendID = request.getParameter("sendID");
	String content = request.getParameter("messContent");
	System.out.println(content);
	MessageDAO messDAO = new MessageDAO();
	messDAO.connectDatabase();
	Message message = new Message(-1, Integer.parseInt(sendID), Integer.parseInt(receiveID), LocalDateTime.now(), content );
	messDAO.postMessage(message);
%>