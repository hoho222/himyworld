<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="/WEB-INF/include/topper.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>" />
<title>Welcome~!</title>
<%@ include file="/WEB-INF/include/header.jsp" %>
</head>
<body>
<div class="mid-grids">
	<c:choose>
		<c:when test="${fn:length(bannerList) > 0}">
			<div class="text-slider">
				<div class="wrap"> 
					<div id="da-slider" class="da-slider">
					    <c:forEach items="${bannerList }" var="banner">
					    	
					    	<!---start-da-slider----->
							
									<div class="da-slide">
										<h2><a href="${banner.GO_URL }" target="_blank"><img alt="${banner.ORIGINAL_FILE_NAME }" src="<c:url value='/resources/banners/${banner.STORED_FILE_NAME }'/>" ></a></h2>
									</div>
									<nav class="da-arrows">
										<span class="da-arrows-next"> </span>
									</nav>
							
						
							<script type="text/javascript" src="js/jquery.cslider.js"></script>
							<script type="text/javascript">
								$(function() {
									$('#da-slider').cslider({
										autoplay	: true,
										bgincrement	: 350
									});
								
								});
							</script>
					    	
					    </c:forEach>
			    	</div>
		    	</div>
	    	</div>
		</c:when>
		<c:otherwise>
		        NO BANNER
		</c:otherwise>
	</c:choose>
</div>

<div class="mid-grids">	
	<div class="about">
		<!-- 웹 소개 -->
		<div class="wrap">
			<h1>About <span>Hiworld</span></h1>
			<div id="people" class="panels">
				<div class="panel-left">
					<span> </span>
				</div>
				<div class="panel-right">
					<h3>Awesome <span>Hiworld</span> Web and MobileWeb!</h3>
					<p>개인 공부 겸 취미활동을 위한 나만의, 나만을 위한 사이트입니다.</p>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
	</div>
</div>

<div class="mid-grids">
	<div class="about">
		<!-- 내소개 -->
		<div class="testimonial-head">
			<h1><span>Hiworld</span> 구성원</h1>
			<p>Hiworld를 만든 사람들</p>
		</div>
		<div class="testimonial-grids">
			<div class="testimonial-grid">
				<a href="#"><img src="<c:url value='/resources/images/developer.jpg'/>" title="developer" /></a>
				<p>PM은 나야 나</p>
				<a href="#">KyungEun, CHOI</a>
			</div>
			<div class="testimonial-grid">
				<a href="#"><img src="<c:url value='/resources/images/developer2.jpg'/>" title="developer2" /></a>
				<p>개발자도 나야 나!!</p>
				<a href="#">KyungEun, CHOI</a>
			</div>
			<div class="testimonial-grid">
				<a href="#"><img src="<c:url value='/resources/images/designer.png'/>" title="designer" /></a>
				<p>디자인은 W3layouts.com</p>
				<a href="#">W3layouts.com</a>
			</div>
			<div class="clear"> </div>
		</div>
	</div>	
</div>

<%@ include file="/WEB-INF/include/footer.jsp" %>

</body>
</html>