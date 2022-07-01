<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header_ver2.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
</head>
<body>
<sec:authentication property="principal" var="session" />
<c:if test="${session ne 'anonymousUser'}">
    <sec:authentication property="principal.authInfo" var="user"/>
    <sec:authentication property="principal.authInfo.authValue.role" var="userType"/>
</c:if>
<header>
    <div class="imgbox">
        <div>
            <a href="/"><img src="${pageContext.request.contextPath}/resources/img/gnb-logo.png" alt="logo" ></a>
        </div>
        <div class="navbox">
            <div class="dropdown">
                <button class="dropbtn" onclick="location.href='/'">HOME</button>/
            </div>
            <div class="dropdown">
                <button class="dropbtn" onclick="location.href='/house/searchValue?local='">숙소둘러보기</button>/
            </div>
            <c:choose>
            <c:when test="${userType eq 'HOST'}">
                <div class="dropdown">
                    <button class="dropbtn" onclick="location.href='/host/mypage_host/${user.h_no}'">마이 페이지</button>/
                </div>
            </c:when>
            <c:when test="${userType eq 'USER'}">
                <div class="dropdown">
                    <button class="dropbtn" onclick="location.href='/user/mypage_user/${user.u_no}'">마이 페이지</button>/
                </div>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${empty user}">
            <div class="dropdown">
                <button class="dropbtn" onclick="location.href='/login'">로그인</button>
            </div>
            </c:when>
                <c:otherwise>
                    <div class="dropdown">
                        <button class="dropbtn" onclick="location.href='/logout'">logout</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
<!-- 공간 비우기용-->
<div class="space"></div>
</body>
</html>