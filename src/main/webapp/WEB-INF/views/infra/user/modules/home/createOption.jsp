<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	

<link href="./resources/user/home/css/modal.css" rel="stylesheet">
<script src="./resources/user/home/js/modal.js"></script>

<div class="selectCreatOption">
	<p>방만들기</p>
	<input type="text" id="" class="inputGroup" name="" placeholder="방제목">
	<div class="pwDiv">
		<label class="radioImgLabel">
			<span style="color:#fff; margin-right:10px;">비밀번호 설정</span>
			<input type="checkbox" id="" class="" name="pwAvailable" onclick="pwAvailable()">
		</label>
		<div class="pwInputDiv" style="display:none">
			<input type="text" id="" class="inputGroup" name="" placeholder="비밀번호 설정">
			<input type="text" id="" class="inputGroup" name="" placeholder="비밀번호 확인">
		</div>
	</div>
	<select id="" class="inputGroup" name="">
		<option>인원수</option>
		<option value="4">4</option>
		<option value="6">6</option>
		<option value="8">8</option>
	</select>
	<div class="radioGroupDiv">
		<p>아바타 선택</p>
		<div class="radioGroup">
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="avaratSelect" onclick="AcheckedRadio()" value="1">
				<img class="aRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="avaratSelect" onclick="AcheckedRadio()" value="2">
				<img class="aRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="avaratSelect" onclick="AcheckedRadio()" value="3">
				<img class="aRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
		</div>
	</div>
	
	<div class="radioGroupDiv">
		<p>맵 선택</p>
		<div class="radioGroup">
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="mapSelect" onclick="McheckedRadio()" value="1">
				<img class="mRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="mapSelect" onclick="McheckedRadio()" value="2">
				<img class="mRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
			<label class="radioImgLabel">
				<input type="radio" id="" class="" name="mapSelect" onclick="McheckedRadio()" value="3">
				<img class="mRadioImg radioImg" src="./resources/common/images/pepe.png"/>
			</label>
		</div>
	</div>
	<input type="submit" id="submitCreate" onclick="goSgWorld()" class="inputGroup submitCreate" value="방 만들기">
	<buttn id="close" class="closeBtn" onclick="closeModal()" ><i class="fa-solid fa-x"></i></buttn>
</div>