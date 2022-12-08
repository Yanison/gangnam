$(document).ready(function(){
	
	$('.divContents').hover(function(){
		console.log('hover')
		$('.div2 > div > div').css('background : #fff')
	})

})
function gohome(){
	location.href="http://127.0.0.1:8085"
}