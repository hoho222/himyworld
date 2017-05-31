<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.5.5/jquery.validate.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="/WEB-INF/include/topper.jsp" %>
<title>로그인</title>
<%@ include file="/WEB-INF/include/header.jsp" %>

<script type="text/javascript">
function validSubmit() {
	var id = $("#id");
	var name = $("#name");
	var password = $("#password");
	var passwordRe = $("#passwordRe");
	var birthyear = $("#birthyear");
	var birthdate = $("#birthdate");
	var join = $("#join");
	var isOverlapCheck = $("#isOverlapCheck");
	
	var reg_bd = /^[0-9]*$/; //생일은 숫자만 가능.
	var reg_pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //비밀번호는 숫자, dud문자, 특수문자 포함하여 8~20 자리로 설정.
	
	if(isOverlapCheck.val() != "Y"){
		alert("ID 중복 확인을 안했거나 중복된 이메일 입니다.\nID를 다시 확인해 주세요!");
		id.focus();
		return false;
	}
	
	if(birthdate.val() && password.val().match(birthdate.val())){
		alert("비밀번호에 생일을 포함 할 수 없습니다.");
		password.removeAttr('value');
		password.focus();
		return false;
	}
	
	if(id.val() && (password.val() == id.val() || password.val().match(id.val()))){
		alert("비밀번호에 아이디를 포함 할 수 없습니다!");
		password.removeAttr('value');
		password.focus();
		return false;
	}
	
	if(!reg_pw.test(password.val())){
		alert("패스워드는 숫자, 영문자, 특수문자를 조합하여 8~16자리여야 합니다.");
		password.removeAttr('value');
		password.focus();
		return false;
	}
	
	
	//연속된(동일한) 3자리 숫자, 영문자 입력 방지
	var passwordVal = password.val();
	var temp = "";
    var intCnt = 0;
    
     for ( var i = 0; i < passwordVal.length; i++ ) {
		temp = passwordVal.charAt(i);
		if ( temp == passwordVal.charAt(i+1) && temp == passwordVal.charAt(i+2) ) {
			intCnt += 1;
		}
     }
    
     if  ( intCnt > 0 ) {
     	alert("비밀번호에 동일한 문자를 연속 3번이상 쓸 수 없습니다.");
     	password.removeAttr('value');
		password.focus();
		return false;
     } 

     if(password.val() != passwordRe.val()){
	 alert("비밀번호와 비밀번호 확인이 다릅니다! 다시 입력해주세요.");
	 passwordRe.removeAttr('value');
	 passwordRe.focus();
	 return false;
	}
    
	if(birthdate.val().length < 4 || birthyear.val().length < 4){
		alert("생년, 월일은 최소 4자리 숫자로 입력해주세요.");
		birthdate.removeAttr('value');
    	birthdate.focus();
    	return false;
	}
	
    if (!reg_bd.test(birthdate.val()) || !reg_bd.test(birthyear.val())) { //숫자키만 입력
    	alert("생년, 월일은 숫자로만 입력해주세요!");
    	birthdate.removeAttr('value');
    	birthdate.focus();
    	return false;
    }
	
	if(birthdate.val() != "" && id.val() != "" && password.val() != "" && passwordRe.val() != "" && name.val() != ""){
		alert("회원가입 완료!");
	} else {
		alert("공란이 있습니다. 모든 조건을 채워주세요.");
		return false;
	}
	
	f.action = "joinAct.do";
	f.submit();
	
}

function overlapId() {
	//아이디 중복확인(ajax로 구현)
	var f = document.joinFrm;
	
    if(f.id.value == ""){
		alert('ID를 입력해주세요.');
		f.id.focus();
		return false;
	} else {
		$.ajax({  
			type : 'GET',
			data:"id="+ f.id.value,
		   dataType : 'text',
		   url : 'joinOverlap.do',  
		   success : function(rData, textStatus, xhr) {
			   if(rData == "true"){
			   	document.getElementById("emailOverlapFin").innerHTML = "<font color='#c1d288'>가능</font>";
			   	f.isOverlapCheck.value = "Y";
			   }else if(rData == "false"){
			   	document.getElementById("emailOverlapFin").innerHTML = "<font color='#E95192'>불가능</font>";
			   	f.isOverlapCheck.value = "N";
			   }
		   },
		   error : function(xhr, status, e) {  
		   		alert("데이터 Access 에러! 중복확인을 할 수 없습니다!\n다시 시도해 주세요.");
		   		console.log("중복확인 에러 원인 >> "+e);
		   }
		});  
	}
}

</script>

</head>
<body>
<div class="mid-grids">
	<div class="about">
		<div class="wrap">
			
			<div class="testimonial-head">
				<h1><span>Join </span>Us</h1>
			</div>
			<br>
			
			<center>
				<form name="joinFrm" id="joinFrm">	
					<table>
						<tr>
							<td>
								<input type="text" name="id" id="id" placeholder="* ID"/>
								
								<div style="float: right;">
									<input type="button" onclick="overlapId();" value="중복확인" class="btnBasicSmall btnBasic_lime">
									<input type="hidden" id="isOverlapCheck" name="isOverlapCheck" value="not" />
									<span id="emailOverlapFin">
										<font color="#E95192">ID 중복확인을 해주세요.</font>
									</span>
								</div>
								<br>
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="password" id="password" placeholder="* 비밀번호 (영문자+숫자+특수문자 조합 8~16자리)" size="42"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="passwordRe" id="passwordRe" placeholder="* 비밀번호 확인"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="name" id="name" placeholder="* 이름 혹은 닉네임"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="birthyear" id="birthyear" maxlength="4" placeholder="* 생년(ex: 1990)" size="10"/>
								<input type="text" name="birthdate" id="birthdate" maxlength="4" placeholder="* 월일(ex: 1109)" size="10"/>
							</td> 
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>
								남<input type="radio" name="gender" id="male" value="M"/>
								여<input type="radio" name="gender" id="female" value="F"/>
							</td> 
						</tr>
						<tr>
							<td> 
								<input type="text" name="postcode" id="postcode" placeholder="우편번호" size="5">
								<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" class="btnBasicSmall btnBasic_lime"><br>
								<input type="text" name="address" id="address" placeholder="주소" size="30">
								<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소" size="50">
							</td> 
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
						</tr>
					</table>
					<br>
					<input type="button" id="join" value="OK, Let's go!" class="btnBasicRound btnBasic_purple" onclick="validSubmit();"/>
				</form>
			</center>
		</div>
	</div>
</div>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>

<%@ include file="/WEB-INF/include/daumPostCode.jsp" %>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>