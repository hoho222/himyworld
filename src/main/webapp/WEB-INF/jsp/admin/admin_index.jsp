<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="/WEB-INF/include/topper.jsp" %>
<title>관리자</title>
<%@ include file="/WEB-INF/include/header.jsp" %>

<script type="text/javascript">
function ing() {
	alert("준비중입니다!");
	return false;
}
</script>

</head>
<body>

<div class="mid-grids">
	<div class="about">
		<div class="wrap">
			<div class="testimonial-head">
				<h1><span>Management</span> Page</h1>
				<br>
				<button class="movingBtn movingBtn_pink" style="vertical-align:middle" onclick="location.href='admin_banner.do'"><span>배너 관리</span></button>
				<button class="movingBtn movingBtn_lime" style="vertical-align:middle" onclick="ing();"><span>기타 관리</span></button>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/include/footer.jsp" %>	

</body>
</html>