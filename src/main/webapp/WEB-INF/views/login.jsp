<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/login.js" type="text/javascript"></script>
    <title>login</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="total">
<form action="/loginNormal" method="POST" onsubmit="return blackCheck()">
    <div id = "mainbox">
        <h2>로그인</h2>
        <div id="login">
            <p>이메일</p>
            <input type="text" id="userID" name="username" placeholder="이메일을 입력하세요">
            <p>비밀번호</p>
            <input type="password" id="userPW" name="password" placeholder="비밀번호를 입력하세요">
            <c:if test="${not empty loginFailMsg}">
                    <p style="color: red">${loginFailMsg}</p>
            </c:if>
            <input class="inputButton" type="submit" value="로그인" style="cursor: pointer;">
              <div id="btn">
                  <div><a onclick="location.href='/lgn002'" id="findId">아이디</a><a onclick="location.href='/lgn003'" id="findPw">/비밀번호 찾기</a></div>
                  <div><a href="javascript:join_popup()" id="join">회원가입</a></div>
              </div>
        </div>
    </div>
</form>
</div>
<%@include file="footer_ver2.jsp"%>
</body>
</html>