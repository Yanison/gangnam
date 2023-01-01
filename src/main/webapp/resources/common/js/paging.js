function goWhereYouWant(){
	location.href=="/gangnam/path"
}

/** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@ UserAdmin
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */
function goUserAdmin(){
	location.href=="/gangnam/userAdmin"
}

/** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@ User
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */

function goUser(){
	location.href=="/gangnam/"
	//  onclick="goUser()"
}
function goAdmin(){
	location.href=="/gangnam/../../admin/adminLogin"
	//  onclick="goAdmin()"
}

function goBoardHome(){
	location.href=="/gangnam/boardHome"
	//  onclick="goBoardHome()"
}

function gohome(){
	location.href=="/gangnam/"
}

function goboard(){
	location.href=="/gangnam//board/boardList"
}

function goWrite(){
	location.href=="/gangnam/board/boardWrite"
}

function goMemberView(){
	var mmSeq = $('#sessMmSeq').val()
	//location.href=="/gangnam//member/memberView?infrMmSeq="+mmSeq
}

function goMp(){
	var mmSeq = $('#sessMmSeq').val()
	//location.href=="/gangnam//member/memberView?infrMmSeq="+mmSeq
}
//var goUrlView = "/member/memberView";
//var form = $("form[name=form]");
//var seq = $("input:hidden[name=infrMmSeq]");

//goMemberView = function(keyValue) {
//	seq.val(keyValue);
//	form.attr("action", goUrlView).submit();
//}

/** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@ Amin
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */
 
//avatar
function goAdminAvartForm(){
	location.href=="/gangnam//../../admin/avatar/infrAvatarForm"
	//  onclick="goAdminAvartForm()"
}
function goAdminAvartList(){
	location.href=="/gangnam//../../admin/avatar/infrAvatarList"
	//  onclick="goAdminAvartList()"
}
function goAdminAvartView(){
	location.href=="/gangnam//../../admin/avatar/infrAvatarView"
	//  onclick="goAdminAvartView()"
}

function goAdminCodeGroupList(){
	location.href =="/gangnam//../../admin/codeGroup/infrCcgList"
	//  onclick="goAdminCodeGroupList()"
}

function goAdminCodeList(){
	location.href=="/gangnam//../../admin/code/infrCcList"
	//  onclick = "goAdminCodeList()"
}

function goAdminMemberList(){
	location.href = "/gangnam//../../admin/memberGroup/infrMmList"
	//  onclick = "goAdminMemberList()"
}

function goAdminMetaversMap(){
	location.href=="/gangnam//../../admin/metaverse/infrMapList"
	// onclick = "goAdminMetaversMap()"
}

function goAdminBoardList(){
	location.href=="/gangnam//../../admin/board/infrBdList"
	// onclick = "goAdminBoardList()"
}