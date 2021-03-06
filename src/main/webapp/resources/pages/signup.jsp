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
		<div class="header">
			<div class="logout">
<!-- 				<button class="editButton" onClick="edit();">Edit</button>	 -->
				<button class="signButton" onClick="sign();">Logout</button>
			</div>
			
			<H1  class="mainSignHeader">Welcome to SignUp Page</H1>
			<h3 class="subHeader">Please Fill all your Details to signup</h3>
		</div>
		
		<div class="signupContainer" align=center>
			<div class="signupDiv"><input class="signupInput" type="text" name="name" id="name" placeholder="Name*" /></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="dob" id="dob" placeholder="Year of Birth" /></div>
			<div class="signupDiv">
				<select class="signupInput" name="gender" id="gender">
					<option selected="selected">Select Gender*</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="third">Third Gender</option>
				</select>
			</div>
			<div class="signupDiv">
				<select class="signupInput" name="bgroup" id="bgroup">
					<option selected="selected">Select Blood Group*</option>
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
			<div class="signupDiv"><!-- <input class="signupInput" type="text" name="address" id="address" placeholder="Address"/> -->
				<input class="address" type="text" name="city" id="city" placeholder="City*"/>
				<input class="address" type="text" name="state" id="state" placeholder="State"/>
				<input class="address" type="text" name="country" id="country" placeholder="Country"/>
				<input class="address" type="text" name="pincode" id="pincode" placeholder="Pincode*"/>
			</div>
			<div class="signupDiv"><input class="signupInput" type="text" name="contact_no" id="contact_no" placeholder="Contact Number*(comma seperated if multiple)"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="alternate_contact_no" id="alternate_contact_no" placeholder="Alternate Number(comma seperated if multiple)"/></div>
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
			<div class="signupDiv"><input class="signupInput" type="text" name="email_id" id="email_id" placeholder="Email Id*(comma seperated if multiple)"/></div>
			<div class="signupDiv"><input class="signupInput" type="password" name="password" id="password" placeholder="Password*"/></div>
			
			<!-- <div class="signupDiv"><input class="signupInput" type="text" name="height" id="height" placeholder="Height(In cms)"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="weight" id="weight" placeholder="Weight(In cms)"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="last_donated_date" id="last_donated_date" placeholder="Last Donated Date"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="health_issues" id="health_issues" placeholder="Health Issues"/></div>
			<div class="signupDiv"><input class="signupInput" type="text" name="health_issues_desc" id="health_issues_desc" placeholder="Health Issues Description"/></div> -->
			<div class="signupDiv">
				<div class="signupButton"><input type="submit" id="submit" value="Submit"/></div>
				<div class="signupButton">
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
	$(document).ready(function() {
		addLoading();
		$('.successSignup').hide();
		checkSessionandLoad();
	});
	
	$("#submit").click(function(){
		$('.signupContainer').find("input[type=text],textarea, select").removeClass('danger');
		
		serviceData = {};
		wrapper = {};
		serviceData.type = "POST";
		serviceData.url = "/SaveLife/User/signup";
		wrapper = getData(wrapper);
		if (wrapper.state) {
			serviceData.data = wrapper.data;
			service(serviceData,function(response) {
//	 			window.location = "resources/pages/index.jsp";
				$('#signupPage').hide();
			 	$('.successSignup').show();
			 	setTimeout(function(){
			 		window.location = "/SaveLife/resources/pages/login.jsp";
		 		}, 3000);
			}); 
		} 
	});
	
	function checkSessionandLoad() {
		var code = localStorage.getItem('usercode');
		if (IsNotBlank(code)) {
			$('.signButton').show();
			serviceData = {};
			serviceData.type = "GET";
			serviceData.url = "/SaveLife/User/edit?code="+code;
			service(serviceData,function(response) {
				renderData(response.object[0]);
			}); 
		} else {
			$('.signButton').hide();
			resetFields();
			removeLoading();
		}
	}
	
	$("#reset").click(function(){
		resetFields();
	});
	
	$("#cancel").click(function(){
		/* if (confirm("Redirecting to Login Page") == true) {
			window.location = "login.jsp";
	    }  */
	    if (IsNotBlank(localStorage.getItem('username'))) {
	    	window.location = "home.jsp";
	    } else {
	    	clearSession();
	    	window.location = "login.jsp";
	    }
		
	});
	
	$("#contact_no, #alternate_contact_no").bind("keyup", function(e) {
	    this.value = this.value.replace(/[^-,0-9]/g, '');
	});
	
	$("#email_id").focusout(function() {
		validateUser();
	});
	
	function renderData(obj) {
		$('#name').val(obj.name);
		$('#dob').val(obj.dob);
		$('#gender').val(obj.gender);
		$('#bgroup').val(obj.bgroup);
		$('#city').val(obj.city);
		$('#state').val(obj.state);
		$('#country').val(obj.country);
		$('#pincode').val(obj.pincode);
		$('#contact_no').val(obj.contact_no);
		$('#alternate_contact_no').val(obj.alternate_contact_no);
		$('#availability').val(obj.availability);
		$('#email_id').val(obj.email_id);
		$('#password').val(obj.password);
		$('#password').val(obj.password);
		setTimeout(function () {
			removeLoading();
		}, 1500)
		
	}
	
	function validateUser() {
		var email = $("#email_id").val();
		if (IsNotBlank(email)) {
			var array = email.split(',');
			if (IsValidEmail(array[0])) {
				serviceData = {};
				serviceData.type = "GET";
				serviceData.url = "/SaveLife/User/validateuser?username="+array[0];
				service(serviceData,function(response) {
					if (response.message === 'Username Already Exists') {
						$("#email_id").val('');
						$("#email_id").addClass('danger');
						$("#email_id").attr('placeholder', 'Username Already Exists');
						setTimeout(function(){
							$("#email_id").attr('placeholder', 'Email Id*(comma seperated if multiple)');
						},3000);
					}
				}); 
			} else {
				$("#email_id").val('');
				$("#email_id").addClass('danger');
				$("#email_id").attr('placeholder', 'Please Enter an Valid Email Id');
			}
		}
	}
	
	function getData(wrapper) {
		var data = {}
		wrapper.state = true;
// 		data = (($('.signupContainer input,select').serialize()))
// 		data = $('.signupContainer input,select').serialize();
		data.password = $("#password").val();
		data.dob = $("#dob").val();
// 		data.donor_id = ($("#donor_id").val()).toLowerCase();
		data.name = ($("#name").val()).toLowerCase();
		data.bgroup = ($("#bgroup").val()).toLowerCase();
		data.gender = ($("#gender").val()).toLowerCase();
		data.city = ($("#city").val()).toLowerCase();
		data.state = ($("#state").val()).toLowerCase();
		data.country = ($("#country").val()).toLowerCase();
		data.pincode = $("#pincode").val();
		var email = ($("#email_id").val()).toLowerCase();
		data.email_id = email.split(',');
		var cnt = $("#contact_no").val();
		data.contact_no = cnt.split(',');
		var alt = $("#alternate_contact_no").val();
		data.alternate_contact_no = alt.split(',');
		data.availability = ($("#availability").val()).toLowerCase();
		//deprecated
		data.height = $("#height").val();
		data.weight = $("#weight").val();
		data.last_donated_date = $("#last_donated_date").val();
		data.health_issues = $("#health_issues").val();
		data.health_issues_desc = $("#health_issues_desc").val();
		
		wrapper.state = getState();
		
		if (IsNotBlank($("#email_id").val())) {
			for (var i in data.email_id) {
				if (!IsValidEmail(data.email_id[i])) {
					wrapper.state = false;
					$("#email_id").addClass('danger');
				}
			}
			data.username = data.email_id[0];
		} else {
			wrapper.state = false;
			$("#email_id").addClass('danger');
		}
		wrapper.data = data;
		return wrapper;
	}
	
	function getState() {
		var state = true;
		if (!IsNotBlank($("#password").val())) {
			state = false;
			$("#password").addClass('danger');
		}
		if (!IsNotBlank($("#name").val())) {
			state = false;
			$("#name").addClass('danger');
		}
		if (!IsNotBlank($("#bgroup").val()) || 	"Select Blood Group*" === $("#bgroup").val()) {
			state = false;
			$("#bgroup").addClass('danger');
		}
		if (!IsNotBlank($("#gender").val()) || 	"Select Gender*" === $("#gender").val()) {
			state = false;
			$("#gender").addClass('danger');
		}
		if (!IsNotBlank($("#city").val())) {
			state = false;
			$("#city").addClass('danger');
		}
		if (!IsNotBlank($("#pincode").val())) {
			state = false;
			$("#pincode").addClass('danger');
		}
		if (!IsNotBlank($("#contact_no").val())) {
			state = false;
			$("#contact_no").addClass('danger');
		}
		return state;
	}
</script>