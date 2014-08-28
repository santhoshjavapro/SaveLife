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
	<div id="signupPage">
		<div align="center">
			<H1>Welcome to SignUp Page</H1>
			<h3>Please Fill all your Details to signup</h3>
		</div>
		
		<div class="signupContainer" align=center>
			<div class="signupDiv"><input class="signupInput" type="text" name="name" id="name" placeholder="Name" /></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="dob" id="dob" placeholder="Date of Birth" /></div>
			<div class="signupDiv">
				<select class="signupInput" name="gender" id="gender">
					<option selected="selected">Select Gender</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="third">Third Gender</option>
				</select>
			</div>
			<div class="signupDiv">
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
			</div>
			<div class="signupDiv"><input class="signupInput" type="text" name="address" id="address" placeholder="Address"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="email_id" id="email_id" placeholder="Email Id"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="contact_no" id="contact_no" placeholder="Contact Number"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="alternate_contact_no" id="alternate_contact_no" placeholder="Alternate Contact Number"/></div>
			<div class="signupDiv">
				<select class="signupInput" name="availability" id="availability" placeholder="Select Availability">
					<option selected="selected">Select Availability</option>
					<option value="morning">Mornings</option>
					<option value="afternoon">Afternoons</option>
					<option value="evening">Evenings</option>
					<option value="night">Nights</option>
					<option value="ice">Only in Emergency</option>
					<option value="all">24/7</option>
				</select>
			</div>
			<div class="signupDiv"><input class="signupInput" type="text" name="username" id="username" " placeholder="Username"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="password" id="password" placeholder="Password"/></div>
			
			<div class="signupDiv"><input class="signupInput" type="text" name="height" id="height" placeholder="Height(In cms)"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="weight" id="weight" placeholder="Weight(In cms)"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="last_donated_date" id="last_donated_date" placeholder="Last Donated Date"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="health_issues" id="health_issues" placeholder="Health Issues"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="health_issues_desc" id="health_issues_desc" placeholder="Health Issues Description"/></div>
			<div class="signupDiv">
				<div class="signupButton"><input type="submit" id="submit" value="Submit"/></div>
				<div class="signupDiv">
				<input class="splitButton" type="button" id="reset" value="Reset"/>
				<input class="splitButton"  type="button" id="cancel" value="Cancel"/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="successSignup"  align=center>
		<H1>Your Informations stored successfully, try logging in now...</H1>
	</div>
	
	
	<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet" />
	<script src="<c:url value="/resources/js/common.js" />"></script>
</body>
</html>
<script>
	$('.successSignup').hide();
	$("#submit").click(function(){
		serviceData = {};
		data = {};
		serviceData.type = "POST";
		serviceData.url = "/SaveLife/User/signup";
		data = getData(data)
		serviceData.data = data;
		console.info("data ", data)
		service(serviceData,function(response) {
// 			window.location = "resources/pages/index.jsp";
			console.info("response is ", response);
				$('#signupPage').hide();
			 	$('.successSignup').show();
			 	setTimeout(function(){
			 		window.location = "/SaveLife/resources/pages/login.jsp";
		 		}, 3000);
		});  
	});
	
	$("#reset").click(function(){
		$('.signupContainer').find("input[type=text],textarea,select").val("");
	});
	
	$("#cancel").click(function(){
		/* if (confirm("Redirecting to Login Page") == true) {
			window.location = "login.jsp";
	    }  */
		window.location = "login.jsp";
	});
	
	function getData(data) {
// 		data = (($('.signupContainer input,select').serialize()))
// 		data = $('.signupContainer input,select').serialize();
		data.username = $("#username").val();
		data.password = $("#password").val();
		data.donor_id = $("#donor_id").val();
		data.name =$("#name").val();
		data.bgroup =$("#bgroup").val();
		data.gender =$("#gender").val();
		data.dob =$("#dob").val();
		
		data.address =$("#address").val();
		data.email_id =$("#email_id").val();
		data.contact_no =$("#contact_no").val();
		data.alternate_contact_no =$("#alternate_contact_no").val();
		data.availability =$("#availability").val();
		
		data.height =$("#height").val();
		data.weight =$("#weight").val();
		data.last_donated_date =$("#last_donated_date").val();
		data.health_issues =$("#health_issues").val();
		data.health_issues_desc =$("#health_issues_desc").val();
		return data;
	}
</script>