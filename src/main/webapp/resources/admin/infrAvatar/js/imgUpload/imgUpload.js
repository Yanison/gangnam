document.write("<script src='/resources/admin/infrAvatar/js/imgUpload/common.js'></script>");
document.write("<script src='/resources/admin/infrAvatar/js/imgUpload/commonXdmin.js'></script>");
document.write("<script src='/resources/admin/infrAvatar/js/imgUpload/constantsXdmin.js'></script>");
document.write("<script src='/resources/admin/infrAvatar/js/imgUpload/validationXdmin.js'></script>");

/**
ajax
enctype : mutipart/form-data
pseq :: 등록한사람 


MultipartFile[] upload
 */

function upload(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
	
	console.log(
		"objName :: " + objName +"\n" // input Name
		+"seq :: " + seq+"\n" // ??
		+"allowedMaxTotalFileNumber :: " + allowedMaxTotalFileNumber+"\n"
		+"allowedExtdiv :: " + allowedExtdiv+"\n"
		+"allowedEachFileSize :: " + allowedEachFileSize+"\n"
		+"allowedTotalFileSize :: " + allowedTotalFileSize+"\n"
		+"uiType :: " + uiType+"\n"
		)
		
	
	
//		objName 과 seq 는 jsp 내에서 유일 하여야 함.
//		memberProfileImage: 1
//		memberImage: 2
//		memberFile : 3

//		uiType: 1 => 이미지형
//		uiType: 2 => 파일형
//		uiType: 3 => 프로필형

		var files = $("#" + objName +"")[0].files;
		var filePreview = $("#" + objName +"Preview");
		var numbering = [];
		var maxNumber = 0;
		
		if(uiType == 1) {
			console.log(
			"uiType == 1 :: " + (uiType == 1) + "\n"
			+ "case of uiType == " + uiType
			)
			var uploadedFilesCount = document.querySelectorAll("#" + objName + "Preview > div > img").length;
			// $("#objName+Preview > div > img")에 해당하는 요소의 개수.
			var tagIds = document.querySelectorAll("#" + objName + "Preview > div");
			/**
			%%querySelectorAll는 querySelector과 사용방법이 동일하지만 선택자를 선택하여 배열과 비슷한 객체인 nodeList를 반환한다.
			반환 객체가 nodeList이기 때문에 for문 또는 forEach문을 사용한다. 
			 */ 
			console.log(
			"uploadedFilesCount :: " + uploadedFilesCount + "\n" + 
			"tagIds == " + tagIds.toString()
			)
			
			for(var i=0; i<tagIds.length; i++){
				
				var tagId = tagIds[i].getAttribute("id").split("_");
				numbering.push(tagId[2]);
				
				console.log(
				"반복문" + "\n" + 
				"tagIds["+i+"]" + "\n" + 
				"tagId :: " + tagId
				)
			}
			/**
			id="objName+Preview" 안에 있는 Div들의 갯수 만큼 반복문을 실행.
			내부에 tagId라는 변수를 선언하는데 
			1.tagId[i].의 id값을 가져온 후에 
			2.언더바 _ 값을 split 해서 반환한 값을 할당함. 
			
			그리고 위에서 선언한 빈 배열이 numbering에 추가. 
			 */
			
			if(uploadedFilesCount > 0){
				numbering.sort();
				maxNumber = parseInt(numbering[numbering.length-1]) + parseInt(1);
			}
			/**
			만약 업로드된 파일의 갯수가 0보다 크면 
			배열 numbering을 오름차순으로 정렬 후에 
			maxNumber에 parseInt한 값들을 할당. 
			 */
		} else if(uiType == 2){
			console.log(
			"uiType == 2 :: " + (uiType == 2) + "\n"
			+ "case of uiType == " + uiType
			)
			var uploadedFilesCount = document.querySelectorAll("#" + objName + "Preview > li").length;
			var tagIds = document.querySelectorAll("#" + objName + "Preview > li");

			for(var i=0; i<tagIds.length; i++){
				var tagId = tagIds[i].getAttribute("id").split("_");
				numbering.push(tagId[2]);
			}
			
			if(uploadedFilesCount > 0){
				numbering.sort();
				maxNumber = parseInt(numbering[numbering.length-1]) + parseInt(1);
			}
		} else {
			// by pass
		}
		
		$("#" + objName + "MaxNumber").val(maxNumber);
		
		var totalFileSize = 0;
		// 파일의 총 크기 
		var filesCount = files.length;
		// 파일의 갯수
		var filesArray = [];
		// 파일 목록
		
		allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
		//allowedMaxTotalFileNumber, 허용된 파일의 업로드 개수가 0일이면 MAX_TOTAL_FILE_NUMBER반환 아니면 allowedMaxTotalFileNumber반
		allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
		//allowedMaxTotalFileNumber, 개별의 파일 사이즈가 0이면 MAX_EACH_FILE_SIZE반환 0이 아니면 allowedEachFileSize 반환
		allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
		//allowedTotalFileSize, 총 파일의 합이 0일경우 MAX_TOTAL_FILE_SIZE 반환 아니면 allowedTotalFileSize 반환
		
		if(checkUploadedTotalFileNumber(files, allowedMaxTotalFileNumber, filesCount, uploadedFilesCount) == false) { return false; }
		// 들어온 파일의 총 개수를 체크 
		
		
		for (var i=0; i<filesCount; i++) {
			if(checkUploadedExt(files[i].name, seq, allowedExtdiv) == false) { return false; }
			//checkUploadedExt는 확장자
			if(checkUploadedEachFileSize(files[i], seq, allowedEachFileSize) == false) { return false; }

			totalFileSize += files[i].size;
			
			filesArray.push(files[i]);
		}

		if(checkUploadedTotalFileSize(seq, totalFileSize, allowedTotalFileSize) == false) { return false; }
		
		if (uiType == 1) {
			for (var i=0; i<filesArray.length; i++) {
				var file = filesArray[i];

				var picReader = new FileReader();
			    picReader.addEventListener("load", addEventListenerCustom (objName, seq, i, file, filePreview, maxNumber));
			    picReader.readAsDataURL(file);
			}			
		} else if(uiType == 2) {
			for (var i = 0 ; i < filesCount ; i++) {
				addUploadLi(objName, seq, i, $("#" + objName +"")[0].files[i].name, filePreview, maxNumber);
			}
		} else if (uiType == 3) {
			var fileReader = new FileReader();
			 fileReader.onload = function () {
				 $("#uploadImgProfilePreview").attr("src", fileReader.result);		/* #-> */
			 }	
			 fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
		} else {
			return false;
		}
		return false;
	}
	
	
	addEventListenerCustom = function (objName, type, i, file, filePreview, maxNumber) { 
		// 업로드된 파일을 찍어주는 부분. 
		return function(event) {
			var imageFile = event.target;
			var sort = parseInt(maxNumber) + i;

			var divImage = "";
			divImage += '<div id="imgDiv_'+type+'_'+ sort +'" style="display: inline-block; height: 95px;">';
			divImage += '	<img src="'+ imageFile.result +'" class="rounded" width= "85px" height="85px">';
			divImage += '	<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv(0,' + type +','+ sort +')">X</span></div>';
			divImage += '</div> ';
			
			filePreview.append(divImage);
	    };
	}
	
	
	delImgDiv = function(objName, type, sort, deleteSeq, pathFile) {
		
		$("#imgDiv_"+type+"_"+sort).remove();
		
		var objDeleteSeq = $('input[name='+ objName +'DeleteSeq]');
		var objDeletePathFile = $('input[name='+ objName +'DeletePathFile]');

		if(objDeleteSeq.val() == "") {
			objDeleteSeq.val(deleteSeq);
		} else {
			objDeleteSeq.val(objDeleteSeq.val() + "," + deleteSeq);
		}
		
		
		if(objDeletePathFile.val() == "") {
			objDeletePathFile.val(pathFile);
		} else {
			objDeletePathFile.val(objDeletePathFile.val() + "," + pathFile);
		}
	}
	
	
	addUploadLi = function (objName, type, i, name, filePreview, maxNumber){
		/**
		objName :: 파일이름
		type :: ??
		i :: ??
		name :: ??
		filePreview :: ?? 
		 */

		var sort = parseInt(maxNumber) + i;
		
		var li ="";
		li += '<input type="hidden" id="'+ objName +'Process_'+type+'_'+ sort +'" name="'+ objName +'Process" value="1">';
		li += '<input type="hidden" id="'+ objName +'Sort_'+type+'_'+ sort +'" name="'+ objName +'Sort" value="'+ sort +'">';
		li += '<li id="li_'+type+'_'+sort+'" class="list-group-item d-flex justify-content-between align-items-center">';
		li += name;
		li +='<span class="badge bg-danger rounded-pill" onClick="delLi(0,'+ type +','+ sort +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
		li +='</li>';
		
		filePreview.append(li);
	}
	
	
	delLi = function(objName, type, sort, deleteSeq, pathFile) {
		
		/**
		deleteSeq :: ?
		pathFile :: ?
		 */
		
		$("#li_"+type+"_"+sort).remove();

		var objDeleteSeq = $('input[name='+ objName +'DeleteSeq]');
		var objDeletePathFile = $('input[name='+ objName +'DeletePathFile]');

		if(objDeleteSeq.val() == "") {
			objDeleteSeq.val(deleteSeq);
		} else {
			objDeleteSeq.val(objDeleteSeq.val() + "," + deleteSeq);
		}
		
		if(objDeletePathFile.val() == "") {
			objDeletePathFile.val(pathFile);
		} else {
			objDeletePathFile.val(objDeletePathFile.val() + "," + pathFile);
		}
	}
	
	openViewer = function (type, sort) {
		var str = '<c:set var="tmp" value="'+ type +'"/>';
		$("#modalImgViewer").append(str);
		$("#modalImgViewer").modal("show");
	}
	
	
	
	
// 이미지 전용
var extArray1 = new Array();
extArray1 = ["jpg","gif","png","jpeg","bmp","tif"];

// 문서관련
var extArray2 = new Array();
extArray2 = ["txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

// 이하는 커스텀
var extArray3 = new Array();
extArray3 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

var extArray4 = new Array();
extArray4 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

var extArray5 = new Array();
extArray5 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

var extArray6 = new Array();
extArray6 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

var extArray7 = new Array();
extArray7 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

var extArray8 = new Array();
extArray8 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];

var extArray9 = new Array();
extArray9 = ["jpg","gif","png","jpeg","bmp","tif","txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];	
	
	
	
	

