<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to SaveLife</title>
</head>
<body>
	<div>
		<H1>Welcome to SaveLife</H1>
		<input type="submit" id="fetch" value="Fetch" /> <input type="submit"
			id="test" value="Test" />
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/js/common.js" />"></script>
</body>
</html>
<script>
	$('#fetch').click(function() {
		serviceData = {};
		serviceData.type = "GET";
		serviceData.url = "Controller";
		serviceData.data = "";
		service(serviceData, function(response) {
			console.info("Response is Fetch is ", response);
		});
	})

	$('#test').click(function() {
		serviceData = {};
		serviceData.type = "GET";
		serviceData.url = "testMap";
		serviceData.data = "";
		service(serviceData, function(response) {
			console.info("Response from Test is ", response);
		});
	})
</script>