<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slp002.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.toy.project.dto.House" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q0a41zgk6j&submodules=geocoder"></script>
    <title>하우스 정보 + 방 정보(user용)</title>
</head>
<body>
<%@ include file="header_ver2.jsp"%>
<div class="main_content">
    <div class="header">
        <c:choose>
        <c:when test="${fn:length(griList) ne 0}">
        <div class="house_name">${griList.get(0).gh_name}</div>
    </div>
    <div class="intro">
        <div class="intro_text">&nbsp;　${griList.get(0).gh_title}</div>
        <div class="intro_juso"><img src="${pageContext.request.contextPath}/resources/img/img-marker-w.png" alt="헤더배경">&nbsp;${griList.get(0).gh_addr1} ${griList.get(0).gh_addr2}&nbsp;</div>
    </div>
</div>
<section>
    <div class="list_content">
        <div class="list_title"></div>
        <ul class="product_list">
            <div>
            <li style="border: 0; margin: 2px;">
                <dl>
                    <dd class="img" style="position: absolute; width: 300px; height: 340px;" >
                        <img class="letter_din"  src="${pageContext.request.contextPath}/resources/img/img-tit-room.png" alt="부산" >
                        <p class="line"></p>
                        <p class="house_area">${griList.get(0).gh_name}</p>
                        <p class="descr" >${griList.get(0).gh_detail}</p>
                    </dd>
                </dl>
            </li>
            </div>
            <div class="array_list">
            <c:forEach items="${griList}" var="gri" varStatus="status">
                <li>
                    <dl>
                        <dd class="img">
                            <img src="${pageContext.request.contextPath}/resources/room_image/${gri.i_name}" alt="객실이미지" style="width: 408px; height: 396px;"><!-- style=" width:370px; height: 360px;-->
                            <div class="info_room"></div>
                            <div class="info_room2">${gri.r_name}</div>
                            <div class="info_room3">₩ <fmt:formatNumber value="${gri.r_fee}" pattern="#,###" /></div>
                            <div class="info_room4">${gri.r_title}</div>
                            <div class="info_room5">기준 ${gri.r_per} 인</div>
                            <c:choose>
                                <c:when test="${userType eq 'HOST'}">
                                    <p style="text-align: center"  class="rev_btn1">user계정으로 예약하실 수 있습니다.</p>
                                </c:when>
                                <c:when test="${userType eq 'USER'}">
                                    <button class="rev_btn2" onclick="location.href='/room/getDetail/${gri.r_no}'">예약하기</button>
                                    <%--                                <a href="/room/getDetail/${gri.r_no}" class="btn2">예약하기</a>--%>
                                </c:when>
                            </c:choose>
                            <c:choose>
                            <c:when test="${empty user}">
                                <p style="text-align: center" class="rev_btn1">로그인 후 예약하실 수 있습니다.</p>
                            </c:when>
                            </c:choose>
                        </dd>
                    </dl>
                </li>
            </c:forEach>
            </div>
        </ul>
    </div>
    <div id="map_css">
        <div id="map" style="width: 100%; height: 380px;">
            <!-- 지도크기 수정 -->
        </div>
    </div>
</section>
<script>
    var map = new naver.maps.Map("map", {
        center: new naver.maps.LatLng(37.3595316, 127.1052133),
        zoom: 15,
        mapTypeControl: true
    });

    var infoWindow = new naver.maps.InfoWindow({
        anchorSkew: true
    });

    function searchAddressToCoordinate(address) {
        naver.maps.Service.geocode({
            query: address
        }, function(status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
                return alert('Something Wrong!');
            }

            if (response.v2.meta.totalCount === 0) {
                return alert('totalCount' + response.v2.meta.totalCount);
            }

            var htmlAddresses = [],
                item = response.v2.addresses[0],
                point = new naver.maps.Point(item.x, item.y);

            if (item.roadAddress) {
                htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
            }

            if (item.jibunAddress) {
                htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
            }

            infoWindow.setContent([//말풍선 크기 및 내용
                '<div style="padding:10px; width:330px; line-height:100%;">',
                '<h2>오시는길</h2>',
                '<br>',
                '<h4 style="margin-top:5px;">위치 : '+ address +'</h4><br />',
                htmlAddresses.join('<br />'),
                '</div>'
            ].join('\n'));

            map.setCenter(point);
            infoWindow.open(map, point);
        });
    }

    function initGeocoder() {
        if (!map.isStyleMapReady) {
            return;
        }
        //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@주소 입력할 부분@@@@@@@@@@@@@@@@@@@@@
        searchAddressToCoordinate('${griList.get(0).gh_addr1}');
    }

    naver.maps.onJSContentLoaded = initGeocoder;
    naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>
</c:when>
</c:choose>
<%@include file="footer.jsp"%>
</body>
</html>