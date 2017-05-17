<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ include file="/WEB-INF/include/topper.jsp" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<script>
function validSubmit() {
	var f = document.getElementById("frm");
	
	f.action = '/hiworld/admin_banner_act.do';
	f.submit(); 
}

function del(idx) {
	var f = document.bannerFrm;
	var check = confirm("일련번호 : " + idx + "인 배너를 삭제 하시겠습니까?");
	if(check) {
		f.idx.value = idx;
		f.action = '/hiworld/admin_banner_delete.do';
		f.submit();
	}
}

$(function() {
    $( "#startdate" ).datepicker({ 
    	dateFormat: 'yy-mm-dd',
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달' 
   	});
    
    $( "#enddate" ).datepicker({ 
    	dateFormat: 'yy-mm-dd',
   		changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달' 
   	});
});

$(function() {
	addCellHeader(document.querySelector('.afternoon-session'));
});
</script>

</head>
<body>

<div class="mid-grids">
	<div class="about">
		<div class="wrap">
			<div class="testimonial-head">
				<h1><span>Management</span> Banner</h1>
			</div>
			<br>
			<center>
				<form action="/hiworld/admin_banner_act.do" id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="locationGB" id="locationGB" value="banner"/>
					<table border="1">
						<tr>
							<td>이동할 URL</td>
							<td><input type="text" name="gourl"/></td>
						</tr>
						<tr>
							<td>배너이미지</td>
							<td><input type="file" id="fileuploader" name="fileuploader"/></td>
						</tr>
						<tr>
							<td>게시 날짜</td>
							<td><input type="text" id="startdate" name="startdate"/> ~ <input type="text" id="enddate" name="enddate"/></td>
						</tr>
						<tr>
							<td>노출 상태</td>
							<td>
								진열<input type="radio" id="display_Y" name="display_yn" value="Y"/>
								미진열<input type="radio" id="display_N" name="display_yn" value="N"/>
							</td>
						</tr>
					</table> 
					<input type="submit" value="등록" class="btnBasicSmall btnBasic_purple"/>
				</form>
			</center>
			
			<br><br>
			<h2>배너 리스트</h2>
			<form name="bannerFrm">
				<input type="hidden" name="idx"/>
				<table class="afternoon-session" cellspacing="1">
					<thead>
					    <tr>
					        <th scope="row">URL</th>
					        <th scope="row">이미지명</th>
					        <th scope="row">게시일</th>
					        <th scope="row">관리</th>
					    </tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${fn:length(bannerList) > 0}">
								<c:forEach items="${bannerList }" var="banner">
								
									<tr>
										<td>${banner.GO_URL }</td>
										<td>${banner.ORIGINAL_FILE_NAME }</td>
										<td>${banner.STARTDATE } ~ ${banner.ENDDATE }</td>
										<td>
											<input type="button" class="btnBasicSmall btnBasic_purple" onclick="del(${banner.IDX });" value="삭제"/>
										</td>
									</tr>
								
						    	</c:forEach>
							</c:when>
						
							<c:otherwise>
						        <td>등록한 배너가 없습니다. 배너를 등록해주세요.</td>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>