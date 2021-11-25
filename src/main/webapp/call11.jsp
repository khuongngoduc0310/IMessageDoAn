<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="signal.js">
</script>
<style>
	video {
	  -webkit-transform: scaleX(-1);
	  transform: scaleX(-1);
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Web Demo</title>
</head>
<body>
	<video id="localStream" width="400" height="300" autoplay="autoplay" playsInline></video>
	<video id="remoteStream" width="400" height="300" autoplay="autoplay" preload="none" playsInline></video>
	<button onclick="record();">Call</button>
	<button onclick="audioCtx.resume();">Connect</button>
</body>

</html>