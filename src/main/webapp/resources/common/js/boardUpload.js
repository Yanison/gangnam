upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
	
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
			var uploadedFilesCount = document.querySelectorAll("#" + objName + "Preview > div > img").length;
			var tagIds = document.querySelectorAll("#" + objName + "Preview > div");
			
			for(var i=0; i<tagIds.length; i++){
				var tagId = tagIds[i].getAttribute("id").split("_");
				numbering.push(tagId[2]);
			}
			
			if(uploadedFilesCount > 0){
				numbering.sort();
				maxNumber = parseInt(numbering[numbering.length-1]) + parseInt(1);
			}
		} else if(uiType == 2){
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
		var filesCount = files.length;
		var filesArray = [];
		
		allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
		allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
		allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
		
		if(checkUploadedTotalFileNumber(files, allowedMaxTotalFileNumber, filesCount, uploadedFilesCount) == false) { return false; }
		
		for (var i=0; i<filesCount; i++) {
			if(checkUploadedExt(files[i].name, seq, allowedExtdiv) == false) { return false; }
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