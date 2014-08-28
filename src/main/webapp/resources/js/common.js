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

function queryparamdecomposer(query) {
//	var query = location.search.substr(1);
	var result = {};
	query.split("&").forEach(function(part) {
	  var item = part.split("=");
	  result[item[0]] = decodeURIComponent(item[1]);
	});
	return result;
}