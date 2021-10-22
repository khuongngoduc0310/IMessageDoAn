<%@page import="Model.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ModelDAO.MessageDAO"%>
<%@ page import = "java.util.*"%>
<%
	String receiveID = request.getParameter("receiveID");
	String sendID = request.getParameter("sendID");
	MessageDAO mess = new MessageDAO();
	mess.connectDatabase();
	List<Message> messages = mess.getMessages(Integer.parseInt(sendID), Integer.parseInt(receiveID));
	String data = "";
	if (messages != null)
	for (Message message : messages){
		if (message.getFrom_ID() == Integer.parseInt(sendID))
			data += "<div class='col-message-sent'><div class='message-sent'><p>"+message.getContent()+"</p></div></div>";
			else
				data += "<div class='col-message-received'><div class='message-received'><p>"+message.getContent()+"</p></div></div>";
	}
	out.println(data);
%>