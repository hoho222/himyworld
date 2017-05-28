<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/topper.jsp" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
</head>
<body>

<script>
function validSubmit() {
	var f = document.getElementById("frm");
	
	if(f.title.value == ""){
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	
	if(f.contents.value == ""){
		alert("내용을 입력해주세요.");
		f.contents.focus();
		return false;
	}
	
	f.action = '/hiworld/BoardWriteAct.do';
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
				<h1><span>게시글 </span>작성</h1>
			</div>
			<br>	
		    <form id="frm">
			    <p>      
				    <label class="w3-text-brown"><b>제목</b></label>
				    <input class="w3-input w3-border w3-sand" type="text" id="title" name="title" size="20">
			    </p>
			    <p>      
				    <label class="w3-text-brown"><b>글쓴이명</b></label>
				    <input type="text" class="w3-input w3-border w3-sand" id="user_name" name="user_name" value="${sessionName}" readonly="readonly" size="20">
				</p>
			    
			    <p>      
				    <label class="w3-text-brown"><b>글쓴이ID</b></label>
				    <input type="text" class="w3-input w3-border w3-sand" id="user_id" name="user_id" value="${sessionId}" readonly="readonly">
				</p>
				
				<p>      
				    <label class="w3-text-brown"><b>내용</b></label>
				    <textarea id="contents" class="w3-input w3-border w3-sand" name="contents" rows="10" cols="20"></textarea>
				</p>	
		        
		        <br>
		        <input type="button" class="btnBasicSmall btnBasic_lime" onclick="goBack();" value="뒤로가기" />
		        <input type="button" class="btnBasicSmall btnBasic_purple" onclick="validSubmit()" value="작성하기"/>
		    </form>
     	</div>
     </div>
</div>
    <%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
