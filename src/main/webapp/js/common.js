//Ajax service call
alert("updated!!")
function service(serviceData, callback) {
	$.ajax({
		type: serviceData.type,
		url: serviceData.url,
		data: "/SaveLife/" + serviceData.data,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (response) {
			callback(response);
		},
		error: function (msg) {
			console.info("Oops, something went horribly wrong ", msg);
		}
	});
}