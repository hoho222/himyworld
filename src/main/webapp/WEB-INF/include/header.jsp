<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="/WEB-INF/include/topper.jsp" %>

<script type="text/javascript">
//The menu on the left
$(function() {
	$('nav#menu-left').mmenu();
});
</script>

</head>
<body>

<div>
	<div id="page">
		<div id="header">
			<a class="navicon" href="#menu-left"> </a>
		</div>
		<nav id="menu-left">
			<ul>
				<c:choose>
					<c:when test="${sessionId != 'null' && sessionName != 'null'}">
						<li><c:out value="${sessionId }"></c:out></li>
						<li><a href="${pageContext.request.contextPath}/logout.do"><span><i><input type="button" class="btnBasicSmall btnBasic_lime" onclick="validSubmit()" value="Logout"/></i></span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/join.do"><span><i><input type="button" class="btnBasicSmall btnBasic_purple" onclick="validSubmit()" value="Join Us"/></i></span></a></li>
						<li><a href="${pageContext.request.contextPath}/login.do"><span><i><input type="button" class="btnBasicSmall btnBasic_lime" onclick="validSubmit()" value="Login"/></i></span></a></li>
					</c:otherwise>
				</c:choose>
				
				<li><a href="${pageContext.request.contextPath}/BoardList.do?seq=1">Community</a></li>
				<li><a href="${pageContext.request.contextPath}/MyLocation.do?seq=1">Build Memory</a></li>
				<li><a href="${pageContext.request.contextPath}/admin_index.do">Management</a></li>
			</ul>
		</nav>
	</div>
	
	<!---start-header---->
	<div class="header">
		<div class="wrap">
		<div class="header-left">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/index.do">HI world</a>
			</div>
		</div>
		<div class="header-right">
			<div class="top-nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/BoardList.do?seq=1">Community</a></li>
					<li><a href="${pageContext.request.contextPath}/MyLocation.do?seq=1">Memory</a></li>
					<li><a href="${pageContext.request.contextPath}/admin_index.do">Manage</a></li>
				</ul>
			</div>
			<div class="sign-ligin-btns">
				<ul>
					<c:choose>
						<c:when test="${sessionId != 'null' && sessionName != 'null'}">
							<li><c:out value="${sessionId }"></c:out><a href="${pageContext.request.contextPath}/logout.do"><span><i><input type="button" class="btnBasicSmall btnBasic_lime" onclick="validSubmit()" value="Logout"/></i></span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/login.do"><span><i><input type="button" class="btnBasicSmall btnBasic_lime" onclick="validSubmit()" value="Login"/></i></span></a></li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		</div>
	</div>
	</div>
	
</div>


</body>
</html>