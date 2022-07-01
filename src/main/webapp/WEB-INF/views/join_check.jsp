<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join_check.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="resources/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/login.js" charset="utf-8"></script>
    <title>회원가입 회원구분</title>
</head>
<body>
<div id="total">
    <div id="user">
        <a href="javascript:user()">
            <img src="${pageContext.request.contextPath}resources/img/user.png" alt="user">
        </a>
        <p>고객입니다.</p>
    </div>
    <div id="host">
        <a href="javascript:host()">
            <img src="${pageContext.request.contextPath}resources/img/host.png" alt="host">
        </a>
        <p>호스트입니다.</p>
    </div>
</div>
</body>
</html>