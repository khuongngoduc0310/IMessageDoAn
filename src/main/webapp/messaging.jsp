<%@page import="Model.BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>IMessenger</title>

<%
User user = (User) request.getAttribute(("User"));
if (user == null)
	user = (User) session.getAttribute("User");
else {
	session.setAttribute("User", user);
}
String targetId = request.getParameter("targetID");
if (targetId == null)
	targetId = "-1";
%>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/normalize.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    	setInterval(loadMessage,1000);
		function loadMessage(){
    		$.post("C_loadmessage",{sendID : "<%out.print(user.getUser_ID());%>", receiveID : "<%out.print(targetId);%>"},function(data,status){
    			document.getElementsByClassName("grid-message")[0].innerHTML = data;
    		});
    		
    		
    	};
    	function sendMessage(){
    		let content = document.getElementById("message-content").value;
    		$.post("C_sendmessage",{sendID : "<%out.print(user.getUser_ID());%>", receiveID : "<%out.print(targetId);%>", messContent : content});
    		loadMessage();
    		document.getElementById("message-content").value = "";
    	};
    </script>


</head>

<body>



	<div class="wrapper">
		<header>
			<div class="container">
				<div class="middle">
					<p>Messenger</p>
				</div>
				<div class="right">
					<div class="username">Name</div>
				</div>
			</div>
		</header>
		<main>
			<div class="col-left">
				<div class="col-content">
					<div class="messages"></div>
					<form action="messaging.jsp">
						Enter ID: <input type="text" name="targetID"> <input
							type="submit">
					</form>
				</div>
			</div>
			<div class="col">
				<div class="col-content">
					<section class="message">
						<div class="grid-message"></div>
					</section>
				</div>
				<div class="col-foot">
					<div class="compose">
						<input placeholder="Type a message" id="message-content">
						<div class="compose-dock">
							<div class="dock">
								<button onclick="sendMessage();" id="btn-send">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<script type="text/javascript">
	    	$("#message-content").keyup(function(event) {
    		if (event.keyCode === 13) {
        		sendMessage();
    		}
		});
	</script>
</body>
</html>