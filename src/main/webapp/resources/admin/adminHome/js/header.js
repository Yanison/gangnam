var goUrlLogout = "/admin/adminLogin";
	
	$("#btnLogout").on("click", function(){
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/admin/xdminLogoutProc"
			,data : {}
			,success: function(response) {
				if(response.rt == "success") {
						location.href = goUrlLogout;
				} else {
					// by pass
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});