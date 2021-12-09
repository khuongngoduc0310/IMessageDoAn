<%@page import="java.util.List"%>
<%@page import="Model.BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%
    	List<User> listUser = (List<User>)request.getAttribute("listUser");
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
    <title>Document</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/normalize.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./font/fontawesome-free-5.15.3-web/css/all.css">
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
    <div class="grid">
        <div class="form_message">
            <div class="account">
                <div class="account__header">
                    <div class="account__header-bar">
                        <div class="account__header-user">
                            <i class="account__header-img fas fa-user-circle"><%=user.getFullname()%></i>
                            <!--  account__user-info--appear -->
                            <div class="account__user-info">
                                <ul class="account__user-list">
                                    <li class="account__user-item"><%=user.getFullname() %> </li>
                                    <li class="account__user-item"><%=user.getAge() %> tuổi</li>
                                    <li class="account__user-item"> username: <%=user.getUsername() %></li>
                                    <li class="account__user-item"> password: <%=user.getPassword() %></li>
                                    <li class="account__user-item">
                                        <a class="logOut" href="">Log Out</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="account__header-function">
                            <div class="account__header-mess font__img-account">
                                <i class="fab fa-facebook-messenger"></i>
                            </div>
                            <div class="account__header-friend font__img-account">
                                <i class="fas fa-users"></i>
                            </div>
                        </div>
                    </div>
                    <div class="account__header-search">
                        <input type="text" name="Search" placeholder="Tìm kiếm">
                    </div>
                </div>
                <div class="account__body">
                    <ul class="list__friend">
                    	<li class="item__friend">
                            <a href="" class="item__friend-link">
                                <i class="item__friend-img font__img-account fas fa-user"></i>
                             
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="message">
                <div class="message__header">
                    <div class="message__header-info">
                        <i class="message__header-img far fa-user-circle"></i>
                        <span class="message__header-name"></span>
                    </div>
                    <div class="message__header-func">
                        <a href="" class="message__header-voiced">
                            <i class="font__img-account fas fa-phone"></i>
                        </a>
                        <a href="" class="message__header-call">
                            <i class="font__img-account fas fa-video"></i>
                        </a>
                    </div>
                </div>
                <div class="message__body">
                    <div class="message__content message__content--send">
                    </div>
                    <div class="message__content message__content--recieve">
                    </div>
                    <div class="message__content message__content--send">
                    </div>
                </div>
                <div class="message__submit">
                    <input class="message__content-submit" type="text" name="text">
                    <input class="btn__submit-mess" type="submit" value="Send" onclick="sendMessage()" id="btn-send">
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
    $("#message-content").keyup(function(event) {
        if (event.keyCode === 13) {
            sendMessage();
        }
    });

    //show account user
    const accOpen = document.querySelector('.account__header-user')
    const accInfo = document.querySelector('.account__user-info')
    const accClose = document.querySelector('.message')
    function ShowInfo(){
        accInfo.classList.add('account__user-info--appear')
    }
    function HideInfo(){
        accInfo.classList.remove('account__user-info--appear')
    }
    accOpen.addEventListener('click',ShowInfo)
    accClose.addEventListener('click',HideInfo)
</script>
</body>
</html>