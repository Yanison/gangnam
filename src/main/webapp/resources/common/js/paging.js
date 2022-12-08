function goWhereYouWant(){
	location.href="../path"
}

/** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@ UserAdmin
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */
function goUserAdmin(){
	location.href="../userAdmin"
}

/** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@ User
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */

function goUser(){
	location.href="../"
	//  onclick="goUser()"
}
function goAdmin(){
	location.href="../../../admin/adminLogin"
	//  onclick="goAdmin()"
}

function goBoardHome(){
	location.href="../boardHome"
	//  onclick="goBoardHome()"
}

function gohome(){
	location.href="../"
}

function goboard(){
	location.href="../board/boardList"
}

function goWrite(){
	location.href="../board/boardWrite"
}

function goMemberView(){
	location.href="../member/memberView"
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
	location.href="../../../admin/avatar/infrAvatarForm"
	//  onclick="goAdminAvartForm()"
}
function goAdminAvartList(){
	location.href="../../../admin/avatar/infrAvatarList"
	//  onclick="goAdminAvartList()"
}
function goAdminAvartView(){
	location.href="../../../admin/avatar/infrAvatarView"
	//  onclick="goAdminAvartView()"
}

function goAdminCodeGroupList(){
	location.href ="../../../admin/codeGroup/infrCcgList"
	//  onclick="goAdminCodeGroupList()"
}

function goAdminCodeList(){
	location.href="../../../admin/code/infrCcList"
	//  onclick = "goAdminCodeList()"
}

function goAdminMemberList(){
	location.href = "../../../admin/memberGroup/infrMmList"
	//  onclick = "goAdminMemberList()"
}

function goAdminMetaversMap(){
	location.href="../../../admin/metaverse/infrMapList"
	// onclick = "goAdminMetaversMap()"
}

function goAdminBoardList(){
	location.href="../../../admin/board/infrBdList"
	// onclick = "goAdminBoardList()"
}