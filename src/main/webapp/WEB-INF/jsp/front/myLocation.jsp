<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/topper.jsp" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<body>

<div class="mid-grids">
	<div class="about">
		<div class="wrap">
		
			<div class="center">
				<div class="testimonial-head">
					<h1><span>Build </span>Memory</h1>
				</div>
				<br>
				<div id="map" style="width:800px;height:956.44px;float:left"></div>	
				
				<div id="info">
					<div id="clickLatlng"></div>
					<input type="button" class="btnBasicRound btnBasic_red" id="regLocation" onclick="regLocation();" value="좌표를 선택하려면 누르세요."/>
					<div>
						<form id="frm" name="frm" method="post" enctype="multipart/form-data">
							<input type="hidden" id="totalCnt" value="${totalCnt}"/>
							<input type="hidden" name="locationGB" id="locationGB" value="mylocation"/>
							<input type="hidden" name="lat" id="lat" value=""/>
							<input type="hidden" name="lng" id="lng" value=""/>
							<input type="text" name="title" id="title" value="" placeholder="제목"/>
							<input type="text" name="content" id="content" value="" placeholder="한줄내용"/>
							<input type="file" id="image" name="image"/>
							<input type="submit" class="btnBasicRoundSmall btnBasic_lime" value="save" onclick="validSubmit();"/>
						</form>
					
						<table style="border:1px solid #ccc; border-color: #a0a0a0;">
							
						    <colgroup>
						        <col width="10%"/>
						        <col width="15%"/>
						        <col width="30%"/>
						        <col width="20%"/>
						        <col width="10%"/>
						    </colgroup>
						    <thead>
						        <tr style="border:1px solid #ccc; border-color: #a0a0a0; background-color: #e4e4e4;">
						        	<th>작성자</th>
						            <th>제목</th>
						            <th>한줄내용</th>
						            <th>이미지</th>
						            <th>작성일</th>
						        </tr>
						    </thead>
						    <tbody>
						        <c:choose>
						            <c:when test="${fn:length(list) > 0}">
						                <c:forEach items="${list }" var="row">
						                    <tr style="border:1px solid #ccc; border-color: #a0a0a0;">
						                    	<td>${row.WRITER_ID }</td>
						                        <td><a href='#' onClick="goLocation(${row.LATITUDE},${row.LONGITUDE},'${row.TITLE}','${row.CONTENT}','${row.STORED_FILE_NAME}'); return false;">${row.TITLE }</a></td>
						                        <td>${row.CONTENT }</td>
						                        <td><img alt="${row.ORIGIN_FILE_NAME }" src="<c:url value='/resources/locationImgs/${row.STORED_FILE_NAME }'/>" style="width: 100px; height: 100px;" ></td>
						                        <td>${row.CREATE_DT }</td>
						                    </tr>
						                </c:forEach>
						            </c:when>
						            <c:otherwise>
						                <tr style="border:1px solid #ccc; border-color: #a0a0a0;">
						                    <td colspan="4">조회된 결과가 없습니다.</td>
						                </tr>
						            </c:otherwise>
						        </c:choose>
						        
						    </tbody>
						</table>
					
					
						<!-- 페이징 -->
						<div class="pagination">
							<!-- 시작페이지가 1부터면 이전 표시("<<") ​ 안함 -->
							<c:if test="${start-1 ==0 }">
							</c:if>
							
							<!-- 시작페이지가 1이 아니면 << 이전 표시.  링크는 시작페이지가 6부터 10까지일 경우 5페이지를 가르킴 -->​
							<c:if test="${start-1!=0 }">
								<a href="${pageContext.request.contextPath}/MyLocation.do?seq=${start-1}">&laquo;</a>
							</c:if>
							
							<!-- 5개씩 페이지 표시-->​
							<c:forEach var="i" begin="${start }" end="${end }">
								<c:choose>
									<c:when test="${seq == i}">
										<a class="current" href="MyLocation.do?seq=${i}">${i}</a>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/MyLocation.do?seq=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- end페이지 번호가 5, 10 인데 전체 페이지 갯수가 end페이지 보다 크면 다음 페이징 바로가기 표시  (">>")​ .-->​
							<c:if test="${end % 5 == 0 && pageNum > end}">
								<a href="${pageContext.request.contextPath}/MyLocation.do?seq=${end+1}">&raquo;</a>
							</c:if>
							
							<!-- 마지막 페이지 번호와 전체 페이지 번호가 같으면서 5개 단위가 아니면 다음바로가기 표시 안함 -->​​
							<c:if test="${end % 5 != 0 && end == pageNum }">
							</c:if>
						</div>
					</div>
				</div>
				<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a3b7348ff4e608fb9ec5837681929f00"></script>
			
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					    mapOption = { 
					        center: new daum.maps.LatLng(37.56699540822207, 126.978742762625), // 지도의 중심좌표
					        level: 10 // 지도의 확대 레벨
					    };
					
					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();
			
					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			
					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
					
					
					
					//함수 시작
					function validSubmit() {
						var f = document.getElementById("frm");
						
						if(f.title.value == ""){
							alert("제목을 입력해주세요.");
							f.title.focus();
							return false;
						}
						if(f.content.value == ""){
							alert("한줄내용을 입력해주세요.");
							f.content.focus();
							return false;
						}
						if(f.lat.value == "" || f.lng.value == ""){
							alert("지도에 장소가 선택되지 않았습니다. 먼저 마커를 움직여 위치를 지정해주세요.");
							return false;
						}
						
						f.action = '/hiworld/mylocation_act.do';
						f.submit(); 
						
					}
					
					function regLocation() {
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					    mapOption = { 
					        center: new daum.maps.LatLng(37.56699540822207, 126.978742762625), // 지도의 중심좌표
					        level: 4 // 지도의 확대 레벨
					    };
					
						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();
			
						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			
						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
						var marker = new daum.maps.Marker({ 
						    // 지도 중심좌표에 마커를 생성합니다 
						    position: map.getCenter() 
						}); 
						// 지도에 마커를 표시합니다
						marker.setMap(map);
						
						daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
						    
						    // 클릭한 위도, 경도 정보를 가져옵니다 
						    var latlng = mouseEvent.latLng; 
						    
						    // 마커 위치를 클릭한 위치로 옮깁니다
						    marker.setPosition(latlng);
						    
						    document.getElementById("lat").value = latlng.getLat();
						    document.getElementById("lng").value = latlng.getLng();
						    
						    
						});
					}
					
					function goLocation(lat, lng, infoTitle, infoContent, infoImage) {
						var mapContainer = document.getElementById('map'),   
					    mapOption = { 
					        center: new daum.maps.LatLng(lat, lng), // 클릭한 위치로 이동
					        level: 4 // 지도의 확대 레벨
					    };
					
						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();
			
						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			
						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
						    position: map.getCenter()
						});
			
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						
						var iwContent = '<div style="padding:5px; height:auto;">'+infoContent+'<br><a href="http://map.daum.net/link/to/'+infoTitle+','+lat+','+lng+'" style="color:blue" target="_blank">가보고싶어! 어떻게가는지 알려줘!(Click)</a><br><img src="<c:url value="/resources/locationImgs/'+infoImage+'"/>"></div>', 
					    iwPosition = new daum.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
			
						// 인포윈도우(마커에 설명)를 생성합니다
						var infowindow = new daum.maps.InfoWindow({
						    position : iwPosition, 
						    content : iwContent 
						});
						  
						// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
						infowindow.open(map, marker);
						
					}
					
					
				</script>
			
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
