<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to SaveLife</title>
</head>
<body>
	
	<div class=loginContainer align=center>
		<div align="center">
			<H1>Welcome to SaveLife</H1>
			<h3>Sign In/Sign Up for Access</h3>
		</div>
		<div class="signupDiv"><input type="text"	name="username" id="username" placeholder="Username" /></div>
		<div class="signupDiv"><input type="password" name="password" id="password" placeholder="Password" /></div>
		<div class="signupDiv"><input type="submit" value="Login" id="login" /> </div>
		<div class="loginError">
			<h3>Login Failed</h3>
		</div>
		<div class="signuplink"><a href="<c:url value="/resources/pages/signup.jsp" />">Sign Up</a></div>
	</div>
	
	<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/common.js" />"></script>
	<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet" />
	<%-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.19/angular.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/app.js" />"></script> --%>
	
</body>
</html>
<script>
	$(".loginError").hide();
	$('#login').click(function() {
		$(".loginError").hide();
		serviceData = {};
		data = {};
		serviceData.type = "POST";
		serviceData.url = "/SaveLife/User/login";
		data.username = $("#username").val();
		data.password = $("#password").val();
		data.donor_id = "";
		serviceData.data = data;
		service(serviceData,function(response) {
			if (response.message === "Login Succesful") {
				response.code
				window.location = "/SaveLife/resources/pages/home.jsp?"+$.param({ code: response.code});
			} else {
				$(".loginError").show();
			}
		}); 
	});
</script>