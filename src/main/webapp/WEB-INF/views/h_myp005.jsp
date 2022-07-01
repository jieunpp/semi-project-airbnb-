<link rel="stylesheet" type="text/css" href="/resources/css/h_myp005.css"/>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(host용)</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="total">
<section>
    <div class="main">
        <div class="info">
            <h4>개인정보</h4>
            <p class="m_bt">반갑습니다. ${user.h_name}님</p>
            <p>사업자명 : ${user.h_brand}</p>
            <p>전화번호 : ${user.h_phone}</p>
            <p>email : ${user.h_mail}</p>
            <div class="btn_group">
                <input type="button" value="수정하기" onclick="location.href='/host/host_myGhouse/${user.h_no}'">
            </div>
        </div>
        <div class="booking">
            <h4>사업장 정보</h4>
            <p class="m_bt">${gh.gh_name}</p>
            <p>위치 : ${gh.gh_addr1}</p>
            <p>등록 연락처: ${user.h_phone}</p>
            <div class="btn_group">
                <input type="button" value="수정하기"  onclick="location.href='/host/mypage_house_info/${user.h_no}'">
            </div>
        </div>
    </div>
    <div class="space"></div>
</section>
</div>
</body>
</html>