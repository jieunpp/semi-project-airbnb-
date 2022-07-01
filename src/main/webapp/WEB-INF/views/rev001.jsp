<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rev001.css" />
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약정보확인</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="total">
    <form class="mainbox" name="form" action="/book/booking/${Info.u_no},${Info.r_no}" method="post">
        <h1>고객님의 예약정보를 확인해주세요!</h1>
        <h3>${Info.gh_name} - ${Info.r_name}</h3>
        <div class="img-table">
            <table>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/resources/gh_image/${Info.gh_image}" class="room"></td>
                </tr>
            </table>
        </div>
        <h4><img src="/resources/img/img-marker-w.png" class="addr">${Info.gh_addr1}, ${Info.gh_addr2}</h4>
        <div class="info-table">
<%--            <form>--%>
                <input type="hidden" value="${Info.b_pno}" name="b_pno">
                <input type="hidden" value="${Info.b_in}" name="b_in">
                <input type="hidden" value="${Info.b_out}" name="b_out">
                <input type="hidden" value="${Info.r_fee * (Info.b_out.date - Info.b_in.date)}" name="b_price">
                <table  border="1" class="info" >
                    <tr style="background-color: #f5f5f5">
                        <th class="title">연락처</th>
                        <th class="title">예약자</th>
                        <th class="title">인원</th>
                        <th class="title">체크인</th>
                        <th class="title">체크아웃</th>
                    </tr>
                    <tr >
                        <td>${Info.u_phone}</td>
                        <td>${Info.u_nick}</td>
                        <td>${Info.b_pno}</td>
                        <td>${Info.b_in}</td>
                        <td>${Info.b_out}</td>
                    </tr>
                </table>
<%--            </form>--%>
        </div>
        <div class="price-table">
            <table  border="1" class="price">
                <thead>
                <tr>
                    <td class="tg-0pky" rowspan="2" style="background-color: #f5f5f5" id="ti_fon">결제요금내역</td>
                    <td class="tg-0lax">${Info.r_name}</td>
                    <td class="size_a">₩<fmt:formatNumber value="${Info.r_fee}" pattern="#,###" /></td>
                </tr>
                <tr>
                    <td class="tg-0lax">금액 (전체 일자)</td>
                    <td class="size_a" colspan="3">₩<fmt:formatNumber value="${Info.r_fee * (Info.b_out.date - Info.b_in.date)}" pattern="#,###" /></td>
<%--                    <td class="size_a" colspan="3">₩${Info.r_fee * (Info.b_out.date - Info.b_in.date)}</td>--%>
                </tr>
                </thead>
            </table>
        </div>
        <br>
        <div class="btn" style="display: flex; justify-content: center;">
            <button type="submit" class="btn-m" style="margin-right: 100px;">예약하기</button>
            <input type="button" class="btn-m" onclick="history.back()" value="취소"/>
        </div>
    </form>
        <div class="space"></div>
    </div>
</body>
</html>