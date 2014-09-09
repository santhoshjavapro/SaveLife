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

	<div class="header">
		<!-- 	<a class="logout" href="">Logout</a>	 -->
		<H1>Welcome to SaveLife</H1>

	</div>

	<div class="homeContainer">
		<div class="searchContainer">
			<select class="selects" name="bgroup" id="bgroup">
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
			</select> <select class="selects" name="cities" id="cities" /> <input
				class="homeSubmit" type="submit" id="submit" value="Search" />
			<div class="resultBox" />
		</div>

	</div>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/common.js" />"></script>
	<link href="<c:url value="/resources/css/common.css" />"
		rel="stylesheet" />
</body>
</html>
<script>
	
	$(document).ready(function() {
		addLoading();
		setTimeout (function() {
			loadCities();
		}, 5000)
		
	});
	
	$('#submit').click(function() {
				$(".resultBox").html("");
				$("#bgroup").removeClass('danger');
				var bgroup = $("#bgroup").val();
				var city = ($("#cities").val()).toLowerCase();
				if (city === 'select city') {
					city = "";
				}
				if (bgroup !== 'Select Blood Group') {
					callSearchService(bgroup, city);
				} else {
					$("#bgroup").addClass('danger');
					$(".resultBox").html("<H3 style='color:red;'>Please Select a Blood Group<H3>");
				}
				
				
			});
	
	function loadCities() {
		$('select[name=cities]').html('')
		serviceData = {};
		data = {};
		serviceData.type = "GET";
		serviceData.url = "/SaveLife/home/getCities";
		serviceData.data = data;
		service(serviceData, function(response) {
			var cities = response.object;
			if (cities !== null) {
				var selectText = document.createElement('option');
				selectText.text = 'Select City';
				$('select[name=cities]').append(selectText);
				
				
				for (i in cities) {
					var option = document.createElement('option');
					option.text = cities[i];
					option.name = cities[i];
					option.value = cities[i];
					$('select[name=cities]').append(option);
				}
				removeLoading();
			}
		});
	}
	
	function callSearchService(bgroup, city) {
		serviceData = {};
		data = {};
		serviceData.type = "GET";
		serviceData.url = "/SaveLife/home/getblood?"+$.param({bgroup: bgroup, city:city});
		serviceData.data = data;
		service(serviceData, function(response) {
			object = response.object;
			if (object.length === 0) {
				$(".resultBox").html("<H3>Your Search Does not return any values<H3>");
			} else {
				for (i in object) {
					var name = object[i].name;
					
					var temp_a = "<div class='resultlist'><a name='"+name+"'href='#'>"+name+"</a></div>";
					$(".resultBox").append(temp_a);
					$("a[name='"+name+"']").data(object[i]);
				}
			}
			
		});
	}
	
		
	
</script>