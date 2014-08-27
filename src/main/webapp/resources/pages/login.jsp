<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to SaveLife</title>
</head>
<body style="background-color:#999687">
	<div align="center">
		<section style="padding-top:10%">
			<H1>Welcome to SaveLife</H1>
		</section>
		<section style="padding-top:5%">
			<input type="text" name="username" id="username" placeholder="Username"/>
			<input type="password" name="password" id="password" placeholder="Password"/>
			<input type="submit" value="Login" id="login"/>
		</section>
		
		<section style="padding-top:5%"><a href="/pages/signup.jsp">Sign Up</a></section>
	</div>
	
	<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/common.js" />"></script>
</body>
</html>
<script>
	$('#login').click(function(){
		
		serviceData = {};
		data = {};
		serviceData.type = "POST";
		serviceData.url = "Login";
		data.username = $("#username").val();
		data.password = $("#password").val();
		serviceData.data = data;
		service(serviceData, function(response) {
			console.info("Response is ", response);
		});
	});
</script>