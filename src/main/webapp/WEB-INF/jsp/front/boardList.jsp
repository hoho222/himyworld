<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/topper.jsp" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
$(function() {
	addCellHeader(document.querySelector('.afternoon-session'));
});
</script>

</head>
<body>


<div class="mid-grids">
	<div class="about">
		<div class="wrap">
	
			<div>
				<div class="testimonial-head">
					<h1><span>Co</span>mmunity</h1>
					<input type="button" class="btnBasicRound btnBasic_purple" value="글 작성" onclick="location.href='BoardWrite.do'"/>
				</div>
				
				<div class="center">
					<p>총 <span style="color:#E95192;">${totalCnt}</span> 건의 글이 있습니다.</p>
				
					<table class="afternoon-session" cellspacing="1">
						<thead>
							<tr>
								<th scope="row" style="text-align:center;">제목</th>
								<th scope="row" style="text-align:center;">조회수</th>
								<th scope="row" style="text-align:center;">작성자ID</th>
								<th scope="row" style="text-align:center;">작성자명</th>
								<th scope="row" style="text-align:center;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
					            <c:when test="${fn:length(list) > 0}">
					                <c:forEach items="${list }" var="row">
					                    <tr>
					                    	<c:choose>
										        <c:when test="${fn:length(row.TITLE) > 10}">
													<td style="text-align:center;"><a href="${pageContext.request.contextPath}/BoardDetail.do?idx=${row.IDX}">${fn:substring(row.TITLE,0,9)}...</a></td>
												</c:when>
												<c:otherwise>
													<td style="text-align:center;"><a href="${pageContext.request.contextPath}/BoardDetail.do?idx=${row.IDX}">${row.TITLE }</a></td>
												</c:otherwise>
											</c:choose>
					                        <td style="text-align:center;">${row.HIT_CNT }</td>
					                        <td style="text-align:center;">${row.USER_ID }</td>
					                        <td style="text-align:center;">${row.USER_NAME }</td>
					                        <td style="text-align:center;">${fn:substring(row.CREATE_DT,0,10)}</td>
					                    </tr>
					                </c:forEach>
					            </c:when>
					            <c:otherwise>
					                <tr>
					                    <td colspan="3">조회된 결과가 없습니다.</td>
					                </tr>
					            </c:otherwise>
					        </c:choose>
						</tbody>
					</table>
				
				</div>
				
				<center>
					<div class="pagination">
						<!-- 시작페이지가 1부터면 이전 표시("<<") ​ 안함 -->
						<c:if test="${start-1 ==0 }">
						</c:if>
						
						<!-- 시작페이지가 1이 아니면 << 이전 표시.  링크는 시작페이지가 6부터 10까지일 경우 5페이지를 가르킴 -->​
						<c:if test="${start-1!=0 }">
							<a href="${pageContext.request.contextPath}/BoardList.do?seq=${start-1}"><span class="glyphicon glyphicon-backward"></span></a>
						</c:if>
						
						<!-- 5개씩 페이지 표시-->​
						<c:forEach var="i" begin="${start }" end="${end }">
							<c:choose>
								<c:when test="${seq == i}">
									<a class="current" href="BoardList.do?seq=${i}">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/BoardList.do?seq=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- end페이지 번호가 5, 10 인데 전체 페이지 갯수가 end페이지 보다 크면 다음 페이징 바로가기 표시  (">>")​ .-->​
						<c:if test="${end % 5 == 0 && pageNum > end}">
							<a href="${pageContext.request.contextPath}/BoardList.do?seq=${end+1}"><span class="glyphicon glyphicon-forward"></span></a>
						</c:if>
						
						<!-- 마지막 페이지 번호와 전체 페이지 번호가 같으면서 5개 단위가 아니면 다음바로가기 표시 안함 -->​​
						<c:if test="${end % 5 != 0 && end == pageNum }">
						</c:if>
					</div>
				</center>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
