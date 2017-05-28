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
				<h1><span>게시글</span> 보기</h1>
			</div>
			<br>
			<center>
				<form id="frm">
					<div class="w3-card-4" style="width:80%">
						<div class="w3-container w3-center">
						  	<h3>${detailMap.TITLE}</h3><br><br>
							<h4>${detailMap.CONTENTS}</h4><br><br>
							<h5 style="color:grey;">${detailMap.USER_NAME}(${detailMap.USER_ID})</h5>
							<h5 style="color:grey;">작성일 : ${fn:substring(detailMap.CREATE_DT,0,10)}</h5>
							<h5 style="color:grey;">조회수 : ${detailMap.HIT_CNT}</h5>
						    <div class="w3-section">
							    <input type="button" value="뒤로가기" onclick="history.back();" class="btnBasicSmall btnBasic_lime" />
							    <c:if test="${sessionId != 'null' && sessionName != 'null' && sessionId == detailMap.USER_ID}">
								    <a href="${pageContext.request.contextPath}/BoardEdit.do?idx=${detailMap.IDX}"><input type="button" value="수정하기" class="btnBasicSmall btnBasic_purple" /></a>
								    <a href="${pageContext.request.contextPath}/BoardDeleteState.do?idx=${detailMap.IDX}"><input type="button" value="삭제상태" class="btnBasicSmall btnBasic_lime" /></a>
								    <a href="${pageContext.request.contextPath}/BoardDelete.do?idx=${detailMap.IDX}"><input type="button" value="영구삭제" class="btnBasicSmall btnBasic_purple" /></a>
							    </c:if>
						   </div>
					 	</div>
					
					</div>
				 
			        <br>
			        
			    </form>
			</center>
	    </div>
	</div>
</div>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>