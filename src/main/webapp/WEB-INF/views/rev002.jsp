<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rev002.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약완료</title>
</head>
<body>
<%@include file="header_ver2.jsp"%>
<div class="main_aaa">
    <h1>고객님의 예약이 신청되었습니다.</h1>
    <h3>확정까지 평균 소요 시간 <span class="red">10분 이내</span></h3>
    <h1>업체에서 예약을 확정하는 대로 마이페이지에서 알려드리겠습니다.</h1>
    <div class="btn">
        <button onclick="location.href='/'" class="rev_bt">메인으로</button>
        <button onclick="location.href='/user/mypage_user_booking_list/${user.u_no}'" class="rev_bt">예약내역 확인하기</button>
    </div>
</div>
<%@include file="footer_ver2.jsp"%>
</body>
</html>