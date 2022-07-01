<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <%--  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q0a41zgk6j"></script>--%>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q0a41zgk6j&submodules=geocoder"></script>
    <title>Title</title>
</head>
<body>
<div id="map" style="width:50%;height:500px;">
    <!-- 지도크기 수정 -->
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
        searchAddressToCoordinate('낙동북로 131');
    }

    naver.maps.onJSContentLoaded = initGeocoder;
    naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>
</body>
</html>
