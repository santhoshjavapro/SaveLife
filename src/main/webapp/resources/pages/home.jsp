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
		<div class="logout">
			<button class="editButton" onClick="edit();">Edit</button>	
			<button class="signButton" onClick="sign();">Logout</button>
		</div>
		
		<H1 class="mainHomeHeader">Welcome to SaveLife</H1>

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
		checkSession();
		constructEmptyTable();
		setTimeout (function() {
			loadCities();
		}, 1500);
	});
	
	function edit() {
		addLoading();
		window.location = "/SaveLife/resources/pages/signup.jsp";
	}
	
	function sign() {
		addLoading();
		clearSession();
		window.location = "/SaveLife/";
	}
	
	$('#submit').click(function() {
// 			$(".resultBox").html("");
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
				noResult("<H4 style='color:red;'>Please Select a Blood Group<H4>");
// 				$(".resultBox").html("<H3 style='color:red;'>Please Select a Blood Group<H3>");
				
			}
		});
	
	
	function loadCities() {
		$('select[name=cities]').html('')
		serviceData = {};
		serviceData.type = "GET";
		serviceData.url = "/SaveLife/home/getCities";
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
		serviceData.type = "GET";
		serviceData.url = "/SaveLife/home/getblood?"+$.param({bgroup: bgroup, city:city});
		service(serviceData, function(response) {
			object = response.object;
			if (object.length === 0) {
// 				$(".resultBox").html("<H3>Your Search Does not return any values<H3>");
				noResult("<H4>Your Search Does not return any values<H4>");
			} else {
				appendResults(object);
				/* for (i in object) {
					var name = object[i].name;
					
					var temp_a = "<div class='resultlist'><a name='"+name+"'href='#'>"+name+"</a></div>";
					$(".resultBox").append(temp_a);
					$("a[name='"+name+"']").data(object[i]);
				} */
			}
			
		});
	}
	
	function noResult(msg) {
		$('#firstTr').html('');
		$('.removableTrs').remove();
		var table = document.getElementById('resultTable');
		
		var firstTr = document.getElementById('firstTr');
		var firstTd = document.createElement('td');
		
		firstTr.id ="firstTr";
		firstTr.setAttribute('class', 'toRemove');
		firstTd.id ="firstTd";
		firstTd.innerHTML = msg;
		firstTd.setAttribute('colspan', 7);
		firstTd.setAttribute('style', "text-align:center");
		firstTr.appendChild(firstTd);
		table.appendChild(firstTr);
	}
	
	function appendResults(object) {
		$('.removableTrs').remove();
		console.info($('#firstTd'));
		$('#firstTr').remove();
		var table = document.getElementById('resultTable');
		console.info(table)
		for (i in object) {
			console.info(object[i].name);
			
			var tr = document.createElement('tr');
			tr.setAttribute("class", "removableTrs");
			
			var s_no =  document.createElement('td');
			var j = i;
			s_no.innerHTML = ++j;
			tr.appendChild(s_no);
			
			var name =  document.createElement('td');
			name.innerHTML = '<a href="">'+object[i].name+'</a>';
			tr.appendChild(name);
			
			var bgroup =  document.createElement('td');
			bgroup.innerHTML = getBloodGroup (object[i].bgroup);
			tr.appendChild(bgroup);
			
			var city =  document.createElement('td');
			city.innerHTML = object[i].city;
			tr.appendChild(city);
			
			var numbers = object[i].contact_no;
			var numberSum = "";
			for (j in numbers) {
				numberSum = numberSum +  " " + numbers[j] + " ";
			}
			var contact_no =  document.createElement('td');
			contact_no.innerHTML = addSpace(numberSum);
			contact_no.title = numberSum;
			tr.appendChild(contact_no);
			
			var alt = object[i].alternate_contact_no;
			var altSum = "";
			for (j in alt) {
				altSum = altSum +  " " + alt[j] + " ";
			}
			var alternate =  document.createElement('td');
			alternate.innerHTML = addSpace(altSum);
			alternate.title = altSum;
			tr.appendChild(alternate);
			
			var emails = object[i].email_id;
			var emailSum = "";
			for (j in emails) {
				emailSum = emailSum +  " " + emails[j] + " ";
			}
			var email_id =  document.createElement('td');
			email_id.innerHTML = addSpace(emailSum);
			email_id.title = emailSum;
			tr.appendChild(email_id); 
			
			
			table.appendChild(tr);
		}
	}
	
	function addSpace (content) {
		//to insert a space
// 		return content.replace(/^(.{4})(.{6})(.*)$/, "$1 $2 $3");
		return content.replace(/^(.{7})(.*)$/, "$1...");
	}
	
	function getBloodGroup (code) {
		if (code === "a1n") {
			code = "A1 Negative (A1 -ve)";
		}
		if (code === "a1p") {
			code = "A1 Positive (A1 +ve)";
		}
		if (code === "a1bn") {
			code = "A1 Positive (A1 +ve)";
		}
		if (code === "a1p") {
			code = "A1B Positive (A1B +ve)";
		}
		if (code === "a2n") {
			code = "A2 Negative (A2 -ve)";
		}
		if (code === "a2p") {
			code = "A2 Positive (A2 +ve)";
		}
		if (code === "a2bn") {
			code = "A2B Negative (A2B -ve)";
		}
		if (code === "a2bp") {
			code = "A2B Positive (A2B +ve)";
		}
		if (code === "bn") {
			code = "B Negative (B -ve)";
		}
		if (code === "bp") {
			code = "B Positive (B +ve)";
		}
		if (code === "b1n") {
			code = "B1 Negative (B1 +ve)";
		}
		if (code === "b1p") {
			code = "B1 Positive (B1 +ve)";
		}
		if (code === "on") {
			code = "O Negative (O -ve)";
		}
		if (code === "op") {
			code = "O Positive (O +ve)";
		}
		
		return code;
	}
	
	function constructEmptyTable() {
		var table = document.createElement('table');
		table.setAttribute('id', 'resultTable');
		table.name="resultTable";
		table.style.border = "1px solid black";
		table.style.width = "100%";
		table.style.backgroundColor = "white";
		table.setAttribute('cellpadding', '10%');
		table.setAttribute('cellspacing', '10%');
		table.setAttribute('font-size', '200%');
		
		var s_no = document.createElement('th');
		s_no.id ="s_no";
		s_no.innerHTML = "S.No";
		
		var name = document.createElement('th');
		name.id ="name";
		name.innerHTML = "Name";
		
		var bgroup = document.createElement('th');
		bgroup.id ="bgroup";
		bgroup.innerHTML = "Blood Group";
		
		var city = document.createElement('th');
		city.id ="city";
		city.innerHTML = "City";
		
		var contact_no = document.createElement('th');
		contact_no.id ="contact_no";
		contact_no.innerHTML = "Contact No";
		
		var alternate_contact = document.createElement('th');
		alternate_contact.id ="alternate_contact";
		alternate_contact.innerHTML = "Alt Contact No";
		
		var email = document.createElement('th');
		email.id ="email";
		email.innerHTML = "Email"; 
		
		var firstTr = document.createElement('tr');
		firstTr.id ="firstTr";
		firstTr.setAttribute('class', 'toRemove');
		
		var firstTd = document.createElement('td');
		firstTd.id ="firstTd";
		firstTd.innerHTML = "Search a blood group";
		firstTd.setAttribute('colspan', 7);
		firstTd.setAttribute('style', "text-align:center");
		firstTr.appendChild(firstTd);
		
		table.appendChild(s_no);
		table.appendChild(name);
		table.appendChild(bgroup);
		table.appendChild(city);
		 table.appendChild(contact_no);
		table.appendChild(alternate_contact);
		table.appendChild(email); 
		table.appendChild(firstTr);
		
		$(".resultBox").append(table);
	}
		
	
</script>