<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="/resources/css/u_myp003.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q0a41zgk6j&submodules=geocoder"></script>
    <title>예약상세</title>
</head>
<body>
<div class="wrap">
    <div class="total">
        <c:choose>
            <c:when test="${mbd.b_state eq 0}">
                <div class="total_title">승인대기중</div>
            </c:when>
            <c:when test="${mbd.b_state eq 1}">
                <div class="total_title">예약완료</div>
            </c:when>
            <c:when test="${mbd.b_state eq 2}">
                <div class="total_title">예약실패</div>
            </c:when>
<%--            <c:when test="${mbd.b_state eq 3}">--%>
<%--                <div class="total_title">취소완료</div>--%>
<%--            </c:when>--%>
        </c:choose>
        <div class="content_one">
            <div>예약번호 ${mbd.b_no}</div>
            <div>숙소명 <a href="/house/detail/${mbd.gh_no}">${mbd.gh_name}</a></div>
        </div>
        <div class="content_two">
            <ul>
                <li>일정</li>
                <div>${mbd.b_in} ~ ${mbd.b_out}</div>
                <li>객실명</li>
                <div><a href="/room/getDetail/${mbd.r_no}">${mbd.r_name}</a></div>
                <li>${mbd.gh_name}에서 드리는글</li>
                <div>${mbd.r_title}</div>
                <li>전화번호</li>
                <div>${mbd.h_phone}</div>
            </ul>
        </div>
        <div class="second_title">오시는길</div>
        <div class="map" id="map" style="width:100%;height:500px;"></div>
        <div class="btn-area">
            <button class="btn" onclick="history.go(-1)">뒤로가기</button>
        </div>
    </div>
</div>
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

            if (item.englishAddress) {
                htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
            }

            infoWindow.setContent([//말풍선 크기 및 내용
                '<div style="padding:10px;min-width:200px;line-height:100%;">',
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
        searchAddressToCoordinate('${mbd.gh_addr1}');
    }
    naver.maps.onJSContentLoaded = initGeocoder;
    naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>
</body>
</html>
