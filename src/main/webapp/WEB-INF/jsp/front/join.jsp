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
				<form name="joinFrm" id="joinFrm" action="joinAct.do">	
					<table>
						<tr>
							<td><input type="text" name="id" id="id" placeholder="ID"/></td>
						</tr>
						<tr>
							<td>
								<input type="password" name="password" id="password" placeholder="비밀번호 (영문자+숫자+특수문자 조합 8~16자리)" size="42"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="passwordRe" id="passwordRe" placeholder="비밀번호 확인"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="name" id="name" placeholder="이름 혹은 닉네임"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="birthyear" id="birthyear" maxlength="4" placeholder="생년(ex: 1990)" size="10"/>
								<input type="text" name="birthdate" id="birthdate" maxlength="4" placeholder="월일(ex: 1109)" size="10"/>
							</td> 
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
					<input type="submit" id="join" value="OK, Let's go!" class="btnBasicRound btnBasic_purple"/>
				</form>
			</center>
		</div>
	</div>
</div>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	var id = $("#id");
	var password = $("#password");
	var passwordRe = $("#passwordRe");
	var birthdate = $("#birthdate");
	var join = $("#join");
	
	var reg_bd = /^[0-9]*$/; //생일은 숫자만 가능.
	var reg_pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //비밀번호는 숫자, dud문자, 특수문자 포함하여 8~20 자리로 설정.
	
	birthdate.blur(function(){
		if(birthdate.val().length < 4){
			alert("생일은 최소 4자리 숫자로 입력해주세요.");
			birthdate.removeAttr('value');
	    	birthdate.focus();
		}
		
	    if (!reg_bd.test(birthdate.val())) { //숫자키만 입력
	    	alert("생일은 숫자로만 입력해주세요!");
	    	birthdate.removeAttr('value');
	    	birthdate.focus();
	    }
	});
	
	password.blur(function(){
		
		if(birthdate.val() && password.val().match(birthdate.val())){
			alert("비밀번호에 생일을 포함 할 수 없습니다.");
			password.removeAttr('value');
			password.focus();
		}
		
		if(id.val() && (password.val() == id.val() || password.val().match(id.val()))){
			alert("비밀번호에 아이디를 포함 할 수 없습니다!");
			password.removeAttr('value');
			password.focus();
		}
		
		if(!reg_pw.test(password.val())){
			alert("패스워드는 숫자, 영문자, 특수문자를 조합하여 8~16자리여야 합니다.");
			password.removeAttr('value');
			password.focus();
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
        } else {
			return true;
        }
	});
	
	passwordRe.blur(function() {
		if(password.val() != passwordRe.val()){
			$('font[name=passwordChk]').css("color", "red");
			$('font[name=passwordChk]').html("불일치! 확인 비밀번호를 재 입력해 주세요.");
			passwordRe.removeAttr('value');
			passwordRe.focus();
		} else if (password.val() != "" && password.val() == passwordRe.val()){
			$('font[name=passwordChk]').css("color", "black");
			$('font[name=passwordChk]').html("일치! 성공입니다.");
		}
	});
	
	join.click(function() {
		if(birthdate.val() != "" && id.val() != "" && password.val() != "" && passwordRe.val() != ""){
			alert("짝짝짝! 모든 조건을 만족하셨습니다!");
		} else {
			alert("공란이 있습니다. 모든 조건을 채워주세요.");
			return false;
		}
	});
	
});

</script>
<%@ include file="/WEB-INF/include/daumPostCode.jsp" %>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>