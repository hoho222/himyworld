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
			<center>
			    <form id="frm">
				        <table style="border: 1px solid; border-collapse: collapse;">   
				        	<tr style="border: solid 1px ;">
				        		<th style="border: solid 1px ;">제목</th>
				        		<td style="border: 1px solid;"><input type="text" id="title" name="title" size="20"></td>
							</tr>
							
							<tr style="border: solid 1px ;">
				        		<th style="border: solid 1px ;">글쓴이명</th>
				        		<td style="border: 1px solid;"><input type="text" id="user_name" name="user_name" value="${sessionName}" readonly="readonly" size="20"></td>
							</tr>
							
							<tr style="border: solid 1px ;">
				        		<th style="border: solid 1px ;">글쓴이ID</th>
				        		<td style="border: 1px solid;"><input type="text" id="user_id" name="user_id" value="${sessionId}" readonly="readonly"></td>
							</tr> 
							
							<tr style="border: solid 1px ;">     
								<th style="border: solid 1px ;">내용</th>
								<td style="border: 1px solid;"><textarea id="contents" name="contents" rows="10" cols="20"></textarea></td>
							</tr> 
						</table>
			        
			        <br>
			        <input type="button" class="btnBasicSmall btnBasic_lime" onclick="goBack();" value="뒤로가기" />
			        <input type="button" class="btnBasicSmall btnBasic_purple" onclick="validSubmit()" value="작성하기"/>
			    </form>
			</center>
     	</div>
     </div>
</div>
    <%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
