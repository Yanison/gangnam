document.write("<script src='/resources/common/js/common.js'></script>");
document.write("<script src='/resources/xdmin/js/constantsXdmin.js'></script>");
document.write("<script src='/resources/xdmin/js/validationXdmin.js'></script>");


divSearchControl = function() {
    var screenWidth = $(window).width();
    if (screenWidth < BOOTSTRAP5_SM_DIMENSIONS) {
        $('#divSearch').hide();
        $('#iSearchControlUp').hide();
        $('#iSearchControlDown').show();
    } else {
        // by pass
    }
}
 
 
$('#divSearchControl').on('click', function() {
    if ($('#divSearch').is(':visible')) {
         $('#divSearch').hide();
         $('#iSearchControlUp').hide();
         $('#iSearchControlDown').show();
    } else {
         $('#divSearch').show();
         $('#iSearchControlUp').show();
         $('#iSearchControlDown').hide();
    }
 });


checkUploadedTotalFileNumber = function(obj, allowedMaxTotalFileNumber, filesCount, uploadedFilesCount) {
	if(allowedMaxTotalFileNumber < (filesCount + uploadedFilesCount)){
		// 매개변수로 들어온 allowedMaxTotalFileNumber, 총 파일 개수가 filesCount + uploadedFilesCount 보다 작을시
		// 아래의 알림창을 띄움
		alert("전체 파일 갯수는 "+ allowedMaxTotalFileNumber +"개 까지 허용됩니다.");
//		$("#file"+seq).val("");
//		obj.val("");
		return false;
	}
}


checkUploadedExt = function(objName, seq, div) {
	var ext = objName.split('.').pop().toLowerCase();
	/**
	split(구분자,제한) 문자를 배열로 반환하는 함수임. 
	문자열을 구분자로 잘라서 제한된 크기 이하의 배열에 문자열을 저장하여 리턴한다. 
	
	pop()은 자바스크립트에서 제공하는 배열에관한 메소드인데 
	배열의 마지막 요소를 제거하고 제거된 요소를 반환한다. 
	
	즉 매개변수로 들어온 objName는 파일이름.확장자로 들어오는데  
	구분자 . 으로 분리하고 배열로 반환을 하는데 [파일이름, 확장자]의 형태로 반환된다. 
	이후 pop() 메소드를 사용하여 반환된 배열의 마지막 요소인 확장자를 제거하고 제거된 확장자 이름을 반환한다. 
	 */
	var extArray = eval("extArray" + div);
	/**
	eval()은 문자로 표현된 자바스크립트 코드를 실행하는 함수이다. 
	extArray+div로 표현하였다. 즉, upload에서 매개변수로 들어온 숫자가 div 유저가 선택한 확장자 포멧을 찾는 것
	 */
	
	
	if(extArray.indexOf(ext) == -1) {
	//확장자 배열에 없는 확장자면 경고를 띄움
		alert("허용된 확장자가 아닙니다.");
//		$("#file"+seq).val("");
		return false;
	}
}


checkUploadedEachFileSize = function(obj, seq, allowedEachFileSize) {

	if(obj.size > allowedEachFileSize){
		alert("각 첨부 파일 사이즈는 "+kbToMb(allowedEachFileSize)+"MB 이내로 등록 가능합니다.");
		$("#file"+seq).val("");
		return false;
	}
}


checkUploadedTotalFileSize = function(seq, totalSize, allowedTotalFileSize) {
	if(totalSize > allowedTotalFileSize){
		alert("전체 용량은 "+kbToMb(allowedTotalFileSize)+"M를 넘을 수 없습니다.");
		$("#file"+seq).val("");
		return false;
	}
}





