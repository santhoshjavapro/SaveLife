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
	<H1>Welcome to SaveLife</H1>
	<div class="homeContainer">
		<div class="searchContainer">
			<select class="signupInput" name="bgroup" id="bgroup">
					<option selected="selected">Select Blood Group</option>
					<option value="a1n">A1 Negative (A1 -ve)</option>
					<option value="a1p">A1 Positive (A1 +ve)</option>
					<option value="a1bn">A1B Negative (A1B -ve)</option>
					<option value="a1bp">A1B Positive (A1B +ve)</option>
					<option value="a2n">A2 Negative (A2 -ve)</option>
					<option value="a2p">A2 Positive (A2 +ve)</option>
					<option value="a2bn">A2B Negative (A2B -ve)</option>
					<option value="a2bp">A2B Positive (A2B +ve)</option>
					<option value="bn">B Negative (B -ve)</option>
					<option value="bp">B Positive (B +ve)</option>
					<option value="b1n">B1 Negative (B1 +ve)</option>
					<option value="b1p">B1 Positive (B1 +ve)</option>
					<option value="on">O Negative (O -ve)</option>
					<option value="op">O Positive (O +ve)</option>
				</select>
				<input type="submit" id="submit" value="Search"/>
		</div>
		<div class="resultBox">
		</div>
	</div>
	
	<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/common.js" />"></script>
	<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet" />
</body>
</html>
<script>
	
	$('#submit').click(function() {
				$(".order_list").html('');
				var bgroup = $("#bgroup").val();
				serviceData = {};
				data = {};
				serviceData.type = "GET";
				serviceData.url = "/SaveLife/home/getblood?"+$.param({ bgroup: bgroup});
				serviceData.data = data;
				service(serviceData, function(response) {
					$(".order_list").html();
					console.info("response ", response);
					object = response.object;
					if (object.length === 0) {
						$(".resultBox").html("<H3>Your Search Does not return any values<H3>");
					} else {
						for (i in object) {
							var name = object[i].name;
							
							var temp_a = "<a href='' class='resultlist'>"+name+"</a><br><br>";
							$(".resultBox").append(temp_a);
						}
					}
					
				});
			});
</script>