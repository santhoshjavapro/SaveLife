//Ajax service call
//alert("common loading!!")
function service(serviceData, callback) {
	$.ajax({
		url: serviceData.url,
		type: serviceData.type,
		dataType: "json",
		data: JSON.stringify(serviceData.data),
	 	contentType: 'application/json',
		success: function (response) {
			callback(response);
		},
		error: function (msg) {
			console.info("Oops, something went horribly wrong ", msg);
		}
	});
}
