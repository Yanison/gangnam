<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	

<link href="/gangnam/resources/user/home/css/modal.css" rel="stylesheet">
<script src="/gangnam/resources/user/home/js/buildMySGW.js"></script>

<div class="selectCreatOption">
	<p>방만들기</p>
	<div class="inputDiv" id="sgwTitleDiv">
		<input type="text" id="sgwTitle" class="inputGroup" name="" placeholder="방제목" onkeyup="enableInputVal('#sgwTitle',$('#sgwTitle').val())">
	</div>
	<div class="pwDiv" id="sgwPwDiv">
		<label class="radioImgLabel" style="width: 60px;">
			<span style="color:#fff; margin-right:10px;">비공개</span>
			<input type="checkbox" id="" class="" name="pwAvailable" onclick="pwAvailable2()">
			<input type="hidden" id="isHidden" value="0">
		</label>
		<!-- <div class="pwInputDiv" style="display:none">
			<input type="text" id="sgwPw" class="inputGroup" name="" placeholder="비밀번호 설정">
			<input type="text" id="sgwPwChk" class="inputGroup" name="" placeholder="비밀번호 확인">
		</div> -->
	</div>
	<div class="inputDiv inputDiv" id="sgwMmNumberDiv">
		<select id="sgwMmNumber" class="inputGroup">
			<option value="">인원수</option>
			<option value="4">4</option>
			<option value="6">6</option>
			<option value="8">8</option>
		</select>
	</div>
	<div class="radioGroupDiv inputDiv" id="sgwAvatarDiv">
		<p>아바타 선택</p>
		<div class="radioGroup" id="sgwAvatar">
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="sgwAvatar" onclick="AcheckedRadio()" value="1">
				<img class="aRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="sgwAvatar" onclick="AcheckedRadio()" value="2">
				<img class="aRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="sgwAvatar" onclick="AcheckedRadio()" value="3">
				<img class="aRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
		</div>
	</div>
	<div class="radioGroupDiv inputDiv" id="sgwMapDiv">
		<p>맵 선택</p>
		<div class="radioGroup" id="sgwMap">
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="sgwMap" onclick="McheckedRadio()" value="1">
				<img class="mRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="sgwMap" onclick="McheckedRadio()" value="2">
				<img class="mRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="sgwMap" onclick="McheckedRadio()" value="3">
				<img class="mRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
		</div>
	</div>
	<input type="submit" id="submitCreate" onclick="valiForBuildingSgw()" class="inputGroup submitCreate" value="방 만들기">
	<buttn id="close" class="closeBtn" onclick="closeModal()" ><i class="fa-solid fa-x"></i></buttn>
</div>