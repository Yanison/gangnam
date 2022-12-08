
$(document).ready(function(){
connect()
})

function showModal(){
	var infrMmSeq = $('#sessMmSeq').val();
	if(infrMmSeq == ""){
		alert('로그인이 필요한 서비스입니다.')
	}else{
		$('#creatMySgWorld').click(function(){
			$('#modalDiv').fadeIn("fast")
		})
	}
	
	
}

function closeModal(){
	$('#modalDiv').fadeOut("fast")
}

var stompClient = null;

function connect(){
	var socket = new SockJS('/sgWorldService');
	stompClient = Stomp.over(socket)
	stompClient.connect({},function(frame){
		console.log('Connected: ' + frame);
		
		stompClient.subscribe('/topic/createSgworldDiv',function(createSgworldDiv){
			console.log(
				"SgwDao.selectSgwOne :: 최근 개설된 Sgworld 하나를 불러옵니다." + "\n"+
				"개설된 Sgworld 정보는 다음과 같습니다."+ "\n" +
				"방 시퀀스 :: " + createSgworldDiv.getSgwSeq() +"\n" +
				"방 이름 :: " + createSgworldDiv.getSgwTitle() +"\n" +
				"방 비공개여부 :: " +createSgworldDiv.getIsHidden()+ "\n" +
				"방 인원제한수 :: " +createSgworldDiv.getSgwMmNumber()+ "\n" +
				"방 맵 :: " + createSgworldDiv.getSgwMap()+"\n" +
				"방 링크 :: " + createSgworldDiv.getSgwLink()+"\n" +
				"방장 시퀀스//닉네임 :: "+createSgworldDiv.getInftMmSeq()+" // " +createSgworldDiv.getInftMmNickname()+ "\n" +
				"방 생성시간 :: " + "\n" + ""
			)
			addSGW(createSgworldDiv);
		})
		
		stompClient.subscribe('/topic/usersNum',function(howManyUsers){
			var howManyUsers = JSON.parse(howManyUsers.body);
			var endPoint =$('#'+howManyUsers.endPoint)
			console.log("howManyUsers :: "+JSON.stringify(howManyUsers))
			console.log("endPoint" + endPoint)
			$("#"+endPoint).text(howManyUsers.usersNum)
		})	
	})
}

function addSGW(sgwSeq){
	var html = "";
	html += '<div class="sgwSeqDiv'+sgwSeq+'"><a class="SgWorldPreview" id="sgwSeq'+sgwSeq+'" value="'+sgwSeq+'">'
	html += '<img scr="/resources/common/images/pepe.png">'
	html += '</a><div class="sgwTitle">'
	html += '<div>'
	html += '<i class="fa-solid fa-circle"></i>'
	html += '<span>title</span>'
	html += '</div>'
	html += '<div>'
	html += '<i class="fa-solid fa-eye"></i>'
	html += '<em class="usersNum">num</em>'
	html += '</div></div></div>'
	
	$('.container text-center').append(html).fast()
}

