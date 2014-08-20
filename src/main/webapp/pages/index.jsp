<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to SaveLife</title>
</head>
<body>
<div>
<H1>Welcome to SaveLife</H1>
<input type="submit" id="fetch" value="Fetch"/>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/../js/common.js"></script>
</body>
</html>
<script>
	$('#fetch').click(function(){
		serviceData = {};
		serviceData.type = "GET";
		serviceData.url = "/SaveLife/Controller";
		serviceData.data = "";
		service(serviceData, function(response) { 
			console.info("Response is ",response);
		});
	})
	
	function service(serviceData, callback) {
		$.ajax({
			type: serviceData.type,
	        url: serviceData.url,
	        data: serviceData.data,
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        success: function (response) {
	           	callback(response);
	        },
	        error: function (msg) {
	        	console.info("Oops, something went horribly wrong");
	        }
		});
}
	
</script>