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
				<h1>Edit Detail</h1>
			</div>
			<br>
			<form id="frm">
		        <center>
			        <table style="border: 1px solid; border-collapse: collapse;">   
			        	<tr style="border: solid 1px ;">
		                    <th style="border: solid 1px ;">글 번호</th>
		                    <td style="border: solid 1px ;"><input type="hidden" id="idx" name="idx" value="${detailMap.IDX}"/>${detailMap.IDX}</td>
		                </tr>
						<tr style="border: solid 1px ;">
		                    <th style="border: solid 1px ;">작성일</th>
		                    <td style="border: solid 1px ;">${detailMap.CREATE_DT}</td>
		                </tr>
			        	<tr style="border: solid 1px ;">
			        		<th style="border: solid 1px ;">조회수</th>
			        		<td style="border: 1px solid;">${detailMap.HIT_CNT}</td>
						</tr>
						<tr style="border: solid 1px ;">
			        		<th style="border: solid 1px ;">글쓴이명</th>
			        		<td style="border: 1px solid;">${detailMap.USER_NAME}</td>
						</tr>
						<tr style="border: solid 1px ;">
			        		<th style="border: solid 1px ;">글쓴이ID</th>
			        		<td style="border: 1px solid;">${detailMap.USER_ID}</td>
						</tr>
		                <tr style="border: solid 1px ;">
			        		<th style="border: solid 1px ;">제목</th>
			        		<td style="border: 1px solid;"><input type="text" id="contents" name="contents" value="${detailMap.CONTENTS}"/></td>
						</tr>
						<tr style="border: solid 1px ;">     
							<th style="border: solid 1px ;">내용</th>
							<td style="border: 1px solid;"><input type="text" id="contents" name="contents" value="${detailMap.CONTENTS}"/></td>
						</tr> 
					</table>
				
		        <br>
		        <input type="button" onclick="goBack();" value="뒤로가기" class="btnBasicSmall btnBasic_lime"/>
		        <input type="button" onclick="validSubmit();" value="저장" class="btnBasicSmall btnBasic_purple"/>
		        </center>
		    </form>
		</div>
	</div>
</div>		    
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>