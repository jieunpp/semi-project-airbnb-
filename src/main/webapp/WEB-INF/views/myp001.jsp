<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myp001.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약리스트(user)</title>
</head>
<body>
<%@ include file="header.jsp"%>
<h1 class="main_title">${myBookList.get(0).u_nick} 님의 예약내역리스트</h1>
<div class="list_total">
<c:forEach items="${myBookList}" var="mbl" varStatus="status">
    <ul class="used_list" >
        <div>
            <li class="card_item">
                <div class="card_header">
                    <a href="/user/mypage_user_booking_detail/${mbl.b_no},${mbl.u_no}" class="service_link" STYLE="color: black;">
                        <div class="title">${mbl.gh_name}</div>
                        <div class="info_box">
                            <span class="info">${mbl.b_in} ~ ${mbl.b_out}</span>
                            ( ${mbl.b_out.date - mbl.b_in.date}박 ${(mbl.b_out.date - mbl.b_in.date)+1}일)
                        </div>
                    </a>
                </div>
                <div class="card_body">
                    <a href="/user/mypage_user_booking_detail/${mbl.b_no},${mbl.u_no}" class="upper_box">
                        <div class="review_area">
                            <div class="review_header">
                            <c:choose>
                                <c:when test="${mbl.b_state == 0}">
                                    <div class="text" style="color: #666;">승인대기중</div>
                                </c:when>
                                <c:when test="${mbl.b_state == 1}">
                                    <div class="text">예약완료</div>
                                </c:when>
                                <c:when test="${mbl.b_state == 2}">
                                    <div class="text" style="color: #666; text-decoration: line-through;">예약실패</div>
                                </c:when>
                                <c:when test="${mbl.b_state == 3}">
                                    <div class="text">예약취소</div>
                                </c:when>
                            </c:choose>
                            </div>
                        </div>
                    </a>
                    <div class="lower_box">
                        <div class="info">
                            <div class="title_">${mbl.r_name}</div>
                        </div>
                        <div class="price">
                            결제금액 <fmt:formatNumber value="${mbl.r_fee * (mbl.b_out.date - mbl.b_in.date)}" pattern="#,###" />원
                        </div>
                        <button class="info_btn" onclick="location.href='/user/mypage_user_booking_detail/${mbl.b_no},${mbl.u_no}'">상세보기</button>
                    </div>
                </div>
            </li>
        </div>
    </ul>
</c:forEach>
</div>
<%--<%@include file="footer_ver2.jsp"%>--%>
</body>
</html>
