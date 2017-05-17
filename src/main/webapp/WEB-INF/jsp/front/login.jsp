<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="/WEB-INF/include/topper.jsp" %>
<title>Welcome~!</title>
<%@ include file="/WEB-INF/include/header.jsp" %>
</head>
<body>

<script>
function validSubmit() {
	var f = document.getElementById("frm");
	
	if(f.id.value == ""){
		alert("아이디를 입력해주세요!");
		f.id.focus();
		return false;
	}
	
	if(f.password.value == ""){
		alert("비밀번호를 입력해주세요!");
		f.password.focus();
		return false;
	}
	
	f.action = 'loginAct.do';
	f.submit();
}

$(function() {
	var returnMsg = document.getElementById("returnMsg").value;
	
	if(returnMsg != null && returnMsg != ''){
		alert(returnMsg);
	}
});

</script>
<!---start-mid-grids--->
<div class="mid-grids">
	<div class="about">
		<div class="wrap">
				<div class="testimonial-head">
					<h1><span>Log</span>in</h1>
					<br>
					<form id="frm">
					<input type="hidden" id="returnMsg" value="${returnMsg}"/>
						<input type="text" name="id" id="id" placeholder="Your Id"><br>
						<input type="password" name="password" id="password" placeholder="Your Password"><br>
					</form>
					<input type="button" value="Login" onclick="validSubmit();" class="btnBasicSmall btnBasic_lime">
					<input type="button" value="can U join US?" onclick="location.href='join.do'" class="btnBasicSmall btnBasic_purple">
					<br>
				</div>
			<div class="clear"> </div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>