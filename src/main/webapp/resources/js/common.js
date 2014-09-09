	//Ajax service call
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
	
	function IsNotBlank(data) {
		if (data === null) {
			return false;
		}
		if (data === '') {
			return false;
		}
		if (data === undefined) {
			return false;
		}
		return true;
	}
	
	function IsValidEmail(email) {
		var atpos = email.indexOf("@");
		var dotpos = email.lastIndexOf(".");
		if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=email.length) {
			return false;
		}
		return true;
	}
	
	
	function resetFields() {
		$("input[type=text]").val("");
	
		var selects = $("select");
		for (var i in selects) {
			selects[i].selectedIndex = 0;
		}
		
		$("input[type=text],textarea, select").removeClass('danger');
	}
	

	 function addLoading() {
        // add the overlay with loading image to the page
        var over = '<div id="overlay" class="overlay">' +
            '<img id="loading" src="http://bit.ly/pMtW1K">' +
            '</div>';
        $(over).appendTo('body');

       /* // click on the overlay to remove it
        $('#overlay').click(function() {
            $(this).remove();
        });

        // hit escape to close the overlay
        $(document).keyup(function(e) {
            if (e.which === 27) {
                $('#overlay').remove();
            }
        });*/
    };
    
    function removeLoading() {
    	 $('#overlay').remove();
    }
