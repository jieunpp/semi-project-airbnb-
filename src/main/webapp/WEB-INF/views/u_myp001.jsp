<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/h_myp005.css" />
    <title>마이페이지(user용)</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="total">
<section>
    <div class="main">
        <div class="info_u">
                <h4>개인정보</h4>
                <p class="m_bt">반갑습니다. ${user.u_nick}님</p>
                <p>성명 : ${user.u_name}</p>
                <p>성별 : ${user.u_gender}</p>
                <p>전화번호 : ${user.u_phone}</p>
                <p>email : ${user.u_mail}</p>
                <div class="btn_group">
                    <input type="button" value="정보변경" onclick="location.href='/user/mypage_user_info/${user.u_no}'"> &nbsp;&nbsp;&nbsp;
                </div>
        </div>
        <div class="booking_u">
                <h4>예약정보</h4>
                <p>${info.gh_name}</p>
                <p class="m_bt">예약자 : ${user.u_name}</p>
                <p>숙소명 : ${info.h_brand}</p>
                <P>체크 인 : ${info.b_in}</P>
                <P>체크 아웃 : ${info.b_out}</P>
                <p>위치 : ${info.gh_addr1}, ${info.gh_addr2}</p>
                <p>숙소연락처 : ${info.h_phone}</p>
                <div class="btn_group">
                    <input type="button" value="예약목록" onclick="location.href='/user/mypage_user_booking_list/'+${info.b_uno}">
                </div>
        </div>
    </div>
    <div class="space"></div>
</section>
</div>
</body>
</html>