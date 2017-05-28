<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/topper.jsp" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> </title>
</head>
<body>

<script>
function validSubmit() {
	var f = document.getElementById("frm");
	f.action = 'BoardEditAct.do';
	f.submit(); 
}

function goBack() {
	if(confirm("뒤로 가시겠습니까? 변경사항은 저장되지 않습니다.")){
		history.back();
	}
	
}
</script>

<div class="mid-grids">
	<div class="about">
		<div class="wrap">
			<div class="testimonial-head">
				<h1><span>게시글</span> 수정</h1>
			</div>
			<br>
			<form id="frm">
		        <center>
			    <input type="hidden" id="idx" name="idx" value="${detailMap.IDX}"/>      
			    <div class="w3-card-4" style="width:80%">
					<div class="w3-container w3-center">
						<br>
					  	<h4><span style="color:#c86288; font-size: large;">제목</span><input type="text" id="title" name="title" value="${detailMap.TITLE}"/></h4><br><br>
						<h4><span style="color:#c86288; font-size: large;">내용</span><input type="text" id="contents" name="contents" value="${detailMap.CONTENTS}"/></h4><br><br>
						<h5 style="color:grey;">${detailMap.USER_NAME}(${detailMap.USER_ID})</h5>
						<h5 style="color:grey;">작성일 : ${fn:substring(detailMap.CREATE_DT,0,10)}</h5>
						<h5 style="color:grey;">조회수 : ${detailMap.HIT_CNT}</h5>
					    <div class="w3-section">
						    <input type="button" onclick="goBack();" value="뒤로가기" class="btnBasicSmall btnBasic_lime"/>
		        			<input type="button" onclick="validSubmit();" value="저장" class="btnBasicSmall btnBasic_purple"/>
					   </div>
				 	</div>
				
				</div>
		        </center>
		    </form>
		</div>
	</div>
</div>		    
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>