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

<div class="mid-grids">
	<div class="about">
		<div class="wrap">
			<div class="testimonial-head">
				<h1>View Detail</h1>
			</div>
			<br>
			<center>
				<form id="frm">
			        <table style="border: 1px solid; border-collapse: collapse;">   
			        	<tr style="border: solid 1px ;">
		                    <th style="border: solid 1px ;">글 번호</th>
		                    <td style="border: solid 1px ;">${detailMap.IDX}</td>
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
		                    <th style="border: solid 1px ;">작성일</th>
		                    <td style="border: solid 1px ;">${detailMap.CREATE_DT}</td>
		                </tr>
		                <tr style="border: solid 1px ;">
			        		<th style="border: solid 1px ;">제목</th>
			        		<td style="border: 1px solid;">${detailMap.TITLE}</td>
						</tr>
						<tr style="border: solid 1px ;">     
							<th style="border: solid 1px ;">내용</th>
							<td style="border: 1px solid;">${detailMap.CONTENTS}</td>
						</tr> 
					</table>
			        <br>
			        <input type="button" value="뒤로가기" onclick="history.back();" class="btnBasicSmall btnBasic_lime" />
			        <a href="${pageContext.request.contextPath}/BoardEdit.do?idx=${detailMap.IDX}"><input type="button" value="수정하기" class="btnBasicSmall btnBasic_purple" /></a>
			        <a href="${pageContext.request.contextPath}/BoardDeleteState.do?idx=${detailMap.IDX}"><input type="button" value="삭제상태" class="btnBasicSmall btnBasic_lime" /></a>
			        <a href="${pageContext.request.contextPath}/BoardDelete.do?idx=${detailMap.IDX}"><input type="button" value="영구삭제" class="btnBasicSmall btnBasic_purple" /></a>
			    </form>
			</center>
	    </div>
	</div>
</div>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>